$projectRoot = "$(Resolve-Path .)"
$buildDir = "$projectRoot\build"
$outputDir = "$projectRoot"
$configuration = "Debug"

# Create the build directory if it doesn't exist
if (-Not (Test-Path -Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir
}

# Change to the build directory
Set-Location -Path $buildDir

# Run CMake to configure the project
cmake .. -DCMAKE_BUILD_TYPE=$configuration

# Build the project
cmake --build . --config $configuration

# Move the DLL to the root directory
$sourceDllPath = "$buildDir\$configuration\lib.dll"
$destinationDllPath = "$outputDir\lib.dll"

if (Test-Path -Path $sourceDllPath) {
    Move-Item -Path $sourceDllPath -Destination $destinationDllPath -Force
    Write-Output "DLL has been moved to the root directory: $destinationDllPath"
} else {
    Write-Error "DLL was not found in the expected directory: $sourceDllPath"
}

# Change back to the project root directory
Set-Location -Path $projectRoot
