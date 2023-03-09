function get-gitstatus { git status }
function set-gitcommit { git commit }
function push-gitchanges { git push }
function pull-gitchanges { git pull }
function add-gitchanges { git add }
function checkout-gitchanges { git checkout }
Set-Alias -Name gs -Value get-gitstatus
Set-Alias -Name gii -Value set-gitcommit
Set-Alias -Name push -Value push-gitchanges
Set-Alias -Name pull -Value pull-gitchanges
Set-Alias -Name go -Value checkout-gitchanges
Set-Alias -Name ga -Value add-gitchanges
Set-Alias -Name v -Value nvim

Import-Module posh-git
Import-Module oh-my-posh

oh-my-posh --init --shell pwsh --config ~/atomic.omp.json | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
