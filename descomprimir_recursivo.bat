@echo off
set "winrar=%ProgramFiles%\WinRAR\winrar.exe"
rem reemplazar source_folder
set "source_folder="
set "dest_folder=.\descomprimidos"

echo Iniciando descompresión recursiva...

rem Recorre recursivamente los archivos .zip y descomprime cada uno
for /r "%source_folder%" %%F in (*.zip) do (
    echo Descomprimiendo %%F en %dest_folder%...
    "%winrar%" x -ibck "%%F" "%dest_folder%"
)

rem Segundo paso: busca archivos comprimidos dentro de los descomprimidos
echo Buscando archivos comprimidos dentro de los descomprimidos...
for /r "%dest_folder%" %%F in (*.zip) do (
    echo Descomprimiendo comprimidos dentro de %%F...
    "%winrar%" x -ibck "%%F" "%dest_folder%"
)

echo Proceso completado.
pause
