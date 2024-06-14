# frozen_string_literal: true

# Extend Time functionality
class Time
  # Multiplier from milliseconds to 100 nanoseconds
  WINFT_MULTIPLIER = 10_000_000.0
  WINFT_EPOCH = "01/01/1601"

  # Date.parse(WINFT_EPOCH).strftime('s').to_i * WIN32FT_MULTIPLIER
  # => -11644473600 * 10_000_000.0
  # => -116444736000000000
  WINFT_OFFSET = -116_444_736_000_000_000

  # parse windows FILETIME
  #
  # A Windows file time is a 64-bit value that represents
  # the number of 100-nanosecond intervals that have elapsed
  # since 12:00 midnight, January 1, 1601 A.D. (C.E.) Coordinated Universal Time (UTC).
  # Windows uses a file time to record when an application creates, accesses, or writes to a file.
  #
  def self.at_winft(timestamp)
    at((timestamp.to_i + WINFT_OFFSET) / WINFT_MULTIPLIER)
  end
end
