require 'date'

class Birthday < Date
  def anniversary?(date = Date.today)
    yday == date.yday
  end

  # def days_until
  #   diff = yday - self.class.today.yday
  #   diff += 365 if diff.negative?
  #   diff
  # end
end
