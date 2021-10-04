<#
.Description
Invoke the global paket executable
#>
function paket {
(gcm dotnet -erroraction ignore) ? (dotnet tool run paket -- "$args") : (write-error "Dotnet not installed")
}

<#
.Description
Go back one dir
#>
function cdBackOne {
if (test-path ..) {Set-Location ..} else {write-warning "No parent dir"}
}

<#
.Description
Go back two dirs
#>
function cdBackTwo {
param()
(test-path ../..) ? (Set-Location ../..) : `
(write-warning "parent of parent dir not found`n Moving to parent dir" && set-location ..)
}

# Set aliases for cd functions:
Set-Alias -Name ".." -Value cdBackOne -Description "Goes back one directory"
Set-Alias -Name "..." -Value cdBackTwo -Description "Goes back two directories"

export-modulemember -Function "*" -Alias "..", "..."
