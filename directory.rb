
def input_students
  students = []
  while true do
  puts "Please enter a name of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp
  if name.empty?
    break
  else
    puts "Please enter the height of the student in cm"
    height = gets.chomp
    puts "Please enter the country of birth of the student"
    country = gets.chomp
    students << {name: name, height: height, country: country, cohort: :november}
    puts "Now we have #{students.count} students"
  end
end
  students
end



def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
    students.each do |student|
    puts "#{student[:name]} from #{student[:country]}, #{student[:height]} cm tall, (#{student[:cohort]} cohort)".center(80, "-")
  end
end


def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
