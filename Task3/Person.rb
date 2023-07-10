require 'rspec'
require_relative 'person'

RSpec.describe Person do
  let(:valid_first_names) { ['Олександр', 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 'Марія', 'Олена', 'Вікторія'] }
  let(:valid_last_names) { ['Ковальчук', 'Петренко', 'Сидоренко', 'Василенко', 'Ткаченко'] }
  let(:valid_inns) { ['AZ1234543456', 'BG9876567890', 'CR2345RT4567', 'DT2346789', 'Et8765456789'] }
  let(:valid_birth_dates) { [Date.new(1990, 1, 1), Date.new(1985, 3, 15), Date.new(1993, 6, 30), Date.new(1988, 9, 12), Date.new(1997, 12, 25)] }

  describe '#initialize' do
    it 'creates a new instance of Person' do
      person = Person.new(valid_first_names[0], valid_last_names[0], valid_inns[0], valid_birth_dates[0])
      expect(person).to be_an_instance_of(Person)
    end

    it 'raises an error when invalid arguments are provided' do
      expect { Person.new(nil, valid_last_names[0], valid_inns[0], valid_birth_dates[0]) }.to raise_error(ArgumentError)
      expect { Person.new(valid_first_names[0], nil, valid_inns[0], valid_birth_dates[0]) }.to raise_error(ArgumentError)
      expect { Person.new(valid_first_names[0], valid_last_names[0], nil, valid_birth_dates[0]) }.to raise_error(ArgumentError)
      expect { Person.new(valid_first_names[0], valid_last_names[0], valid_inns[0], 'invalid_date') }.to raise_error(ArgumentError)
    end
  end

  describe '#full_name' do
    it 'returns the full name of the person' do
      person = Person.new(valid_first_names[1], valid_last_names[1], valid_inns[1], valid_birth_dates[1])
      expect(person.full_name).to eq('Іван Петренко')
    end
  end

  describe '#age' do
    it 'returns the age of the person' do
      person = Person.new(valid_first_names[2], valid_last_names[2], valid_inns[2], valid_birth_dates[2])
      expect(person.age).to eq(Date.today.year - valid_birth_dates[2].year)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the person' do
      person = Person.new(valid_first_names[3], valid_last_names[3], valid_inns[3], valid_birth_dates[3])
      expect(person.to_s).to eq('Олена Василенко, INN: DT2345766789, Birth Date: 1988-09-12')
    end
  end

  describe 'attribute setters' do
    let(:person) { Person.new(valid_first_names[4], valid_last_names[4], valid_inns[4], valid_birth_dates[4]) }

    it 'sets the first name if it is valid' do
      person.first_name = 'Наталія'
      expect(person.first_name).to eq('Наталія')
    end

    it 'raises an error when setting an invalid first name' do
      expect { person.first_name = nil }.to raise_error(ArgumentError)
      expect { person.first_name = '' }.to raise_error(ArgumentError)
    end

    it 'sets the last name if it is valid' do
      person.last_name = 'Ткаченко'
      expect(person.last_name).to eq('Ткаченко')
    end

    it 'raises an error when setting an invalid last name' do
      expect { person.last_name = nil }.to raise_error(ArgumentError)
      expect { person.last_name = '' }.to raise_error(ArgumentError)
    end

    it 'sets the INN if it is valid' do
      person.inn = 'ER9876543210'
      expect(person.inn).to eq('ER9876543210')
    end

    it 'raises an error when setting an invalid INN' do
      expect { person.inn = nil }.to raise_error(ArgumentError)
      expect { person.inn = '12345' }.to raise_error(ArgumentErrorОновлений тестовий код включує перевірку формату ІПН (AZ1234543456) та додаткові значення для імен, прізвищ і ІПН. Тест перевіряє правильність роботи методів та обробку неправильних вхідних даних.

Будь ласка, використовуйте цей оновлений тестовий код для перевірки класу `Person`.
