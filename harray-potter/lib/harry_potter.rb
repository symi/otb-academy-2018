class BookStore
  def price(books)
    tallies = tally(books).sort.reverse
    price = 0
    unit_price = 8

    puts tallies.inspect

    while tallies.length > 0
      unique_books = tallies.length
      book_index = unique_books - 1

      case unique_books
      when 4
        temp_price = (unique_books * unit_price) * discount(unique_books)
        tallies[book_index] -= 1
        tallies[book_index - 1] -= 1
        tallies[book_index - 2] -= 1
        tallies[book_index - 3] -= 1
        price += temp_price
      when 3
        temp_price = (unique_books * unit_price) * discount(unique_books)
        tallies[book_index] -= 1
        tallies[book_index - 1] -= 1
        tallies[book_index - 2] -= 1
        price += temp_price
      when 2
        temp_price = (unique_books * unit_price) * discount(unique_books)
        tallies[book_index] -= 1
        tallies[book_index - 1] -=  1
        price += temp_price
      when 1
        temp_price = (unique_books * unit_price) * discount(unique_books)
        tallies[book_index] -= 1
        price += temp_price
      end

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
