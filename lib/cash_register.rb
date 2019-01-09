
class CashRegister
  attr_accessor :items, :discount, :total, :prev_transaction

  def initialize(discount=0)
    @items = []
    @total = 0
    @discount = discount
  end

  def add_item(title,price,quantity=1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    self.prev_transaction = self.total
  end

  def apply_discount
    if discount != 0
      self.total = total * ((100 - discount).to_f / 100)
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.prev_transaction
  end
end
