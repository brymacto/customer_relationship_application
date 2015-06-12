class Contact
  attr_accessor :first_name, :last_name, :email, :notes
  attr_reader :id

  def initialize(id, first_name, last_name, email, notes)
    @id = id
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @notes = notes
  end

  def display_all_values
    print_line
    puts "ID: #{@id}"
    puts "First Name: #{@first_name}"
    puts "Last Name: #{@last_name}"
    puts "Email: #{@email}"
    puts "Notes: #{@notes}"
    print_line
  end

  def display_all_values_compact
    puts "#{id}: #{first_name} #{last_name}, #{@email}, #{@notes}"
  end

    def print_line
    puts "\n********************\n"
  end
end