require_relative 'Employee'

def add_employee(employees)
  puts '[Add an employee]'
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp.to_i

  print 'Is the person an [e]mployee, a [p]rogrammer, or an [o]ffice manager?'
  employee_type = gets.chomp.downcase[0]

  case employee_type
   when 'e' then employee = Employee.new(full_name, id)
   when 'p' then 
  print 'Programming languages: ';
    languages = gets.chomp
    employee = Programmer.new(full_name, id, languages);
   when 'o' then 
  print 'Office: ';
    office = gets.chomp
    employee = OfficeManager.new(full_name, id, office);
   else puts 'Invalid type'; return
  end

  employees << employee
end

def edit_employee(employees)
  puts '[Edit an employee]'
  print 'ID of the employee you want to edit: '
  id = gets.chomp.to_i

  current_user = employees.detect {|e| e.id == id}
  if (current_user == nil)
      puts "invalid id"
      return
  end
  
  puts "Current full name: #{current_user.full_name}"

  print 'New Full name: '
  new_full_name = gets.chomp
  
  print 'New id: '
  new_id = gets.chomp.to_i

  case current_user
    when Programmer then
      print 'Programming languages: '
      current_user.languages = gets.chomp
    when OfficeManager then
      print 'Office: '
      current_user.office = gets.chomp
    end

  current_user.id = new_id
  current_user.full_name = new_full_name

end

def view_employees(employees)
  print 'Sort by [f]irst name or [l]ast name?'
  sort_type = gets.chomp.downcase[0]

  sorted_employees(employees, sort_type).each do |employee|
    puts employee
  end
end

def sorted_employees(employees, sort_by)
  if (sort_by == 'f')
    employees.sort_by do |employee|
      employee.name
    end
  else employees.sort_by do |employee|
      employee.surname 
    end
  end
end

def quit
  puts 'Goodbye!'
  exit
end

def print_help
  puts '[HELP]'
  puts 'Enter one of the following:'
  puts 'a - to add a new employee'
  puts 'e - to edit an existing employee record'
  puts 'v - to view existing employees'
  puts 'q - to quit the program'
end

def get_action
   gets.downcase[0]
end

puts 'Employee-o-matic 4000'

employees = [Employee.new("a b", 1), Employee.new("b a", 2), Programmer.new("c d", 3, ['Kotlin, Swift']), OfficeManager.new("e d", 4, "1600 Pennsylvania Ave NW, Washington")]

loop do
  print 'What do you want to do? '
  action = get_action

  case action
  when 'a' then add_employee(employees)
  when 'e' then edit_employee(employees)
  when 'v' then view_employees(employees)
  when 'q' then quit
  else
    print_help
  end
end

