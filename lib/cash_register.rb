class CashRegister
    attr_accessor :total, :discount, :items_arr, :last_trx_price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items_arr = []
        @last_trx_price = 0
    end

    def add_item(title, price, quantity = 1)
        self.last_trx_price = price * quantity
        self.total += last_trx_price

        quantity.times do
            self.items_arr << title
        end


    end

    def apply_discount
        discount_f = self.discount.to_f / 100
        if discount_f == 0
            "There is no discount to apply."
        else
            self.total -= self.total * discount_f
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        self.items_arr
    end

    def void_last_transaction
        self.items_arr.pop
        self.total -= last_trx_price
    end
end