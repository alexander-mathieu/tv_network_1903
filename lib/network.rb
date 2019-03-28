class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name  = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
   all_network_characters.max_by do |character|
     character.salary
   end.actor
  end

  def payroll
    payroll = {}
    all_network_characters.each do |character|
      payroll[character.actor] = character.salary
    end
    payroll
  end

  def all_network_characters
    @shows.flat_map do |show|
      show.characters
    end
  end

end
