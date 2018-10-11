class BookStore
  def price(books)
    tallies = tally(books).sort.reverse
    sets = get_sets(tallies)
    sets.inject(0) { |running_price, set| running_price + price_of_set(set)}
  end

  def get_sets(tallies)
    sets = []

    while tallies.length > 0
      unique_books = tallies.length
      book_index = unique_books - 1

      sets.push(unique_books)
      book_index.downto(0).each { |index| tallies[index] -= 1 }

      tallies.delete_if { |book| book == 0 }
    end

    caluclate_best_sets(sets)
  end

  def caluclate_best_sets(sets)
    if sets.include?(3) && sets.include?(5)
      sets[sets.index(3)] = 4
      sets[sets.index(5)] = 4
    end

    sets
  end

  def price_of_set(unique_books)
    set_prices = {
      1 => 8,
      2 => 15.20,
      3 => 21.60,
      4 => 25.60,
      5 => 30,
    }

    set_prices[unique_books]
  end

  def tally(books)
    books.uniq.map { |book| count_for_book(books, book) }
  end

  def count_for_book(books, book)
    books.count { |b| b == book }
  end
end
