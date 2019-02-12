# Splatting makes it easy to pass a collection of arguments to a command's params.
# PS' true/false values are variables or variable-like, hence the `$true` below.

$args = @{
    Name = "explorer";
    WhatIf = $true
}

# Making the following line into `Write-Host $args` would just print the type.
$args

Stop-Process @args

