import json
import boto3
from boto3.dynamodb.conditions import Attr

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('MovieReview')

def lambda_handler(event, context):
    body = json.loads(event["body"])
    user_id = body["SK"]
 
    table.delete_item(
        Key={
            "PK": "USER",
            "SK": user_id
        }
    )

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "User deleted", "user_id": user_id})
    }
