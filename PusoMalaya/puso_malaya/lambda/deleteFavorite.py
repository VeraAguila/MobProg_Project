import json
import boto3
from boto3.dynamodb.conditions import Attr

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('MovieReview')

def lambda_handler(event, context):
    body = json.loads(event["body"])
    movie_id = body["movieId"]
    user_id = body["userId"]
    scan_result = table.scan(
        FilterExpression=Attr("PK").eq("FAVORITE") & Attr("movieId").eq(movie_id)& Attr("userId").eq(user_id)
    )

    items = scan_result.get("Items", [])

    if not items:
        return {
            "statusCode": 404,
            "body": json.dumps({"message": "Favorite not found"})
        }

    item = items[0]
    pk = item["PK"]
    sk = item["SK"]

    table.delete_item(
        Key={
            "PK": pk,
            "SK": sk
        }
    )

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Favorite deleted", "movieId": movie_id})
    }
