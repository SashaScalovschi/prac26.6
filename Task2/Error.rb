class PersonAlreadyExistsError < StandardError
    def initialize(inn)
      super("Person with INN #{inn} already exists.")
    end
  end
  
  class PersonNotFoundError < StandardError
    def initialize(inn)
      super("Person with INN #{inn} not found.")
    end
  end
  
  class ObjectNotOfPersonTypeError < StandardError
    def initialize()
      super("Person must be of type Person.Class")
    end
  end
  