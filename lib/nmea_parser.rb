#!/usr/bin/env ruby

# file: nmea_parser.rb

require 'time'

class NMEAParser


  attr_reader  :longitude, :latitude, :time

  def initialize(s)
    parse(s)
  end
  
  def to_h()  
    {time: @time, latitude: @latitude, longitude: @longitude}
  end

  private

  def parse(raw_line)

    msgcode = raw_line[/^\$GP(\w+)/]
    return unless msgcode

    a = raw_line.split(',')

    case msgcode
      when /GGA/
        _, raw_time, raw_lat, ns, raw_lon, ew = a
        @time, @latitude, @longitude = Time.parse(raw_time), 
                               decimalize(raw_lat, ns), decimalize(raw_lon, ew)
    end

  end

  def decimalize(raw_x, raw_nesw)

    nesw = {n: :+, e: :+, s: :-, w: :-}
    x = 0.method(nesw[raw_nesw.downcase.to_sym]).call(raw_x.to_f)

    degrees = (x / 100).to_i
    minutes = x - (degrees * 100.0)
    (degrees + (minutes / 60)).round(8)
  end

end
