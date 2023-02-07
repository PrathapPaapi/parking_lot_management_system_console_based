options = { 1 => "Add entry of the Car.", 2 => "Remove entry of the Car.", 
    3 => "Find the invoice", 4 => "List of all Cars in parking lot.", 
    5 => "List of all invoices.", 6 => "Exit."
  }

options.each do |opt, description|
    puts "\n #{opt}. #{description}"
end