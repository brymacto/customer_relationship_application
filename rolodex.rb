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
    # arr_id = find_contact_index_opt2(id)
    puts @contacts[find_contact_index(id)].display_all_values
    # puts "find_contact_index(id).id: #{find_contact_index(id).first_name}"
    # puts "Current first name is #{@contacts[find_contact_index(id).id].first_name}"
  end

  def find_contact_index(id)
    @contacts.index { |contact|

      contact.id.to_i == id.to_i

    }

  end


  def all
    @contacts
  end
end