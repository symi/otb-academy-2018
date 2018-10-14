class BookStore
  attr_reader :books

  def price(books)
    @books = books
    book_sets = BookSets.new(tally)
    Pricer.new(book_sets).to_f
  end

  def tally
    books.uniq.map { |book| count_for_book(book) }
  end

  def count_for_book(book)
    books.count { |current_book| current_book == book }
  end

  class BookSets
    include Enumerable

    attr_reader :tallies, :book_sets

    def initialize(tallies)
      @tallies = tallies.sort.reverse
      @book_sets = caluclate_best_sets(get_sets)
    end

    def get_sets
      sets = []

      while unique_books > 0
        book_index = unique_books - 1

        sets.push(unique_books)
        book_index.downto(0).each { |index| tallies[index] -= 1 }

        tallies.delete_if { |book| book == 0 }
      end

      sets
    end

    def caluclate_best_sets(sets)
      if sets.include?(3) && sets.include?(5)
        sets[sets.index(3)] = 4
        sets[sets.index(5)] = 4
      end

      sets
    end

    def unique_books
      tallies.length
    end

    def each(&block)
      book_sets.each(&block)
    end
  end

  class Pricer
    attr_reader :book_sets

    SET_PRICES = {
      1 => 8,
      2 => 15.20,
      3 => 21.60,
      4 => 25.60,
      5 => 30,
    }

    def initialize(book_sets)
      @book_sets = book_sets
    end

    def to_f
      book_sets.inject(0) { |running_price, set| running_price + price_of_set(set)}
    end

    def price_of_set(unique_books)
      SET_PRICES[unique_books]
    end
  end
end
