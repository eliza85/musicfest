require 'rspec'
require 'stage'

describe '#Stage' do

  before(:each) do
    Stage.clear()
    # Artist.clear()
  end

  describe('#==') do
    it("is the same stage if it has the same attributes as another stage") do
      stage = Stage.new("Ballet Stage", nil, "San Francisco")
      stage2 = Stage.new("Ballet Stage", nil, "San Francisco")
      expect(stage).to(eq(stage2))
    end
  end

  describe('#update') do
    it("updates a stage by id") do
      stage = Stage.new("Music Stage", nil, "Seattle")
      stage.save()
      stage.update("Rock Stage")
      expect(stage.name).to(eq("Rock Stage"))
    end
  end

  describe('#save') do
    it("saves an stage") do
      stage = Stage.new("Ballet Stage", nil, "San Francisco")
      stage.save()
      stage2 = Stage.new("Comedy Stage", nil, "New York")
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end

  describe('#delete') do
    it("deletes an stage by id") do
      stage = Stage.new("Ballet Stage", nil, "San Francisco")
      stage.save()
      stage2 = Stage.new("Comedy Stage", nil, "New York")
      stage2.save()
      stage.delete()
      expect(Stage.all).to(eq([stage2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Stage.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all stages") do
      stage = Stage.new("Ballet Stage", nil, "San Francisco")
      stage.save()
      stage2 = Stage.new("Comedy Stage", nil, "New York")
      stage2.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end
  end

  describe('.find') do
  it("finds an stage by id") do
    stage = Stage.new("Ballet Stage", nil, "San Francisco")
    stage.save()
    stage2 = Stage.new("Comedy Stage", nil, "New York")
    stage2.save()
    expect(Stage.find(stage.id)).to(eq(stage))
  end
end

# describe('#artists') do
#     it("returns an album's songs") do
#       stage = Stage.new("Ballet Stage", nil, "San Francisco")
#       stage.save()
#       artist = Artist.new("Naima", album.id, nil)
#       artist.save()
#       artist2 = Artist.new("Cousin Mary", album.id, nil)
#       artist2.save()
#       expect(stage.artists).to(eq([artist, artist2]))
#     end
#   end
end
