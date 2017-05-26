# Sinatra Auth Token

## Installation

```sh
gem install sinatra_auth_token
```

or in the ``Gemfile``

```ruby
gem 'sinatra_auth_token'
```


## Usage in Ruby

```ruby
require "sinatra"
require 'sinatra_auth_token'

SinatraAuthToken.init_auth_token!
helpers SinatraAuthToken::SinatraHelper

get("/auto") do
  protect! params
  "ok"
end

get("/manual") do
  protect! params, "token"
  "ok"
end
```


## Contributes !

Find a bug ? Want a new feature ?
Create a clear pull request and we'll see :)

- Nephos (poulet_a)
