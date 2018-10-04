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

  context "for 10-19" do
    it "returns 'ten' for 10" do
      expect(number_words 10).to eq("ten")
    end

    it "returns 'eleven' for 11" do
      expect(number_words 11).to eq("eleven")
    end

    it "returns strings for numbers 12-19" do
      expect(number_words 12).to eq("twelve")
      expect(number_words 13).to eq("thirteen")
      expect(number_words 14).to eq("fourteen")
      expect(number_words 15).to eq("fifteen")
      expect(number_words 16).to eq("sixteen")
      expect(number_words 17).to eq("seventeen")
      expect(number_words 18).to eq("eighteen")
      expect(number_words 19).to eq("nineteen")
    end
  end

  context "for 20s" do
    it "returns 'twenty' for 20" do
      expect(number_words 20).to eq("twenty")
    end

    it "returns 'twenty one' for 21" do
      expect(number_words 21).to eq("twenty one")
    end

    it "returns 'twenty two' for 22" do
      expect(number_words 22).to eq("twenty two")
    end

    it "returns strings for numbers 23-29" do
      expect(number_words 23).to eq("twenty three")
      expect(number_words 24).to eq("twenty four")
      expect(number_words 25).to eq("twenty five")
      expect(number_words 26).to eq("twenty six")
      expect(number_words 27).to eq("twenty seven")
      expect(number_words 28).to eq("twenty eight")
      expect(number_words 29).to eq("twenty nine")
    end
  end

  context "for 30-99" do
    it "returns 30s" do
      expect(number_words 30).to eq("thirty")
      expect(number_words 33).to eq("thirty three")
    end

    it "returns 40s" do
      expect(number_words 40).to eq("forty")
      expect(number_words 44).to eq("forty four")
    end

    it "returns 50s" do
      expect(number_words 50).to eq("fifty")
      expect(number_words 55).to eq("fifty five")
    end

    it "returns 60s" do
      expect(number_words 60).to eq("sixty")
      expect(number_words 66).to eq("sixty six")
    end

    it "returns 70s" do
      expect(number_words 70).to eq("seventy")
      expect(number_words 77).to eq("seventy seven")
    end

    it "returns 80s" do
      expect(number_words 80).to eq("eighty")
      expect(number_words 88).to eq("eighty eight")
    end

    it "returns 90s" do
      expect(number_words 90).to eq("ninety")
      expect(number_words 99).to eq("ninety nine")
    end
  end

  context "for 100-199" do
    it "returns 'one hundred' for 100" do
      expect(number_words 100).to eq("one hundred")
    end

    it "returns 'one hundred and one' for 101" do
      expect(number_words 101).to eq("one hundred and one")
    end

    it "returns 'one hundred and ten' for 110" do
      expect(number_words 110).to eq("one hundred and ten")
    end

    it "returns 120s" do
      expect(number_words 120).to eq("one hundred and twenty")
      expect(number_words 121).to eq("one hundred and twenty one")
    end

    it "returns for 130-199" do
      expect(number_words 134).to eq("one hundred and thirty four")
      expect(number_words 156).to eq("one hundred and fifty six")
      expect(number_words 198).to eq("one hundred and ninety eight")
    end
  end

  context "for 200-999" do
    it "returns 'two hundred' for 200" do
      expect(number_words 200).to eq("two hundred")
    end

    it "returns for 201-999" do
      expect(number_words 211).to eq("two hundred and eleven")
      expect(number_words 650).to eq("six hundred and fifty")
      expect(number_words 999).to eq("nine hundred and ninety nine")
    end
  end
end
