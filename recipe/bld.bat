mkdir build-shared
if errorlevel 1 exit 1
cd build-shared
if errorlevel 1 exit 1

:: Configure and install based on other `bld.bat`s and
::https://github.com/google/crc32c/blob/master/.appveyor.yml
cmake -G "Ninja" ^
         -DCMAKE_BUILD_TYPE=Release ^
         -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
         -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
         -DCRC32C_USE_GLOG=0 ^
         ..
if errorlevel 1 exit 1
cmake --build . --target install --config Release
if errorlevel 1 exit 1
