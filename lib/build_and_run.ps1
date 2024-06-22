$projectRoot = "$(Resolve-Path .)"
$buildDir = "$projectRoot\build"
$configuration = "Debug"

# Create the build directory if it doesn't exist
if (-Not (Test-Path -Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir
}

# Change to the build directory
Set-Location -Path $buildDir

# Run CMake to configure the project
cmake .. -DCMAKE_BUILD_TYPE=$configuration

# Build the development executable
cmake --build . --config $configuration --target lib_dev

# Run the development executable
$exePath = "$buildDir\$configuration\lib_dev.exe"

if (Test-Path -Path $exePath) {
    & $exePath
} else {
    Write-Error "Executable was not found in the expected directory: $exePath"
}

# Change back to the project root directory
Set-Location -Path $projectRoot
