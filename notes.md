PowerShell Core notes
=====================

Most of this information comes from going through some of O'Reilly's "Windows PowerShell Cookbook".
http://shop.oreilly.com/product/0636920024132.do

- Case-insensitive.
- Backtick is the escape character.
- `2 * 8`.  `8GB / 4KB`.  Command-line is also a simple calculator that understands some units.  Unfortunately, 'cups', 'tbsp', etc. isn't natively understood.  Don't see a way to add suffixes/units.
- `-WhatIf` supported by some commands.  Similar to --dry-run elsewhere.
- `Get-Command *process*` to look for that command you can't remember the name of.
- `Get-Help Get-Process`.  Read documentation.
- `"foo" | Get-Member` for a listing of properties and methods on an object.
- Running a program with spaces in the path: `& 'C:\Program Files\foo.exe' some-arg`.  `&` is the "invoke operator".
- Prevent PowerShell from interpreting special characters by enclosing them in single-quotes.  If single-quotes are needed in single-quotes, use double single-quotes.  Like 'Ben & Jerry''s'.
    Alternately, use the "verbatim argument" (--%) syntax.  Everything after `--%` in a PowerShell line is used verbatim (not processed at all).  Except the old `%USERPROFILE%` style of variables; those still aren't verbatim.
    Having issues with a command?  O'Reilly book says to try `Trace-Command NativeCommandParameterBinder { cmd /c echo 'foo' } -PSHost`.  But when I try that, I just see the normal output of the inner command.  Even setting  $DebugPreference to Continue instead of SilentlyContinue doesn't cut it.

Some Cmder PowerShell things noticed a .git directory as a child of the current working directory, so it kept issuing a "WARNING: Missing git support, install posh-git with 'Install-Module posh-git' and restart cmder."  (Even after doing so.)
Dumb fix: Find Cmder's vendor/profile.ps1 and remove the `-Options ReadOnly` bit at the end where it sets the prompt.  Then restart PowerShell and issue `function Prompt { "PS> " }`.  Alternately, maybe `Set-Variable` with -Force could work?  I didn't try it with a scope like `function:prompt`.  Or maybe `Remove-Item` instead to return to your normal prompt?


Glossary
--------

- cmdlet: A native PowerShell command.  Supports piping of .NET objects.  As opposed to some executable program you run from PowerShell.


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


