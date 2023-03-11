## cost comparison for the same usage

let's say we need to store and access 100 GB of data with a read capacity of 10,000 requests per second and a write capacity of 5,000 requests per second. (Based on us-east region)

AWS DynamoDB:

- Storage: 100 GB/month x $0.25/GB = $25/month
- Provisioned write capacity: 5,000 writes/second x 60 seconds x 60 minutes x 24 hours x 30 days x $0.00065/write request = $1,131/month
- Provisioned read capacity: 10,000 reads/second x 60 seconds x 60 minutes x 24 hours x 30 days x $0.00013/read request = $3,078/month
- Total cost: $25 + $1,131 + $3,078 = $4,234/month

Azure CosmosDB:

- Storage: 100 GB/month x $0.25/GB = $25/month
- Provisioned write capacity: 5,000 writes/second x 60 seconds x 60 minutes x 24 hours x 30 days x $0.008/hour = $7,488/month
- Provisioned read capacity: 10,000 reads/second x 60 seconds x 60 minutes x 24 hours x 30 days x $0.008/hour = $14,976/month
- Total cost: $25 + $7,488 + $14,976 = $22,489/month
