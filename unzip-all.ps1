function Expand-All {
    Write-Output "Unpacking all .zip files in the current directory and subdirectories."

    # Find and process all .zip files
    Get-ChildItem -Path . -Recurse -Filter "*.zip" | ForEach-Object {
        $ZipFile = $_
        $DestinationFolder = $ZipFile.DirectoryName

        try {
            Write-Output "Unpacking: $($ZipFile.FullName)"
            Expand-Archive -Path $ZipFile.FullName -DestinationPath $DestinationFolder -Force

            Write-Output "Deleting: $($ZipFile.FullName)"
            Remove-Item -Path $ZipFile.FullName -Force
        }
        catch {
            Write-Error "Error processing $($ZipFile.FullName): $_"
        }
    }

    Write-Output "All .zip files have been unpacked and deleted."
}