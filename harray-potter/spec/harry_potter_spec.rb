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

  it "provides 3 same books for 24 euro" do
    expect( book_store.price([2, 2, 2]) ).to eq( 24.00 )
  end

  it "provides 3 different books for a 10% discount" do
    expect( book_store.price([1, 2, 3]) ).to eq( 21.60 )
  end

  it "provides 2 different books at 5% off + 1 at full price" do
    expect( book_store.price([1, 2, 1]) ).to eq( 23.20 )
    expect( book_store.price([1, 1, 2]) ).to eq( 23.20 )
    expect( book_store.price([1, 2, 2]) ).to eq( 23.20 )
  end
end
