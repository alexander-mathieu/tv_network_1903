require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'

class ShowTest < MiniTest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})

    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_it_exists
    assert_instance_of Show, @knight_rider
  end

  def test_it_has_a_creator
    assert_equal "Glen Larson", @knight_rider.creator
  end

  def test_it_has_an_array_of_characters
    assert_equal [@michael_knight, @kitt], @knight_rider.characters
  end

  def test_it_can_calculate_total_salary_for_characters
    assert_equal 2_600_000, @knight_rider.total_salary
  end

end
