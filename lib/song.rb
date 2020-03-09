class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # self.create_by_name(name)
    self.find_by_name(name)

  end
  def self.alphabetical
    self.all.sort
  end

  def self.new_from_filename(filename)
    song = self.new
    parts = filename.delete(".mp3").split(" - ")
    song.name = parts[1]
    song.artist_name = parts[0]
    song
  end

  def self.create_from_filename()
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
