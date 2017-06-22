#!/usr/bin/env ruby

# file: nmea_parser.rb

require 'time'
require 'date'


class NMEAParser


  attr_reader  :longitude, :latitude, :time

  def initialize(s=nil)
    parse(s) if s
  end
  
  def parse(raw_line)

    msgcode = raw_line[/^\$GP(\w+)/]
    return unless msgcode

    a = raw_line.split(',')

    case msgcode

      when /GGA/

        _, raw_time, raw_lat, ns, raw_lon, ew = a
        @time, @latitude, @longitude = Time.parse(raw_time), 
                               decimalize(raw_lat, ns), decimalize(raw_lon, ew)

        # additional data captured 
        #
        # Fix quality, Number of satellites being tracked, Horizontal dilution
        # of position, Altitude (Meters, above mean sea level), Height of 
        # geoid, time in seconds since last DGPS update, DGPS station ID number

        @quality, @num_sat, @hdop, @altitude, @alt_unit, @height_geoid,
        @height_geoid_unit, @last_dgps, @dgps = a[6..-2] << a[-1][/^[^\*]+/]

      when /RMC/

        _, raw_time, _, raw_lat, ns, raw_lon, ew = a
        @time, @latitude, @longitude = Time.parse(raw_time), 
                               decimalize(raw_lat, ns), decimalize(raw_lon, ew)

        # additional data captured 
        #
        # Speed over the ground in knots, Track angle in degrees True, 
        # Date, Magnetic Variation, 

        @speed, @course = a[7..8]
        @date, @variation = Date.parse(a[9]), a[10]
        @var_direction =  a[-1][/^[^\*]+/]

      when /VTG/

        # data captured      
      
        # True track made good (degrees), Magnetic track made good, 
        # Ground speed (knots), Ground speed (Kilometers per hour)

        @track, @mag_track, @speed, @speed_kph = a.values_at(1,3,5,7)
  
    end

  end

  def to_h()  
    {
      time: @time, latitude: @latitude, longitude: @longitude, 
      quality: @quality, num_sat: @num_sat, hdop: @hdop, altitude: @altitude,
      alt_unit: @alt_unit, height_geoid: @height_geoid, 
      height_geoid_unit: @height_geoid_unit, last_dgps: @last_dgps, 
      dgps: @dgps, speed: @speed, course: @course, date: @date, 
      variation: @variation, var_direction: @var_direction, track: @track, 
      mag_track: @mag_track, speed: @speed, speed_kph: @speed_kph
    }
  end

  def to_struct()
    h = self.to_h
    Struct.new(*h.keys.map(&:to_sym)).new(*h.values).freeze    
  end

  private

  def decimalize(raw_x, raw_nesw)

    nesw = {n: :+, e: :+, s: :-, w: :-}
    x = 0.method(nesw[raw_nesw.downcase.to_sym]).call(raw_x.to_f)

    degrees = (x / 100).to_i
    minutes = x - (degrees * 100.0)
    (degrees + (minutes / 60)).round(8)
  end

end