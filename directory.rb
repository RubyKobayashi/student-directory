@students = []
require 'csv'

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
    while !@name.empty? do
  # add the student hash to the array
  add_students_info_to_list
  puts "Now we have #{@students.count} students"
  # get another name from the user
  @name = STDIN.gets.chomp

end
  end



def add_students_info_to_list
  student_hash_info = {name: @name, cohort: :november}
  @students << student_hash_info
end

def show_students
print_header
print_student_list
print_footer
end

def print_header
  puts "The students of Villains Academy
  -------------"
end



def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
 end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end



def save_students

  puts "Which file would you like to save to?"
  filename = STDIN.gets.chomp
  while !File.exists?(filename) do
    puts 'Sorry that file does not exist - please re-enter a filename'
    filename = STDIN.gets.chomp
  end
  # open the file for writing
  CSV.open(filename, "w") do |csv|
 # iterate over the array of students
     @students.each do |student|
     student_data = [student[:name], student[:cohort]]
      csv << student_data

end
end


  puts "The students you have inputted have been saved"
end






def load_students(filename = "students.csv")
  puts "Which file would you like to load?"
  filename = STDIN.gets.chomp
  while !File.exist?(filename)
    puts "Sorry that file does not exist - please re-enter a filename"
    filename = STDIN.gets.chomp
  end

  CSV.foreach("students.csv") do |row|
    @name, cohort = row.join(",").split(',')
    add_students_info_to_list
  end
  puts "The students list has been loaded"
end




def try_load_students(filename = ARGV.first)
  if filename.nil?
    filename = "students.csv"
  elsif !File.exists?(filename)
    puts "Sorry #{filename} doesn't exist"
       exit
  end
    load_students
    puts "Loaded #{@students.count} from #{filename}"
end



try_load_students
interactive_menu
