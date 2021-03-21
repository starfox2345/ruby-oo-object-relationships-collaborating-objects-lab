class Song

    attr_accessor :artist, :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        # Song.all.detect {|artist| artist.name == name} || new_artist = Artist.new(name)
        # self.artist = new_artist
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

    def self.new_by_filename(filename)
        artist = filename.split(" - ")[0]
        song = filename.split(" - ")[1]
        new_song = Song.new(song)
        new_song.artist=(Artist.new(artist))
        new_song
    end
end