# -*- ruby -*-
# encoding: utf-8

Gem::Specification.new do |s|
  s.name          = 'payment-server'
  s.version       = '1.0.0'
  s.authors       = ['qcodelabsllc']
  s.email         = 'qcodelabsllc@google.com'
  s.homepage      = 'https://github.com/quabynah-bilson/proche'
  s.summary       = 'gRPC Ruby payment server'
  s.description   = 'Implementation of payment processing system using gRPC from Ruby'

  s.files         = `git ls-files -- ruby/*`.split("\n")
  s.executables   = `git ls-files -- ruby/greeter*.rb ruby/route_guide/*.rb`.split("\n").map do |f|
    File.basename(f)
  end
  s.require_paths = ['gen']
  s.platform      = Gem::Platform::RUBY

  s.add_dependency 'grpc', '~> 1.0'

  s.add_development_dependency 'bundler', '~> 2.4'
end
