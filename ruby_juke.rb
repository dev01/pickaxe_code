#!/usr/local/bin/ruby -w

class Song

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
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
