function Greet{
    param(
        [string]$Name
    )

    if ([string]::IsNullOrEmpty($Name)) {
        $Name = "my friend"
    }

    "Hello, $Name."
}