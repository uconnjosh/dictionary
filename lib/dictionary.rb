class Term
  @@defs = []
  def Term.all
    @@defs
  end

  def Term.clear
    @@defs = []
  end

  def initialize(word, definition)
    @definitions = []
    @word = word
    @definitions << definition
    @term = {word => definitions}

  end

  def add_def(additional_def)
    @term[@word] << additional_def
    #@word << additional_def
    #@term = {@word => [@definitions, @definition]}
  end

  def delete
    @@defs.delete(self)
  end

  def search(word)
  begin
    @term.fetch(word)
  rescue
    p 'The word doesnt exist in your dictionary!! Try adding it!'
    main_menu
  end

  end

  def edit(new_description)
    @definition = new_description
    @term = {@word => @definition}
  end

  def save
    @@defs << self
  end

  def term
    @term
  end

def definitions
  @definitions
  end
end
