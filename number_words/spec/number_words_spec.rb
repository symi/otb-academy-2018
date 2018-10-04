require 'number_words'

# Spell out a number. For example

#       99 --> ninety nine
#      300 --> three hundred
#      310 --> three hundred and ten
#     1501 --> one thousand, five hundred and one
#    12609 --> twelve thousand, six hundred and nine
#   512607 --> five hundred and twelve thousand,
#              six hundred and seven
# 43112603 --> forty three million, one hundred and
#              twelve thousand,
#              six hundred and three

RSpec.describe "number_words" do
  context "for single units" do
    it "returns 'one' for 1" do
      expect(number_words 1).to eq("one")
    end

    it "returns 'two' for 2" do
      expect(number_words 2).to eq("two")
    end

    it "returns strings for numbers 3-9" do
      expect(number_words 3).to eq("three")
      expect(number_words 4).to eq("four")
      expect(number_words 5).to eq("five")
      expect(number_words 6).to eq("six")
      expect(number_words 7).to eq("seven")
      expect(number_words 8).to eq("eight")
      expect(number_words 9).to eq("nine")
    end
  end
end
