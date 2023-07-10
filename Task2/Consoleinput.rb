module ConsoleInput
    module_function
  
    def get_input(prompt, validation_proc)
      loop do
        print prompt
        input = gets.chomp
  
        return input if validation_proc.call(input)
  
        puts "Invalid input"
      end
    end
  
    def get_string_input
      get_input("Enter string input: ", ->(input) { input.is_a?(String) })
    end
  
    def get_int_input
      get_input("Enter integer value: ", ->(input) { input.match?(/\A[-+]?\d+\z/) }).to_i
    end
  
    def get_float_input
      get_input("Enter float value: ", ->(input) { input.match?(/\A[-+]?\d+(\.\d+)?\z/) }).to_f
    end
  
    def get_date_input
      get_input("Enter a date YYYY-MM-DD: ", ->(input) { Date.parse(input) rescue false })
    end
  
    def get_name_input
      get_input("Enter name: ", ->(input) { valid_name?(input) })
    end
  
    def get_birth_date_input
      get_input("Enter birth date: ", ->(input) { valid_birth_date?(Date.parse(input) rescue nil) })
    end
  
    def get_inn_input
      get_input("Enter INN value: ", ->(input) { valid_inn?(input) })
    end
  
    def valid_name?(name)
      # Реалізуйте валідацію для імені
      # Поверніть true, якщо ім'я є валідним, інакше - false
    end
  
    def valid_birth_date?(birth_date)
      # Реалізуйте валідацію для дати народження
      # Поверніть true, якщо дата народження є валідною, інакше - false
    end
  
    def valid_inn?(inn)
      # Реалізуйте валідацію для ІПН
      # Поверніть true, якщо ІПН є валідним, інакше - false
    end
  end
  