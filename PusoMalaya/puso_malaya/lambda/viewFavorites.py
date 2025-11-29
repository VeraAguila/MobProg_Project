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
    movies=[item.get("movieId") for item in items if item.get("movieId") is not None]

    movies_array=[]

    for movie in movies:
        response = table.get_item(Key={'PK': 'MOVIE', 'SK': movie})
        movies_array.append(response.get('Item'))

    json_ready = json.loads(json.dumps(movies_array, default=str))

    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Methods': 'GET,POST,OPTIONS'
        },
        'body': json.dumps(json_ready)
    }
