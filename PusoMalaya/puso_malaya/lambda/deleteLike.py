import json
import boto3
from boto3.dynamodb.conditions import Attr

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('MovieReview')

def lambda_handler(event, context):
    body = json.loads(event["body"])
    review_id = body["reviewId"]
    user_id = body["userId"]
    scan_result = table.scan(
        FilterExpression=Attr("PK").eq("LIKE") & Attr("reviewId").eq(review_id)& Attr("userId").eq(user_id)
    )

    items = scan_result.get("Items", [])

    if not items:
        return {
            "statusCode": 404,
            "body": json.dumps({"message": "Like not found"})
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
        "body": json.dumps({"message": "Like deleted", "reviewId": review_id})
    }
