# frozen_string_literal: true

require "test_helper"

class TestWinft < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Winft::VERSION
  end

  def test_that_it_starts_1601
    assert_equal Time.at_winft(0), Time.utc(1601).localtime
  end

  def test_that_it_starts_1601_string
    assert_equal Time.at_winft('0'), Time.utc(1601).localtime
  end

  def test_that_it_measures_100_nanoseconds
    assert_equal Time.at_winft(10_000_000), Time.utc(1601, 1, 1, 0, 0, 1).localtime
  end
end
