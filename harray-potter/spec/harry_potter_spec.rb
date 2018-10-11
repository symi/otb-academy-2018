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

  it "provides 4 same books for 32 euro" do
    expect( book_store.price([4, 4, 4, 4]) ).to eq ( 32.00 )
  end

  it "provides 4 different books for a 20% discount" do
    expect( book_store.price([1, 2, 3, 4]) ).to eq ( 25.60 )
  end

  it "provides 3 different books at 10% off + 1 at full price" do
    # [1,2,3,3]
    # [1,2,3] + 3 => 21.6 + 8 = 29.6
    # [1,3] + [2,3] => 30.4
    expect( book_store.price([1, 2, 3, 3]) ).to eq( 29.60 )
    expect( book_store.price([1, 2, 2, 3]) ).to eq( 29.60 )
  end

  it "provides 2 sets of 2 books at 5% each pair" do
    # [1,1,2,2]
    # [1,2] + [1,2] => 30.4
    expect( book_store.price([1, 1, 2, 2]) ).to eq( 30.40 )
    expect( book_store.price([1, 2, 2, 1]) ).to eq( 30.40 )
  end

  it "provides 5 same books for 40 euro" do
    expect( book_store.price([1, 1, 1, 1, 1]) ).to eq( 40.00 )
  end

  it "provides 5 different books at 25% discount" do
    expect( book_store.price([7, 4, 9, 1, 2]) ).to eq( 30.00 )
  end

  it "provides 8 books with different 3 x 2 same books + 2 x 1 unique book at 51.20" do
    # [1,1,2,2,3,3,4,5]
    # [1,2,3,4,5] + [1,2,3] => 30 + 21.60 = 51.60
    # [1,2,3,4] + [1,2,3,5] => 25.60 + 25.60 = 51.20

    # [2, 2, 2, 1, 1]

    # [2, 1, 1]
    # []

    expect( book_store.price([1, 1, 2, 2, 3, 3, 4, 5]) ).to eq( 51.20 )
  end
end
