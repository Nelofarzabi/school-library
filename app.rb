require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'print_utils'

class App
  attr_accessor :input, :person_type, :students, :persons, :books, :rentals

  def initialize
    @input = ''
    @person_type = ''
    @persons = []
    @books = []
    @rentals = []
  end

  def give_instruction
    puts "\nPlease choose an option by entering a number"
    puts '1 - list all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all the rentals for a given person id'
    puts '7 - Exit'
  end

  def print_welcome_message
    puts 'Welcome to School Library App!'
  end

  def start
    give_instruction
    @input = gets.chomp
    execute
  end

  def execute
    print_check
    case input
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '7'
      exit_app
    end
  end

  def print_check
    case input
    when '1'
      print_books
    when '2'
      print_person
    when '6'
      print_rental_with_id
    end
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2)? [input number]: '
    @person_type = gets.chomp
    if person_type == '1'
      create_student
    elsif person_type == '2'
      puts create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = permission.downcase == 'y'
    classroom = Classroom.new('ss2')
    new_student = Student.new(age, classroom, name, parent_permission: permission)
    classroom.add_student(new_student)
    @persons << new_student
    puts 'Person created successfully'
    start
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(age, specialization, name)
    @persons << new_teacher
    puts 'Person created successfully'
    start
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books << new_book
    puts 'Book created successfully'
    start
  end

  def create_rental
    if persons.length.positive? && books.length.positive?
      puts 'select a book from the following list by number'
      print_books_with_index
      book_index = gets.chomp.to_i
      puts
      puts 'select a person from the following list by number (not id)'
      print_person_with_index
      person_index = gets.chomp.to_i
      puts
      book_instance = books[book_index]
      person_instance = persons[person_index]
      print 'Date: '
      date = gets.chomp
      new_rental = Rental.new(date, book_instance, person_instance)
      @rentals << new_rental
      puts 'Rental created successfully'
    end
    start
  end

  def exit_app
    puts "Thank you for using this app!\n\n"
    exit
  end
  include Print
end
