# AWS DynamoDB vs Azure CosmosDB

## Key considerations

- Global availability
- Highly scalable pricing

AWS DynamoDB is a fully managed NoSQL database service. It has a global footprint with multiple availability zones across various regions. Similarly, Azure CosmosDB is also offering global availability. This means tables and data can be replicated globally. This ensures low latency and high availability.

However, the price model is quite different:

1. Dynamodb offers flexible scaling options with its auto-scaling feature, which adjusts the capacity automatically based on the workload, providing a highly scalable pricing model. Additionally, DynamoDb also offer provisioned throughput capacity and usage, this makes it easy to predict and control costs.
2. CosmosDB's pricing model is based on reserved capacity, which can be expensive for smaller workloads, and it does not offer auto-scaling like DynamoDB.

To see a sample cost comparison, please refer to cost-comparison.md

## Conclusion

DynamoDB is significantly less expensive than CosmosDB
