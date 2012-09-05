#!/usr/local/bin/ruby -w

class Song

  attr_writer :duration

  @@plays = 0

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end

  def play
    @plays  += 1   # same as @plays = @plays + 1
    @@plays += 1
    "this song: #@plays plays. total #@@plays plays."
  end

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

class SongList

  MAX_TIME = 5*60        # 5 minutes

  def SongList.is_too_long(song)
    return song.duration > MAX_TIME
  end

end
