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


Providers
---------

Can navigate any "provider" in the same way.
- File system: `Set-Location c:\; Get-ChildItem`
- Windows Registry: `Set-Location HKCU:\Software\Microsoft\Windows\; Get-ChildItem`
- Certificate store: `Set-Location cert:\CurrentUser\Root; Get-ChildItem`

