module Validation
  MAX_NAME_LENGTH = 40

  def self.valid_name?(string)
  #  return false if string.nil? || string.empty?
  #  return false if string.length > MAX_NAME_LENGTH

    eng_alphabet = ("a".."z").to_a + ("A".."Z").to_a
    ua_alphabet = ("а".."я").to_a + ("А".."Я").to_a + ["і", "ї", "є", "ґ", "І", "Ї", "Є", "Ґ"]
    valid_alphabet = eng_alphabet + ua_alphabet

    return false if string.length > 40 || string.chars.any? { |c| !valid_alphabet.include?(c) }

    true
  end
end

puts "Введіть ім'я:"
name = gets.chomp

if Validation.valid_name?(name)
  puts "Ім'я '#{name}' є валідним."
else
  puts "Ім'я '#{name}' є інвалідом(хибним)."  # Видалити "інваліда" перед комітом

end
