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

  def initialize
    @songs = Array.new
  end

  def append(song)
    @songs.push(song)
    self
  end

  def delete_first
    @songs.shift
  end

  def delete_last
    @songs.pop
  end

  def [](index)
    @songs[index]
  end

  MAX_TIME = 5*60        # 5 minutes

  def SongList.is_too_long(song)
    return song.duration > MAX_TIME
  end

end

class MyLogger

  private_class_method :new

  @@logger = nil

  def MyLogger.create
    @@logger = new unless @@logger
    @@logger
  end

end


require 'test/unit'
class TestSongList < Test::Unit::TestCase
  
  def test_delete
    list = SongList.new
    s1 = Song.new('title1', 'artst1', 1)
    s2 = Song.new('title2', 'artst2', 2)
    s3 = Song.new('title3', 'artst3', 3)
    s4 = Song.new('title4', 'artst4', 4)
    list.append(s1).append(s2).append(s3).append(s4)
    assert_equal(s1, list[0])
    assert_equal(s3, list[2])
    assert_nil(list[9])
    assert_equal(s1, list.delete_first)
    assert_equal(s2, list.delete_first)
    assert_equal(s4, list.delete_last)
    assert_equal(s3, list.delete_last)
    assert_nil(list.delete_last)
  end

end
