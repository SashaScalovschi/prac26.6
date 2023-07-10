require 'rspec'
require_relative 'person_repository'
require_relative 'person'

RSpec.describe PersonRepository do
  let(:repository) { PersonRepository.new }
  let(:person1) { Person.new('Олександр', 'Ковальчук', 'AZ1234543456', Date.new(1990, 1, 1)) }
  let(:person2) { Person.new('Іван', 'Петренко', 'BH9876512345', Date.new(1985, 3, 15)) }
  let(:person3) { Person.new('Марія', 'Сидоренко', 'KJ5678432156', Date.new(1993, 6, 30)) }
  let(:person4) { Person.new('Олена', 'Мельник', 'PO8765943210', Date.new(1988, 9, 12)) }
  let(:person5) { Person.new('Вікторія', 'Коваленко', 'TR1234509876', Date.new(1997, 12, 25)) }

  describe '#add_person' do
    it 'adds a person to the repository' do
      repository.add_person(person1)
      expect(repository.people).to include(person1)
    end

    it 'raises an error when trying to add a person with duplicate INN' do
      repository.add_person(person1)
      expect { repository.add_person(person1) }.to raise_error(PersonAlreadyExistsError)
    end

    it 'raises an error when trying to add a non-Person object' do
      expect { repository.add_person('invalid_person') }.to raise_error(ObjectNotOfPersonTypeError)
    end
  end

  describe '#edit_person_by_inn' do
    before do
      repository.add_person(person1)
    end

    it 'edits the details of a person' do
      repository.edit_person_by_inn(person1.inn, 'Олександр', 'Петренко', Date.new(1992, 4, 10))
      updated_person = repository.get_by_inn(person1.inn)
      expect(updated_person.first_name).to eq('Олександр')
      expect(updated_person.last_name).to eq('Петренко')
      expect(updated_person.birth_date).to eq(Date.new(1992, 4, 10))
    end

    it 'raises an error when the person is not found' do
      expect { repository.edit_person_by_inn('invalid_inn', 'Олександр', 'Петренко', Date.new(1992, 4, 10)) }.to raise_error(PersonNotFoundError)
    end
  end

  describe '#delete_person_by_inn' do
    before do
      repository.add_person(person1)
      repository.add_person(person2)
    end

    it 'deletes a person from the repository' do
      repository.delete_person_by_inn(person1.inn)
      expect(repository.people).not_to include(person1)
    end

    it 'raises an error when the person is not found' do
      expect { repository.delete_person_by_inn('invalid_inn') }.to raise_error(PersonNotFoundError)
    end
  end

  describe '#get_by_inn' do
    before do
      repository.add_person(person1)
      repository.add_person(person2)
      repository.add_person(person3)
    end

    it 'returns the person with the specified INN' do
      found_person = repository.get_by_inn(person2.inn)
      expect(found_person).to eq(person2)
    end

    it 'returns nil when the person with the specified INN is not found' do
      found_person = repository.get_by_inn('invalid_inn')
      expect(found_person).to be_nil
    end
  end

  describe '#get_by_part_name' do
    before do
      repository.add_person(person1)
      repository.add_person(person2)
      repository.add_person(person3)
    end

    it 'returns people with matching first names' do
      matching_people = repository.get_by_part_name('олекс')
      expect(matching_people).to include(person1)
      expect(matching_people).not_to include(person2, person3)
    end

    it 'returns people with matching last names' do
      matching_people = repository.get_by_part_name('петр')
      expect(matching_people).to include(person2)
      expect(matching_people).not_to include(person1, person3)
    end

    it 'returns people with matching first or last names' do
      matching_people = repository.get_by_part_name('санд')
      expect(matching_people).to include(person1, person2)
      expect(matching_people).not_to include(person3)
    end

    it 'returns an empty array when no matching people are found' do
      matching_people = repository.get_by_part_name('xyz')
      expect(matching_people).to be_empty
    end
  end