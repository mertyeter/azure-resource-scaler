param (
[Parameter(Mandatory=$true)]
[String] 
$resourceGroup,

[Parameter(Mandatory=$true)]
[String]
$server,

[Parameter(Mandatory=$true)]
[String]
$poolName,

[Parameter(Mandatory=$true)]
[String]
[ValidateSet('Basic', 'Standard')]
$serviceTier,

[Parameter(Mandatory=$true)]
[Int]
[ValidateSet(50, 100, 200)]
$dtu
)

# eDTU and storage limits for elastic pools and elastic databases 
function Get-MaxSize {
 
 switch($serviceTier)
    {
        'Basic'   { Get-BasicTierMaxSize; break }
        'Standard'{ Get-StandardTierMaxSize; break }
    }
}

function Get-BasicTierMaxSize {
    switch ($dtu)
    {
        50  { "5000MB"; break }
        100 { "10000MB"; break }
        200 { "20000MB"; break }
    }
}

function Get-StandardTierMaxSize {
    switch ($dtu)
    {
        50  {"50GB"; break}
        100 {"100GB"; break}
        200 {"200GB"; break}
    }
}

$maxSize = Get-MaxSize

az sql elastic-pool update -g $resourceGroup -s $server -n $poolName -c $dtu --max-size $maxSize
