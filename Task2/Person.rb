require 'date'

module ConsoleInput
  def ask_user(prompt)
    puts prompt
    gets.chomp
  end
end

module Validation
  def valid_name?(name)
    !name.nil? && !name.empty?
  end

  def valid_inn?(inn)
    /^\d{10}$/.match?(inn)
  end

  def valid_birth_date?(date)
    date.is_a?(Date) && date <= Date.today
  end
end

class Person
  include ConsoleInput
  include Validation

  attr_reader :first_name, :last_name, :inn, :birth_date

  def initialize(first_name, last_name, inn, birth_date)
    self.first_name = first_name
    self.last_name = last_name
    self.inn = inn
    self.birth_date = birth_date
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  def to_s
    "#{full_name}, INN: #{inn}, Birth Date: #{birth_date.strftime('%Y-%m-%d')}"
  end

  def first_name=(new_first_name)
    if valid_name?(new_first_name)
      @first_name = new_first_name
    else
      raise ArgumentError, "Invalid first name."
    end
  end

  def last_name=(new_last_name)
    if valid_name?(new_last_name)
      @last_name = new_last_name
    else
      raise ArgumentError, "Invalid last name."
    end
  end

  def inn=(new_inn)
    if valid_inn?(new_inn)
      @inn = new_inn
    else
      raise ArgumentError, "Invalid INN."
    end
  end

  def birth_date=(new_birth_date)
    birth_date = Date.parse(new_birth_date)
    if valid_birth_date?(birth_date)
      @birth_date = birth_date
    else
      raise ArgumentError, "Invalid birth date."
    end
  end
end
