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
