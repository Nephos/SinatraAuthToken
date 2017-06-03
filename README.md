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

## Documentation

### API

- ``SinatraAuthToken.init_auth_token!`` create a random token or search for it in the env variables. The token is displayed on the standard output.
- ``helpers SinatraAuthToken::SinatraHelper`` contains the ``protect!`` function, it should be included in your sinatra application
- ``SinatraAuthToken::SinatraHelper.protect!(params, token=nil)`` verifies if the token has been provided in the query param ``auth_token`` and halt the process if not. For example, the auth_token is provided as this: ``http://localhost:3000/protected_url?auth_token=azerty``. If a token is provided, it will use it instead of the default token generated by ``init_auth_token!``.

### Security Threat
This library only provide an application level security. If there are no security measures on lower levels (understand SSL security) then the auth_token can be eavedropped by attackers. Furthermore, the token has no "life-time", if it is stolen, then the application must be restarted and the token regenerated.

### Roadmap
In order to improve the security model, it could be good to have a better token:

- Generate a random seed token.
- At each moment, define the real auth_token as a hash "seed+time".
- The time should also be provided as url param in order to avoid bad token when the time slides to an other value (hour, minute, ...).

Furthermore, multiple tokens could be good (adding a suffix to the seed for user-level filter).

## Contributes !

Find a bug ? Want a new feature ?
Create a clear pull request and we'll see :)

- Nephos (poulet_a)
