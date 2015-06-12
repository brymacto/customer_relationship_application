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

  def modify_contact(id)
    arr_id = find_contact_index(id)
    # puts "find_contact_index(id).id: #{find_contact_index(id).first_name}"
    # puts "Current first name is #{@contacts[find_contact_index(id).id].first_name}"
  end

  def find_contact_index_opt2(id)
    @contacts.each do |contact|
      if contact.id.to_i == id.to_i
        contact.display_all_values
        puts "Contact: #{@contacts.index("")}"
        return
      end
    end
    puts "No record found with ID #{id}"
  end


  def find_contact_index(id)
    @contacts.each do |contact|
      if contact.id.to_i == id.to_i
        contact.display_all_values
        puts "Contact: #{@contacts.index("")}"
        return
      end
    end
    puts "No record found with ID #{id}"
  end

  def all
    @contacts
  end
end