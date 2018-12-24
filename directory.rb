
def input_students
  students = []
  puts "If you make a typo, type typo, correct the spelling and press enter"
  while true do
  puts "Please enter a name of the student or to finish just hit enter twice"
  name = gets.chomp
  p name
  if name.empty?
    break

  elsif students.empty? && name == "typo"
    p "please re-enter the name of the student"
    name = gets.chomp

  elsif !students.empty? && name == "typo"
   puts "please re-enter the cohort"
   cohort = gets.chomp
   students.last[:cohort] = cohort
   puts "Please enter a name of the student or to finish just hit enter twice"
   name = gets.chomp
   if name.empty?
     break
end
end
    puts "Please enter the cohort of the student"
    cohort = gets.chomp

    if cohort == "typo"
      puts "please re-enter the name"
      name = gets.chomp
      puts "Please enter the cohort of the student"
      cohort = gets.chomp
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"
    elsif cohort.empty?
      students << {name: name, cohort: :unknown}
      else
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"


end
end
  students
end




def print_header
puts "The students of Villains Academy"
puts "-------------"
end


def print_cohort(students)
  cohort_month = []
  students.map { |student| cohort_month << student[:cohort] }
  cohort_groups = cohort_month.uniq
  cohort_index = 0
  while cohort_groups.length > cohort_index do
    puts "#{cohort_groups[cohort_index].capitalize} cohort members:".center(50)
    students.each do |student|
      if student[:cohort] == cohort_groups[cohort_index]
        puts student[:name].center(50)
    end
    end
  cohort_index += 1
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
  print(students)
print_footer(students)
print_cohort(students)
