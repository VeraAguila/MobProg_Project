import json
import boto3
from datetime import datetime
from decimal import Decimal

dynamodb = boto3.resource('dynamodb')
table_name = 'MovieReview' 
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    try:
        body = json.loads(event['body'])
    except (KeyError, json.JSONDecodeError):
        return {
            'statusCode': 400,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json'
            },
            'body': json.dumps({'message': 'Invalid input, expected JSON body'})
        }

    required_fields = ['SK', 'userId', 'movieId', 'content', 'rating']
    if not all(field in body for field in required_fields):
        return {
            'statusCode': 400,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json'
            },
            'body': json.dumps({'message': f'Missing one of required fields: {required_fields}'})
        }
    
    try:
        # Convert rating to Decimal for DynamoDB
        rating = Decimal(str(body['rating']))
        
        user_item = {
            'PK': 'REVIEW',  
            'SK': body['SK'],  
            'userId': body['userId'],
            'movieId': body['movieId'],
            'rating': rating,
            'content': body['content'],
            'spoilerWarning': body.get('spoilerWarning', False),
            'likeCount': body.get('likeCount', 0),  # Changed: Default to 0 if not provided
            'createdAt': datetime.utcnow().isoformat(),
            'isEdited': body.get('isEdited', False)
        }

        table.put_item(Item=user_item)
        
        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json'
            },
            'body': json.dumps({'message': f"Review by {body['userId']} added successfully."})
        }
        
    except Exception as e:
        print(f"Error: {str(e)}")  # Log error to CloudWatch
        return {
            'statusCode': 500,
            'headers': {
            "Access-Control-Allow-Origin": "*",
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Methods': 'GET,POST,OPTIONS',
            'Content-Type': 'application/json'
            },
            'body': json.dumps({'message': f'Error: {str(e)}'})
        }