require 'date'

module Validation
  def self.valid_name?(string)
    if string =~ /\A[A-Za-z]+(-[A-Za-z]+)*\z/ && string.length <= 40
      true
    else
      false
    end
  end

  def self.valid_inn?(string)
    if string =~ /\A[A-Z]{2}\d{10}\z/
      true
    else
      false
    end
  end

  def self.after_date?(date)
    if date < Date.today
      true
    else
      false
    end
  end
end

puts Validation.valid_name?("Maria-Anna")

puts Validation.valid_inn?("AC1324473625")

puts Validation.after_date?(Date.new(1999, 03, 11))
puts Validation.after_date?(Date.today)