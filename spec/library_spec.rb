require 'rspec'
require './lib/library'
require './lib/author'

RSpec.describe Library do 
  before(:each) do 
    @dpl = Library.new('Denver Public Library')
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
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

  context '#adding authors' do 
    before(:each) do 
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
    end
    describe '#add_author' do 
      it 'adds author to list of authors' do 
        expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
      end
      it 'adds authors books to list of books' do 
        expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
      end
    end
    describe '#publication_time_frame' do 
      it 'returns earliest and latest pub years' do 
        expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
        expect(@dpl.publication_time_frame_for(@harper_lee)).to eq({:start=>"1960", :end=>"1960"})
      end
    end
  end
end