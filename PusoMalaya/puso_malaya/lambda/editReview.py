import json
import boto3

dynamodb = boto3.client('dynamodb')

def lambda_handler(event, context):

    body = json.loads(event["body"])
    table = "MovieReview"

    # REQUIRED KEYS
    required_fields = ['reviewId', 'movieId', 'userId']
    if not all(field in body for field in required_fields):
        return {
            'statusCode': 400,
            'body': json.dumps({'message': f'Missing one of required fields: {required_fields}'})
        }

    review_id = body["reviewId"]

    ALLOWED_FIELDS = {"rating", "content", "spoilerWarning", "isEdited"}
    update_data = {k: v for k, v in body.items() if k in ALLOWED_FIELDS}

    update_data["isEdited"] = True

    update_expression = "SET " + ", ".join(f"#{k} = :{k}" for k in update_data)
    expression_attr_names = {f"#{k}": k for k in update_data}

    expression_attr_values = {}
    for k, v in update_data.items():
        if isinstance(v, str):
            expression_attr_values[f":{k}"] = {"S": v}
        elif isinstance(v, bool):
            expression_attr_values[f":{k}"] = {"BOOL": v}
        elif isinstance(v, (int, float)):
            expression_attr_values[f":{k}"] = {"N": str(v)}
        else:
            expression_attr_values[f":{k}"] = {"S": json.dumps(v)}  

    response = dynamodb.update_item(
        TableName=table,
        Key={
            "PK": {"S": "REVIEW"},
            "SK": {"S": review_id}
        },
        UpdateExpression=update_expression,
        ExpressionAttributeNames=expression_attr_names,
        ExpressionAttributeValues=expression_attr_values,
        ReturnValues="UPDATED_NEW"
    )

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Review updated successfully",
            "updated": response["Attributes"]
        })
    }
