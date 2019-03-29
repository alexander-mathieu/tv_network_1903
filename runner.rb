require 'benchmark'
require './lib/character'
require './lib/show'
require './lib/network'

@kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
@michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
@leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
@ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})

@knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
@parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])

@nbc = Network.new("NBC")

@nbc.add_show(@knight_rider)
@nbc.add_show(@parks_and_rec)

n = 50_000

Benchmark.bmbm do |x|
  x.report("my_code") { n.times do; @nbc.highest_paid_actor; end }
end
