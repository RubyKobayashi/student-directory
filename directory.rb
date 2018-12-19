
def input_students
  students = []
  puts "If you make a typo, type typo, correct the spelling and press enter"
  while true do
  puts "Please enter a name of the student or to finish just hit enter twice"
  name = gets.strip
  p name
  if name.empty?
    break

  elsif students.empty? && name == "typo"
    p "please re-enter the name of the student"
    name = gets.strip

  elsif !students.empty? && name == "typo"
   puts "please re-enter the cohort"
   cohort = gets.chomp
   students.last[:cohort] = cohort
   puts "Please enter a name of the student or to finish just hit enter twice"
   name = gets.strip
   if name.empty?
     break
end
end
    puts "Please enter the cohort of the student"
    cohort = gets.strip

    if cohort == "typo"
      puts "please re-enter the name"
      name = gets.strip
      puts "Please enter the cohort of the student"
      cohort = gets.strip
      students << {name: name, cohort: cohort}
      if students.count == 1
        puts "Now we have 1 student"
      else
      puts "Now we have #{students.count} students"
    end
    elsif cohort.empty?
      students << {name: name, cohort: :unknown}
      else
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have 1 student"
    else
    puts "Now we have #{students.count} students"
  end

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
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end





def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  elsif names.count > 1
    puts "Overall, we have #{names.count} great students"
end
end

students = input_students
print_header
print(students)
print_footer(students)
