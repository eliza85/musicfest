class Stage
  attr_reader :id, :name, :location

  @@stages = {}
  @@total_rows = 0

  def initialize(name, id, location)
    @name = name
    @id = id || @@total_rows += 1
    @location
  end

  def update(name)
    @name = name
  end

  def save
    @@stages[self.id] = Stage.new(self.name, self.id, self.location)
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name() && self.location() == stage_to_compare.location()
  end

  def self.all
    @@stages.values()
  end

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@stages[id]
  end

  def delete
    @@stages.delete(self.id)
  end

  def artists
    # binding.pry
    Artist.find_by_stage(self.id)
  end
end
