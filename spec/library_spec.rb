require 'rspec'
require './lib/library'
require './lib/author'

RSpec.describe Library do 
  before(:each) do 
    @dpl = Library.new('Denver Public Library')
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end
  describe '#initialize' do 
    it 'has a name' do 
      expect(@dpl.name).to eq('Denver Public Library')
    end
    it 'has no books or authors' do
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end
  end

end