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
    @rolodex.add_contact("Britney", "Spears", "bspears@gmail.com", "Oops I did it again.")
    @rolodex.add_contact("Christina", "Aguilera", "xtina@dirty.com", "Wanna get dirty.")
    @rolodex.add_contact("Miley", "Cyrcus", "miley@cyrus.com", "I came in like a wrecking ball.")
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display a user"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3 then display_all_contacts
    when 4 then display_contact
    when 5 then display_attribute
    when 6 then delete_contact
    when 7
      puts "Goodbye"
      exit
    else
      puts "I'm sorry, I'm afraid I can't do that."
    end
  end

  def main_menu
    puts "Welcome to #{@name}.  Some sample data has been added to your CRM."
    while true
      print_main_menu

      print "Select an option:"
      input = gets.chomp.to_i
      print_line
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
  def display_contact
    print "Please enter the ID of the contact you wish to display:"
    current_id = gets.chomp.to_i
    @rolodex.display_contact(current_id)

  end
  def display_attribute
    puts "Please enter the attribute you would like to see"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Notes"
    answer = gets.chomp.to_i
    @rolodex.display_attribute(answer)
  end
  def display_all_contacts
    print_line
    @rolodex.all.each do |contact|
      contact.display_all_values_compact
      # puts "#{contact.first_name} #{contact.last_name}"
    end
    print_line
  end

  def delete_contact
    print "Please enter the ID of the contact you wish to delete:"
    current_id = gets.chomp.to_i
    @rolodex.delete_contact(current_id)
    puts "Your contacts are:"
    display_all_contacts
  end

  def print_line
    puts "\n********************\n"
  end
end

CRM.run("Bryan's CRM")


