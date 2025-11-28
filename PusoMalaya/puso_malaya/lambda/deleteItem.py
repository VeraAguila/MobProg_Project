import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('MovieReview')

def lambda_handler(event, context):
    try:
        # For DELETE /reviews/{id}, the ID comes from pathParameters
        review_id = event.get('pathParameters', {}).get('id')
        
        if not review_id:
            return {
                'statusCode': 400,
                'headers': {
                    'Access-Control-Allow-Origin': '*',
                    'Content-Type': 'application/json'
                },
                'body': json.dumps({'message': 'Review ID is required in path'})
            }
        
        # Delete the review from DynamoDB
        response = table.delete_item(
            Key={
                'PK': 'REVIEW',
                'SK': review_id
            }
        )
        
        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json'
            },
            'body': json.dumps({
                'message': 'Review deleted successfully',
                'reviewId': review_id
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