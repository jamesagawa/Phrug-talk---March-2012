require "minitest_helper"

describe Product do

  it 'can add inventory' do
    # skip
    p = Product.new(stock: 10, delivery: 0,sold: 3)

    p.add_stock
    p.stock.must_equal 11

    p.add_delivery
    p.delivery.must_equal 1

    p.add_sold
    p.sold.must_equal 4
  end

  it 'can reduce inventory' do
    p = Product.new(stock: 10, delivery: 0,sold: 3)

    p.reduce_stock
    p.stock.must_equal 9

    p.reduce_delivery
    p.delivery.must_equal 0

    p.reduce_sold
    p.sold.must_equal 2
  end

  it 'can add multiple inventory values' do
    p = Product.new(stock: 10, delivery: 0,sold: 3)

    p.add_stock_by 10
    p.stock.must_equal 20

    p.add_stock_by 10, 20
    p.stock.must_equal 50
  end

  it 'can move inventory from one column to another' do
    p = Product.new(stock: 10, delivery: 0,sold: 3)

    p.move_stock_to_sold
    p.stock.must_equal 9
    p.sold.must_equal  4
  end


end
