require_relative('rolodex.rb')

class CRM
  attr_reader :name

  def self.run(name)
    my_crm = CRM.new(name)
    my_crm.main_menu
  end

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
    #Sample contact data
    @rolodex.add_contact("Bryan", "MacDiarmid", "brymac@gmail.com", "This is me")
    @rolodex.add_contact("John", "Doe", "jdoe@gmail.com", "This is John")
    @rolodex.add_contact("John", "Doe", "jdoe@gmail.com", "This is John")
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display an attribute"
    puts "[5] Delete a contact"
    puts "[6] Exit"
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3 then display_contacts
    when 4 then display_attribute
    when 5 then delete_contact
    when 6
      puts "Goodbye"
      exit
    else
      puts "I'm sorry Dave, I'm afraid I can't do that."
    end
  end

  def main_menu
    puts "Welcome to #{@name}"
    while true
      print_main_menu

      print "Select an option:"
      input = gets.chomp.to_i
      puts "\n********************\n"
      # return if input == 6

      choose_option(input)
    end
  end

  def add_contact
    puts "Adding a contact"

    print "First name: "
    first_name = gets.chomp

    print "Last name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def edit_contact
    answer = "N"
    until answer == "Y" do
      print "Please enter the ID of the contact you wish to edit: "
      current_id = gets.chomp.to_i
      puts "The record you wish to edit is #{current_id}.  Is this correct?  Y or N."
      answer = gets.chomp.upcase

    end
    @rolodex.modify_contact(current_id) if answer == "Y"
  end

  def display_contacts
    @rolodex.all.each do |contact|
      contact.display_all_values_compact
      # puts "#{contact.first_name} #{contact.last_name}"
    end
  end
end

CRM.run("Bitmaker CRM")


