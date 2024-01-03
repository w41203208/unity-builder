param (
  [Parameter()]
  [string]$BuildFileDestinationPath,
  [string]$CompressFileDestinationPath
)


Compress-Archive -Path "$BuildFileDestinationPath" -DestinationPath "$CompressFileDestinationPath.zip"


