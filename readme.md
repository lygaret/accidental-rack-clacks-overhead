---
name:    clacks_overhead
version: 0.0.1
summary: |
  a small rack middleware for inserting X-Clacks-Overhead headers in responses
---

A Rack middleware for inserting a `X-Clacks-Overhead` header in responses.

## Usage

Add this repo to your `Gemfile`:

```ruby
gem "clacks_overhead", "~> 0", git: "https://gist.github.com/117441fc5236de9f7d54b76894d69dec.git"
```

Then in `config.ru`:

```ruby
require 'accidental/rack/clacks_overhead'

use Accidental::Rack::ClacksOverhead, "Terry Pratchett", "Jeff Raphaelson"
```
