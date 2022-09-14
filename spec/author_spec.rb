require 'rspec'
require './lib/author'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end
  describe '#initialize' do 
    it 'has a name' do 
      expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
    end
    it 'has no books' do 
      expect(@charlotte_bronte.books).to eq([])
    end
  end
  describe '#write' do 
    before(:each) do 
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @villette = @charlotte_bronte.write("Villette", "1853")
    end
    it 'creates a Book' do 
      expect(@jane_eyre).to be_a Book
      expect(@jane_eyre.title).to eq('Jane Eyre')
    end
    it 'adds to list of books' do 
      expect(@charlotte_bronte.books).to eq([@jane_eyre, @villette])
    end
  end
end
