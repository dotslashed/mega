cat urls.html | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u
