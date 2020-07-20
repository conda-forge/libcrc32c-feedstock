if "%platform%"=="x86" (set CMAKE_GENERATOR_PLATFORM="Win32")
      else (set CMAKE_GENERATOR_PLATFORM="%platform%")
cmake --version

mkdir build_cmake && cd build_cmake

set CMAKE_CONFIG="Release"

dir /p %LIBRARY_PREFIX%\lib

cmake -G "%CMAKE_GENERATOR%" -A "%CMAKE_GENERATOR_PLATFORM%" ^
    -DCMAKE_CONFIGURATION_TYPES="%CONFIGURATION%"            ^
    -DCRC32C_USE_GLOG=0 ..
if errorlevel 1 exit 1

cmake --build . --config "%CONFIGURATION%" --target install
if errorlevel 1 exit 1
