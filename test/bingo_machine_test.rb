require 'test/unit'
require_relative '../lib/bingo'

class Bingo::MachineTest < Test::Unit::TestCase
  def test_numbers
    machine = Bingo::Machine.new
    assert_equal 75, machine.numbers.size
    assert_equal [*1..75], machine.numbers.sort

    shuffled_numbers = [*1..75].shuffle
    machine = Bingo::Machine.new(shuffled_numbers)
    assert_equal 75, machine.numbers.size
    assert_equal shuffled_numbers, machine.numbers
  end

  def test_draw
    shuffled_numbers = [*1..75].shuffle
    machine = Bingo::Machine.new(shuffled_numbers)
    assert_equal shuffled_numbers[0], machine.draw
    assert_equal 74, machine.numbers.size
    assert_equal shuffled_numbers[1], machine.draw
    assert_equal 73, machine.numbers.size
    assert_equal shuffled_numbers[2], machine.draw
    assert_equal 72, machine.numbers.size
  end

  def test_drawed_numbers
    shuffled_numbers = [*1..75].shuffle
    machine = Bingo::Machine.new(shuffled_numbers)
    machine.draw
    machine.draw
    machine.draw
    assert_equal shuffled_numbers[0..2], machine.drawed_numbers
  end
end
