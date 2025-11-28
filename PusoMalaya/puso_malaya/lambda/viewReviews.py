import json
import boto3
from decimal import Decimal
from boto3.dynamodb.conditions import Attr

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('MovieReview')

def lambda_handler(event, context):
    body = json.loads(event['body'])
    movie_id = body.get("movieId")

    response = table.scan(
        FilterExpression=Attr('PK').eq('REVIEW') & Attr('movieId').eq(movie_id)
    )

    items = response.get('Items', [])
    review_count = len(items)

    ratings = [item.get("rating") for item in items if item.get("rating") is not None]

    if ratings:
        avg_rating = sum(ratings) / len(ratings)
        avg_rating_decimal = Decimal(str(round(avg_rating, 2)))
    else:
        avg_rating_decimal = Decimal("0")

    table.update_item(
        Key={
            "PK": "MOVIE",
            "SK": movie_id
        },
        UpdateExpression="SET averageRating = :avg, reviewCount = :count",
        ExpressionAttributeValues={
            ":avg": avg_rating_decimal,
            ":count": review_count
        }
    )

    json_ready = json.loads(json.dumps(items, default=str))

    return {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Origin": "*",
        },
        "body": json.dumps({
            "reviews": json_ready,
            "averageRating": float(avg_rating_decimal),
            "reviewCount": review_count
        })
    }
