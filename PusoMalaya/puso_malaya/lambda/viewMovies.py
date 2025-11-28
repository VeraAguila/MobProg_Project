import json
import boto3
from decimal import Decimal
from boto3.dynamodb.conditions import Key  
from boto3.dynamodb.types import TypeSerializer, TypeDeserializer


dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('MovieReview')


def lambda_handler(event, context):
    try:
        # For GET requests from API Gateway, parameters come from queryStringParameters
        # If PK is not provided, default to 'MOVIE' to get all movies
        pk_val = None
        
        # Check if queryStringParameters exists (API Gateway passes params here)
        if event.get('queryStringParameters'):
            pk_val = event['queryStringParameters'].get('PK', 'MOVIE')
        else:
            # Default to 'MOVIE' for getting all movies
            pk_val = 'MOVIE'
        
        print(f"Querying for PK: {pk_val}")
        
        response = table.query(
            KeyConditionExpression=Key('PK').eq(pk_val)
        )
x   
        items = response.get('Items', [])
        
        print(f"Found {len(items)} items")

        # Convert Decimal to float/int for JSON serialization
        json_ready = json.loads(json.dumps(items, default=str))

        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json'
            },
            'body': json.dumps({
                'items': json_ready,
                'count': len(json_ready)
            })
        }
        
    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json'
            },
            'body': json.dumps({
                'message': 'Internal server error',
                'error': str(e)
            })
        }