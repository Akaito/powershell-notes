PowerShell Core notes
=====================

Most of this information comes from going through some of O'Reilly's "Windows PowerShell Cookbook".
http://shop.oreilly.com/product/0636920024132.do

- Case-insensitive.
- `2 * 8`.  `8GB / 4KB`.  Command-line is also a simple calculator that understands some units.  Unfortunately, 'cups', 'tbsp', etc. isn't natively understood.  Don't see a way to add suffixes/units.
- `-WhatIf` supported by some commands.  Similar to --dry-run elsewhere.
- `Get-Command *process*` to look for that command you can't remember the name of.
- `Get-Help Get-Process`.  Read documentation.
- `"foo" | Get-Member` for a listing of properties and methods on an object.
- Running a program with spaces in the path: `& 'C:\Program Files\foo.exe' some-arg`.  `&` is the "invoke operator".


Glossary
--------

- cmdlet: A native PowerShell command.


Providers
---------

Can navigate any "provider" in the same way.
- File system: `Set-Location c:\; Get-ChildItem`
- Windows Registry: `Set-Location HKCU:\Software\Microsoft\Windows\; Get-ChildItem`
- Certificate store: `Set-Location cert:\CurrentUser\Root; Get-ChildItem`


Param Splatting
---------------

Use `@` instead of `$` to "splat".  See param-splatting.ps1 for an example.
Magic variable "args" also works well for this.  Following is an alias-like wrapper:

    function rsls { Get-ChildItem -Recurse | Select-String @args }
    rsls -SimpleMatch '["*swp"]'


