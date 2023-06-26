
module Validation

  def self.valid_name?(string)

    eng_alphabet = ("a".."z").to_a + ("A".."Z").to_a
    ua_alphabet = ("а".."я").to_a + ("А".."Я").to_a + ["і", "ї", "є", "ґ", "І", "Ї", "Є", "Ґ"]
    valid_alphabet = ua_alphabet + eng_alphabet 

    return false if string.length > 40 || string.chars.any? { |c| !valid_alphabet.include?(c) }

    true
  end
  def self.valid_inn?(string)
    return false unless string =~ /^[A-Z]{2}\d{10}$/

    true
end
end

puts "Введіть ім'я :"
name = gets.chomp  #Замінити на "і" англійське 

if Validation.valid_name?(name)
  puts "Ім'я '#{name}' є валідним."
else
  puts "Ім'я '#{name}' є інвалідом(хибним)."  # Видалити "інваліда" перед комітом

end

puts "Введіть ІН (індивідуальки номер):"
inn = gets.chomp

if Validation.valid_inn?(inn)
  puts "ІПН '#{inn}' є валідним."
else
  puts "ІПН '#{inn}' є недійсним."
end