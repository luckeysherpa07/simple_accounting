class Record < ActiveRecord::Base
    validates :date,:title,:amount, presence: true
    def self.amount
        sum(:amount)
    end
    
    def self.balance
        where("amount > ?",0).sum(:amount)
    end
    
    def self.debt
        where("amount < ?",0).sum(:amount)
    end
end
