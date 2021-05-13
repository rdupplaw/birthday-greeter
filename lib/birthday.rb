# frozen_string_literal: true

require 'date'

# Extends Date to calculate birthday-related metrics
class Birthday < Date
  def anniversary?(date = Date.today)
    yday == date.yday
  end

  def days_until(date = Date.today)
    diff = yday - date.yday
    diff += 365 if diff.negative?
    diff
  end
end
