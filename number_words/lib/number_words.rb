class NumberWords
  attr_reader :number

  TOKENS = {
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

  CHUNKS = [1000000000, 1000000, 1000, 100]

  private_constant :TOKENS, :CHUNKS

  def initialize(number)
    @number = number
  end

  def to_s
    @number_words ||= to_words number
  end

  private

  def has_tail?(number_part, chunk)
    number_part % chunk != 0
  end

  def separator_string(number_part, chunk)
    if (number_part / (chunk / 10)) % 10 != 0 && number_part >= 1000
      "#{TOKENS[:comma]} "
    else
      " #{TOKENS[:and]} "
    end
  end

  def chunk_to_words(number_part, chunk)
    string = "#{to_words(number_part / chunk)} #{TOKENS[chunk]}"

    if has_tail?(number_part, chunk)
      string += separator_string(number_part, chunk)

      string += "#{to_words(number_part % chunk)}"
    end

    string
  end

  def two_digits_to_words(number_part)
    string = ""

    if number_part >= 20
      string += "#{TOKENS[(number_part / 10) * 10]}"

      if has_tail?(number_part, 10)
        string += " #{to_words(number_part % 10)}"
      end
    else
      string += TOKENS[number_part]
    end

    string
  end

  def to_words(number_part)
    string = ""

    CHUNKS.each do | chunk |
      if number_part >= chunk
        string += chunk_to_words(number_part, chunk)
        break
      elsif number_part < CHUNKS.last
        string += two_digits_to_words(number_part)
        break
      end
    end

    string
  end
end

def number_words(number)
  (NumberWords.new number).to_s
end
