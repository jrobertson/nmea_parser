Gem::Specification.new do |s|
  s.name = 'nmea_parser'
  s.version = '0.3.4'
  s.summary = 'Parses NMEA strings to fetch and convert GPS coordinates.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.signing_key = '../privatekeys/nmea_parser.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/nmea_parser'
  s.required_ruby_version = '>= 2.1.2'  
end
