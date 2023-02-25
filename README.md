# Introduction 
This repo contains powershell scripts using Az CLI to scale Azure resources.

# Getting Started
Script files must be run on pipelines. Each file has different parameters (see below) and they must be set as pipeline variables. You will need to create a new pipeline for each resource.
1.	Scale-AppServicePlan
    - AppServicePlan 
    - ResourceGroup 
    - SKU (B1, B2, B3, D1, F1, FREE, I1, I1v2, I2, I2v2, I3, I3v2, P1V2, P1V3, P2V2, P2V3, P3V2, P3V3, S1, S2, S3, SHARED, WS1, WS2 or WS3)
2.	Scale-ElasticPool
    - ResourceGroup
    - Server
    - PoolName
    - ServiceTier (Basic or Standard)
    - DTU (50, 100 or 200)
    
[eDTU and storage limits for elastic pools and elastic databases ](https://github.com/Huachao/azure-content/blob/master/articles/sql-database/sql-database-elastic-pool-reference.md#edtu-and-storage-limits-for-elastic-pools-and-elastic-databases) is calculeted with a function inside the script.
# Test
Please be careful and not try anything on the resources in use unless you're 100% sure what you're doing. 

