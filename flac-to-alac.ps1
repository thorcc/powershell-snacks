function Convert-Flac-To-alac {
    Write-Output "Converting all flac-files to apple lossless (alac)"
    Get-ChildItem -Path . -Recurse -filter *.flac | ForEach-Object { $_.fullname } | ForEach-Object -Process {ffmpeg -i "$($_)" -acodec alac -vn "$($_.Replace('.flac', '.m4a'))"}
    Write-Output "Done converting."
}
