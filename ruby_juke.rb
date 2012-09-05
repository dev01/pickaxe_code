#!/usr/local/bin/ruby -w

class Song

  attr_reader :name, :artist, :duration

  attr_writer :duration

  def duration_in_minutes
    @duration/60.0    # force floating point
  end

  def duration_in_minutes=(new_duration)
    @duration = (new_duration*60).to_i
  end

  def to_s
    "song: #@name--#@artist (#@duration)"
  end

end

class KaraokeSong < Song

  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

  # format ourselves as a string by appending
  # our lyrics to our parent's #to_s value.
  def to_s
    super + " [#@lyrics]"
  end

end
