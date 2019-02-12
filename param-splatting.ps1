# Splatting makes it easy to pass a collection of arguments to a command's params.
# PS' true/false values are variables or variable-like, hence the `$true` below.

# Key-value pair lines can end in semicolons if you prefer.
# Can't add param names like "Banana" that don't exist in the receiving function.
$parameters = @{
    Name = "explorer"
    WhatIf = $true
}

# Making the following line into `Write-Host $args` would just print the type.
$parameters

Stop-Process @parameters

