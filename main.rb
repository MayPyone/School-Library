require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
class Main
  def initialize()
    @person = []
    @books = []
    @rental = []
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

  def create_book()
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book has been created successfully'
  end

  def book_list()
    length = @books.length
    @books.map do |book|
      puts "Title: #{book.title}"
      puts "Author: #{book.author}"
    end
    return unless length.zero?

    puts 'No book has been created yet'
  end

  def person_list()
    puts 'No account has created yet' if @person.empty?
    @person.map { |person| puts "[#{person.role}] Name: #{person.name} ID: #{person.id} AGE: #{person.age}" }
  end

  def create_rental()
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      print "#{index})  "
      print "Title: #{book.title}  "
      puts "Author: #{book.author} "
    end
    book_num = gets.chomp.to_i
    s_book = @books[book_num]
    puts 'Select a person from the following list by number(not id)'
    @person.each_with_index do |person, index|
      print "#{index})  "
      puts "Name:#{person.name} ID: #{person.id}   Age: #{person.age}"
    end
    person_num = gets.chomp.to_i
    s_person = @person[person_num]
    print 'Date: '
    s_date = gets.chomp
    date = Rental.new(s_date, s_person, s_book)
    @rental.push(date)
    puts 'Rental created successfully'
  end

  def all_rental()
    print 'ID of a person: '
    p_id = gets.chomp.to_i
    @rental.each do |rent|
      puts "Date: #{rent.date} ,Book #{rent.book.title} by #{rent.book.author}" if rent.person.id == p_id
    end
  end

  def option()
    puts 'Please choose an option by entering number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id'
    puts '7 - Exit'
  end

  def exit
    puts 'Exiting the program'
    exit
  end

  def option_num(choice)
    case choice
    when 1 then book_list
    when 2 then person_list
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then all_rental
    end
  end

  def run()
    loop do
      option
      choice = gets.chomp.to_i
      break if choice == 7

      option_num(choice)
    end
  end

  def main()
    run
  end
end

m = Main.new
m.main
