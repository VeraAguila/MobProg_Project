import json
import boto3
from datetime import datetime

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

    required_fields = ['SK', 'title', 'releaseDate','director','cast', 'genres','synopsis']
    if not all(field in body for field in required_fields):
        return {
            'statusCode': 400,
            'body': json.dumps({'message': f'Missing one of required fields: {required_fields}'})
        }

    user_item = {
        'PK': 'MOVIE',  
        'SK': body['SK'],  
        'title': body['title'],
        'releaseDate': body['releaseDate'],
        'director': body['director'],
        'cast': body['cast'],
        'genres': body['genres'],
        'synopsis': body['synopsis'],
        'imdbId': body['imdbId'],
        'averageRating': body['averageRating'],
        'reviewCount': body['reviewCount'],
        's3Image': body['s3Image']

    }

    try:
        table.put_item(Item=user_item)
        return {
            'statusCode': 200,
            'body': json.dumps({'message': f"Movie {body['title']} added successfully."})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'message': str(e)})
        }
