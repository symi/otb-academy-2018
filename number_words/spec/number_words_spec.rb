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
  it "returns 'one' for 1" do
    expect(number_words 1).to eq("one")
  end
end
