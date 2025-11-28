import json
import boto3
from decimal import Decimal
from boto3.dynamodb.conditions import Attr, Key
from boto3.dynamodb.types import TypeSerializer, TypeDeserializer


dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('MovieReview')




def lambda_handler(event, context):
    body = json.loads(event['body'])
    user_id = body.get("userId")  
    
    response = table.scan(
        FilterExpression=Attr('PK').eq('FAVORITE') & Attr('userId').eq(user_id)
    )

    items = response.get('Items', [])

    json_ready = json.loads(json.dumps(items, default=str))

    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Origin': '*',
        },
        'body': json.dumps(json_ready)
    }
