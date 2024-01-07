Param([String]$path='C:\Users\imasp\Downloads\995downloadfile', [String]$file='list.dat')

chcp 65001

$cli = New-Object System.Net.WebClient
foreach($url in Get-Content $file){
	$uri = New-Object System.Uri($url)
	$file = Split-Path $uri.AbsolutePath -Leaf
	$cli.DownloadFile($uri, (Join-Path $path $file))
	$file + "をダウンロード完了しました。"
}

Get-Content -Encoding UTF8 *.js | Set-Content -Encoding UTF8 output.txt

Remove-Item *.js