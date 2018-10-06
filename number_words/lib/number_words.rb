def number_words(number)
  tokens = {
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
    100 => "hundred",
    1000 => "thousand",
    1000000 => "million",
    1000000000 => "billion",
    :and => "and",
    :comma => ",",
  }

  limits = [1000000000, 1000000, 1000]

  string = ""

  limits.each do | limit |
    if number >= limit
      string += "#{number_words(number / limit)} #{tokens[limit]}"

      if number % limit != 0
        if (number / (limit / 10)) % 10 != 0
          string += "#{tokens[:comma]}"
        else
          string += " #{tokens[:and]}"
        end

        string += " #{number_words(number % limit)}"
      end

      break
    elsif number < limits.last
      if number >= 100
        string += "#{number_words(number / 100)} #{tokens[100]}"

        if number % 100 != 0
          string += " #{tokens[:and]} #{number_words(number % 100)}"
        end
      elsif number >= 20
        string += "#{tokens[(number / 10) * 10]}"

        if number % 10 != 0
          string += " #{number_words(number % 10)}"
        end
      else
        string += tokens[number]
      end

      break
    end
  end

  string
end
