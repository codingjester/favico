A simple favicon parser which lets you grab favicons from almost any website
with a fairly simple interface. Mostly created because I was slightly bored.

```
fparser = Favicon::Parser.new
fparser.fetch_favicon("http://www.google.com")
```

That's about it. It'll be useful for creating your own favicon fetcher or something
else that you need them for.
