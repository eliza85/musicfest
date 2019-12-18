require 'rspec'
require 'artist'
require 'stage'
require 'pry'

describe '#Artist' do

  before(:each) do
    Stage.clear()
    Artist.clear()
    @stage = Stage.new("Ballet Stage", nil, "San Francisco")
    @stage.save()
  end

  describe('#==') do
    it("is the same artist has the same attributes as another artist") do
      artist = Artist.new("Fred Astaire", @stage.id, nil)
      artist2 = Artist.new("Fred Astaire", @stage.id, nil)
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do
    it("returns a list of all artists") do
      artist = Artist.new("Patricia Baker", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Gregory Hines", @stage.id, nil)
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new("Patricia Baker", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Gregory Hines", @stage.id, nil)
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a artist") do
      artist = Artist.new("Patricia Baker", @stage.id, nil)
      artist.save()
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe('.find') do
    it("finds a artist by id") do
      artist = Artist.new("Patricia Baker", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Gregory Hines", @stage.id, nil)
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new("Patricia", @stage.id, nil)
      artist.save()
      artist.update("Ms. Baker", @stage.id)
      expect(artist.name).to(eq("Ms. Baker"))
    end
  end

  describe('#delete') do
      it("deletes an artist by id") do
        artist = Artist.new("Patricia Baker", @stage.id, nil)
        artist.save()
        artist2 = Artist.new("Gregory Hines", @stage.id, nil)
        artist2.save()
        artist.delete()
        expect(Artist.all).to(eq([artist2]))
      end
    end

    describe('.find_by_stage') do
      it("finds artists for a stage") do
        stage2 = Stage.new("Ballet Stage", nil, "San Francisco")
        stage2.save
        artist = Artist.new("Patricia Baker", @stage.id, nil)
        artist.save()
        artist2 = Artist.new("Gregory Hines", stage2.id, nil)
        artist2.save()
        expect(Artist.find_by_stage(stage2.id)).to(eq([artist2]))
      end
    end

    describe('#stage') do
      it("finds the stage an artist belongs to") do
        artist = Artist.new("Naima", @stage.id, nil)
        artist.save()
        expect(artist.stage()).to(eq(@stage))
      end
    end



end
