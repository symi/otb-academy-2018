class BookStore
  def price(books)
    tallies = tally(books).sort.reverse
    price = 0
    unit_price = 8

    puts tallies.inspect

    while tallies.length > 0
      unique_books = tallies.length - 1
      case tallies.length
      when 2
        temp_price = ((1 * unit_price) + (1 * unit_price)) * 0.95
        tallies[unique_books] = tallies[unique_books] - 1
        tallies[unique_books - 1] = tallies[unique_books - 1] - 1
        price += temp_price
      when 1
        temp_price = (1 * unit_price) * 1
        tallies[unique_books] = tallies[unique_books] - 1
        price += temp_price
      end

      puts tallies.inspect
      tallies.delete_if { |book| book == 0 }
    end

    price
  end

  def tally(books)
    books.uniq.map { |book| count_for_book(books, book) }
  end

  def count_for_book(books, book)
    books.count { |b| b == book }
  end
end
