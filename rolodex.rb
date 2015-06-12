require_relative('contact.rb')

class Rolodex
  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @@id += 1
    @contacts << contact
  end

  def modify_contact(contact_id)
    contact_arr_index = find_contact_index(contact_id)
    puts @contacts[contact_arr_index].display_all_values
    puts "What do you wish to edit?"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Notes"
    puts "[5] Cancel"
    print "Your response: "
    field_edit = gets.chomp.to_i
    case field_edit
    when 1
      puts "The first name is currently #{@contacts[contact_arr_index].first_name}"
    when 2
      puts "Editing last name"
    when 3
      puts "Editing email"
    when 4
      puts "Editing notes"
    when 5
      puts "Cancelling..."
    else
      puts "Invalid entry.  Cancelling."
    end
  end

  def find_contact_index(id)
    @contacts.index do |contact|
      contact.id.to_i == id.to_i
    end
  end

  def all
    @contacts
  end
end