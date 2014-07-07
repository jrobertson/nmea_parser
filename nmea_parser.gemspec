Gem::Specification.new do |s|
  s.name = 'nmea_parser'
  s.version = '0.3.0'
  s.summary = 'Parses NMEA strings to fetch and convert GPS coordinates.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_runtime_dependency('immutable_struct', '~> 1.1', '>=1.1.1')
  s.signing_key = '../privatekeys/nmea_parser.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/nmea_parser'
  s.required_ruby_version = '>= 2.1.2'  
end
