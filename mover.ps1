# Ruta de la carpeta raíz
$raiz = "D:\pdf\PDFEJEMPLO\2019-2020\2020"

# Buscar todos los archivos XML, ZIP y RAR en las subcarpetas
Get-ChildItem -Path $raiz -Recurse -File -Include *.xml, *.zip, *.rar | ForEach-Object {
    # Ruta destino en la carpeta raíz
    $destino = Join-Path -Path $raiz -ChildPath $_.Name

    # Mover el archivo a la carpeta raíz
    Move-Item -Path $_.FullName -Destination $destino -Force
}

Write-Output "Archivos XML, ZIP y RAR movidos a la carpeta raíz."