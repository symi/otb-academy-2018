class Bottles
  def sing
    verses(99,0)
  end

  def verses(start, finish)
    start.downto(finish).map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)
    next_bottle_number = bottle_number.successor
    <<~VERSE
      #{ bottle_number.to_s.capitalize } of beer on the wall, #{ bottle_number } of beer.
      #{ bottle_number.action }, #{ next_bottle_number } of beer on the wall.
      VERSE
  end

  class BottleNumber
    attr_reader :number

    def self.for(number)
      case number
      when 6
        BottleNumberSix.new(number)
      when 0
        BottleNumberZero.new(number)
      when 1
        BottleNumberOne.new(number)
      else
        BottleNumber.new(number)
      end
    end

    def initialize(number)
      @number = number
    end

    def container
      "bottles"
    end

    def pronoun
      "one"
    end

    def quantity
      number.to_s
    end

    def action
      "Take #{ pronoun } down and pass it around"
    end

    def successor
      BottleNumber.for(number - 1)
    end

    def to_s
      "#{quantity} #{container}"
    end

  end

  class BottleNumberZero < BottleNumber
    def quantity
      "no more"
    end

    def action
      "Go to the store and buy some more"
    end

    def successor
      BottleNumber.for(99)
    end
  end

  class BottleNumberOne < BottleNumber
    def container
      "bottle"
    end

    def pronoun
      "it"
    end
  end

  class BottleNumberSix < BottleNumber
    def container
      "six pack"
    end

    def quantity
      "1"
    end
  end
end

