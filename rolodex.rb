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

  def display_contact(contact_id)
    contact_arr_index = find_contact_index(contact_id)
    if contact_arr_index != nil
      current_contact = @contacts[contact_arr_index]
      current_contact.display_all_values
    else
      puts "Contact not found"
    end

  end

  def display_attribute(attribute_id)
    print_line
    case attribute_id

    when 1 #FName
      puts "Printing all first names:"
      @contacts.each do |contact|
        puts "ID #{contact.id}: #{contact.first_name}"
      end

    when 2 #LName
      puts "Printing all last names:"
      @contacts.each do |contact|
        puts "ID #{contact.id}: #{contact.last_name}"
      end
    when 3 #Email
      puts "Printing all emails:"
      @contacts.each do |contact|
        puts "ID #{contact.id}: #{contact.email}"
      end
    when 4 #Notes
      puts "Printing all notes:"
      @contacts.each do |contact|
        puts "ID #{contact.id}: #{contact.notes}"
      end
    else
      puts "Invalid entry."
    end
    print_line
  end

  def modify_contact(contact_id)
    contact_arr_index = find_contact_index(contact_id)
    current_contact = @contacts[contact_arr_index]
    current_contact.display_all_values
    puts "What do you wish to edit for record #{current_contact.id}?"
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
      print "Please enter an updated first name (type no to cancel): "
      first_name_update = gets.chomp
      current_contact.first_name = first_name_update if first_name_update.downcase != "no"
    when 2
      puts "The last name is currently #{@contacts[contact_arr_index].last_name}"
      print "Please enter an updated last name (type no to cancel): "
      last_name_update = gets.chomp
      current_contact.last_name = last_name_update if last_name_update.downcase != "no"
    when 3
      puts "The email address is currently #{@contacts[contact_arr_index].email}"
      print "Please enter an updated email address (type no to cancel): "
      email_update = gets.chomp
      current_contact.email = email_update if email_update.downcase != "no"
    when 4
      puts "The notes are currently #{@contacts[contact_arr_index].notes}"
      print "Please enter updated notes (type no to cancel): "
      notes_update = gets.chomp
      current_contact.notes = notes_update if notes_update.downcase != "no"
    when 5
      puts "Cancelling..."
    else
      puts "Invalid entry.  Cancelling."
    end
    modify_status_message(current_contact)
  end
  def modify_status_message(record)
    puts "The record #{record.id} is now:"
    record.display_all_values
  end
  def find_contact_index(id)
    @contacts.index do |contact|
      contact.id.to_i == id.to_i
    end
  end

  def all
    @contacts
  end


  def print_line
    puts "\n********************\n"
  end
end