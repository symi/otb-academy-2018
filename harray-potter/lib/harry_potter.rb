class BookStore
  def price(books)
    tallies = tally(books).sort.reverse
    price = 0
    unit_price = 8

    puts tallies.inspect

    while tallies.length > 0
      unique_books = tallies.length
      book_index = unique_books - 1

      price += (unique_books * unit_price) * discount(unique_books)
      book_index.downto(0).each { |index| tallies[index] -= 1 }

      puts tallies.inspect
      tallies.delete_if { |book| book == 0 }
    end

    price
  end

  def discount(unique_books)
    discounts = {
      1 => 1,
      2 => 0.95,
      3 => 0.90,
      4 => 0.80,
      5 => 0.75,
    }

    discounts[unique_books]
  end

  def tally(books)
    books.uniq.map { |book| count_for_book(books, book) }
  end

  def count_for_book(books, book)
    books.count { |b| b == book }
  end
end
