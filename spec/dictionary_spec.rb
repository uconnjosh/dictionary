require 'rspec'
require 'dictionary'


describe Term do

  before do
    Term.clear
  end


  it 'is initialized with a word and a definition' do
    test_term = Term.new('apple','a delicious, red fruit')
    puts test_term.term
    test_term.should be_an_instance_of Term
    end

  describe '.all' do
  it 'is empty at first' do
   Term.all.should eq []
   end
  end
  describe '#save' do
    it 'adds a word definition pair to the array of saved terms' do
      test_term = Term.new('snake', 'a scary, slithery, creepy animal')
      test_term.save
      Term.all.should eq [test_term]
    end
  end
  describe '#delete' do
    it 'will delete a term from the dictionary....FOREVER!!!' do
    test_term = Term.new('snake', 'a scary, slithery, creepy animal')
      test_term.save
      test_term.delete
      Term.all.should eq []
    end
  end

  describe '#edit' do
    it 'changes the defintion of a term' do
      test_term = Term.new('snake', 'a scary, slithery, creepy animal')
      test_term.save
      test_term.edit('I love snakes!')
      test_term.term.should eq ({'snake' => "I love snakes!"})
    end
  end

   describe '.clear' do
    it 'empties out all of the saved terms' do
      Term.new('snake', 'a scary, slithery, creepy animal').save
      Term.clear
      Term.all.should eq []
    end
  end

  describe '#search' do
    it 'should find a term from a list of terms' do
      test_term = Term.new('snake', 'a deadly killer')
      test_term.save
      test_term.search('snake')
      test_term.term.should eq test_term.term
    end
  end
  describe '#add_def' do
    it 'should add a new definition the a previously initialized term' do
      test_term = Term.new('snake', 'a deadly killer')
      test_term.save
      test_term.add_def('An often misunderstood, friendly animal. You should cuddle with them')
      test_term.term.should eq ({'snake' => ['a deadly killer', 'An often misunderstood, friendly animal. You should cuddle with them']})
    end
  end
end


