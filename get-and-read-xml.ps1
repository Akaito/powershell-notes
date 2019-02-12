# cURL-esque
$webClient = New-Object System.Net.WebClient
$content = $webClient.DownloadString('https://www.guildwars2.com/en/feed/')
# look at some of the content
$content.Substring(0, 500)

# XML type allows for accessing child elements like object properties.
$xmlContent = [xml] $content
$xmlContent.rss
# `select` is short for `Select-Object`
$xmlContent.rss.channel.item | select -First 5 Title
