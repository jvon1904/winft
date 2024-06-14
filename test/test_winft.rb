# frozen_string_literal: true

require "test_helper"

class TestWinft < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Winft::VERSION
  end

  def test_starting_epoch
    assert_equal Time.at_winft(0), Time.utc(1601).localtime
    assert_equal Time.at_winft("0"), Time.utc(1601).localtime
  end

  def test_measures_100_nanoseconds
    assert_equal Time.at_winft(10_000_000), Time.utc(1601, 1, 1, 0, 0, 1).localtime
    assert_equal Time.at_winft("10000000"), Time.utc(1601, 1, 1, 0, 0, 1).localtime
  end
end
