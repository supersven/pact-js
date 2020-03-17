npm run dist
npm link
npm run build:v3

Get-ChildItem ".\examples" -Directory | ForEach-Object {
  Write-Output "Running examples in $($_.Name)"
  if ($_.Name -ne "v3") {
    cd $_.FullName
    npm link @pact-foundation/pact
    npm i
    npm t
    if ($LastExitCode -ne 0) { $host.SetShouldExit($LastExitCode)  }
  }
}

Get-ChildItem ".\examples\v3" -Directory | ForEach-Object {
  Write-Output "Running V3 examples in $($_.Name)"
  cd $_.FullName
  npm i
  npm link @pact-foundation/pact
  npm t
  if ($LastExitCode -ne 0) { $host.SetShouldExit($LastExitCode)  }
}
