@echo off
pushd "%~dp0"

call :patch "Adventures of Lolo (U) (S).gb"

popd
exit /B

:patch
set out="%~n1 save patch.gb"
if exist "%~f1" (
..\..\rgbds\rgbasm.exe adventures-of-lolo-patch.asm -o patch.o
..\..\rgbds\rgblink.exe -o %out% -O %1 patch.o
..\..\rgbds\rgbfix.exe -v %out%
del /Q patch.o
echo Saved patched rom to %out%
)
exit /B
