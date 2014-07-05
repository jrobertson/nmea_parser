# Introducing the NMEA parser gem


    require 'nmea_parser'

    s = '$GPGGA,045612.00,5554.95457,N,00306.82246,W,1,08,1.22,96.7,M,49.8,M,,*76'
    np = NMEAParser.new(s)
    np.to_h

    #=> {:time=>2014-07-05 04:56:12 +0100, :latitude=>55.9159095, :longitude=>-3.11370767} 


## Resources

* [jrobertson/nmea_parser](https://github.com/jrobertson/nmea_parser)
* [Collecting the data from a GPS module](http://www.jamesrobertson.eu/snippets/2014/jul/05/collecting-the-data-from-a-gps-module.html)

nmea gem parser gps coordinates
