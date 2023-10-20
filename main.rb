require_relative 'person'
require_relative 'teacher'
require_relative 'student'
class Main
  def initialize()
    @person = []
    @books = []
  end

  def student?
    length = @person.length
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission?[Y/N]: '
    permission = gets.chomp
    p = Student.new(age, name: name, parent_permission: permission, role: 'student')
    @person.push(p)
    return false unless length < @person.length

    print 'Person created successfully'
  end

  def teacher
    length = @person.length
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name: name, specialization: specialization, role: 'teacher')
    @person.push(teacher)
    return unless length < @person.length

    puts 'Person created successfully'
  end

  def create_person()
    puts ' Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    number = gets.chomp.to_i
    if number == 1
      student?
    elsif number == 2
      teacher
    else
      puts 'Incorrect input'
    end
  end

  def person_list()
    puts 'No account has created yet' if @person.empty?
    @person.map { |person| puts "[#{person.role}] Name: #{person.name} ID: #{person.id} AGE: #{person.age}" }
  end

  def main()
    puts 'Please choose an option by entering number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id'
    puts '7 - Exit'
    choose = gets.chomp.to_i
    case choose
    when 2
      personList
    when 3
      create_person
    when 7
      return
    else
      puts ' sth wrong'
    end
    main
  end
end

m = Main.new
m.main
