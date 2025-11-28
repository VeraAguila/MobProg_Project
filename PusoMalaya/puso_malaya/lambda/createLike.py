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
            'body': json.dumps({'message': 'Invalid input, expected JSON body'})
        }

    required_fields = ['SK', 'userId', 'reviewId']
    if not all(field in body for field in required_fields):
        return {
            'statusCode': 400,
            'body': json.dumps({'message': f'Missing one of required fields: {required_fields}'})
        }
    user_item = {
        'PK': 'LIKE',  
        'SK': body['SK'],  
        'userId': body['userId'],
        'reviewId': body['reviewId']
    }

    try:
        table.put_item(Item=user_item)
        return {
            'statusCode': 200,
            'body': json.dumps({'message': f"Like {body['userId']} on {body['reviewId']} added successfully."})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'message': str(e)})
        }

