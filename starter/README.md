# AWS DynamoDB vs Azure CosmosDB

## Key considerations

- Global availability
- Highly scalable pricing

AWS DynamoDB is a fully managed NoSQL database service. It has a global footprint with multiple availability zones across various regions. Similarly, Azure CosmosDB is also offering global availability. This means tables and data can be replicated globally. This ensures low latency and high availability.

However, the price model is quite different:

1. Dynamodb offers flexible scaling options with its auto-scaling feature, which adjusts the capacity automatically based on the workload, providing a highly scalable pricing model. Additionally, DynamoDb also offer provisioned throughput capacity and usage, this makes it easy to predict and control costs.
2. CosmosDB's pricing model is based on reserved capacity, which can be expensive for smaller workloads, and it does not offer auto-scaling like DynamoDB.

To provide an example, let's say we need to store and access 100 GB of data with a read capacity of 10,000 requests per second and a write capacity of 5,000 requests per second. (Based on us-east region)

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

## Conclusion

DynamoDB is significantly less expensive than CosmosDB for the given usage requirements.
