require './lib/dictionary'

def main_menu
  puts "Hello! Welcome to the dictionary app!"
  puts "Enter 'A' to add a term"
  puts "Enter 'P' to see your terms"
  puts "Enter 'S' to search for a term"
  puts "Enter 'X' to exit"
  answer = gets.chomp
  case answer
  when 'A'
    add_term
  when  'P'
    display_terms
  when 'S'
    display_search
  when 'X'
    puts 'GoodBye!'
  end
end

def add_term
    puts 'Enter a term: '
    new_word = gets.chomp
    puts 'Enter its definition'
    new_def = gets.chomp
    new_term = Term.new(new_word, new_def)
    new_term.save
    main_menu
end


def display_terms
  puts "Here are your terms: "
  puts '\n'
    Term.all.each do |term|
      current_hash = term.term
      puts current_hash.keys[0]

    end
    search_terms
  end

def display_search
  puts "Enter a term to search for"
  current_search = gets.chomp
  Term.all.each do |term|
    term.search(current_search)
    puts term
    puts term.definition
    main_menu
  end
end

def search_terms
  puts "Enter a word to see its definition"
  current_word = gets.chomp
   Term.all.each do |term|
    i = 0
      current_hash = term.term
      current_object = term
      if current_word == current_hash.keys[i]
        puts 'The definition of ' + current_word + ' is:'
        puts current_hash.values
        puts 'Press D to delete the entry, A to add a definition, and E to edit a definition'
        delete_entry = gets.chomp.upcase
        case delete_entry
        when "D"
          current_object.delete
        when "DELETE"
          current_object.delete
        when "E"
          puts "What would you like the new definition to be?"
          new_def = gets.chomp
          current_object.edit(new_def)
        when 'A'
          puts "Add another definition"
          add_def2 = gets.chomp
          current_object.add_def(add_def2)
        else
          main_menu
        end

      end
      i += 1
    end
    main_menu
end

main_menu




