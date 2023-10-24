require_relative 'app'

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

def option_num(choice, app)
  case choice
  when 1 then app.book_list
  when 2 then app.person_list
  when 3 then app.create_person
  when 4 then app.create_book
  when 5 then app.create_rental
  when 6 then app.all_rental
  end
end

def run(app)
  loop do
    option
    choice = gets.chomp.to_i
    break if choice == 7

    option_num(choice, app)
  end
end

def main()
  app = App.new
  run(app)
end

main
