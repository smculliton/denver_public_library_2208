class Library
  attr_reader :name, :books, :authors, :checked_out_books, :book_popularity

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @book_popularity = Hash.new(0)
  end

  def add_author(author)
    @authors << author 
    author.books.each { |book| @books << book }
  end

  def publication_time_frame_for(author)
    {
      start: author.books.min_by(&:publication_year).publication_year,
      end: author.books.max_by(&:publication_year).publication_year
    }
  end

  def checkout(book)
    return false unless @books.include?(book) && !@checked_out_books.include?(book)
    @checked_out_books << book 
    @book_popularity[book] += 1
    true
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @book_popularity.keys.max_by { |book| @book_popularity[book] }
  end
end