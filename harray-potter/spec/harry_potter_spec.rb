require 'harry_potter'

describe "the book store" do

  let(:book_store) { BookStore.new }

  it "provides 1 book for 8 euro" do
    expect( book_store.price([1]) ).to eq( 8.00 )
  end

  it "provides 2 same books for 16 euro" do
    expect( book_store.price([1, 1]) ).to eq( 16.00 )
  end

  it "provides 2 different books for a 5% discount" do
    expect( book_store.price([1, 2]) ).to eq( 15.20 )
  end
end
