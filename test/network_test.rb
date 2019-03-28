require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < MiniTest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})

    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])

    @nbc = Network.new("NBC")
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_has_a_name
    assert_equal "NBC", @nbc.name
  end

  def test_by_default_it_has_an_array_with_0_shows
    assert_empty @nbc.shows
  end

  def test_it_can_add_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_it_can_show_all_actors
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@michael_knight, @kitt, @leslie_knope, @ron_swanson], @nbc.all_network_characters
  end

  def test_it_can_show_highest_paid_actor_for_network
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal "Amy Poehler", @nbc.highest_paid_actor
  end

  def test_it_can_show_total_payroll_for_all_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal({"David Hasselhoff" => 1600000, "William Daniels" => 1000000, "Amy Poehler" => 2000000, "Nick Offerman" => 1400000}, @nbc.payroll)
  end

end
