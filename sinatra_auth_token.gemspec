Gem::Specification.new do |s|
  s.name        = 'sinatra_auth_token'
  s.version     = File.read("version")
  s.date        = Time.now.getgm.to_s.split.first
  s.summary     = File.read("CHANGELOG").match(/^v[^\n]+\n((\t[^\n]+\n)+)/m)[1].split("\t").join
  s.description = 'A auth token for sinatra'
  s.authors     = ['Nephos (poulet_a)']
  s.email       = ['arthur.poulet@mailoo.org']
  s.files       = %w(
  lib/sinatra_auth_token.rb

  README.md
  CHANGELOG
  LICENSE

  Rakefile
  Gemfile
  Gemfile.lock
  sinatra_auth_token.gemspec
  version

  certs/nephos.pem
  )
  s.executables = %w(
  )
  s.homepage    = 'https://github.com/Nephos/SinatraAuthToken'
  s.license     = 'GPL-3.0'

  s.cert_chain  = ['certs/nephos.pem']
  s.signing_key = File.expand_path('~/.ssh/gem-private_key-2.pem') if $0 =~ /gem\z/

  s.add_dependency 'sinatra', '~> 1.0'
  s.add_dependency 'nomorebeer', '~> 1.1'

end
