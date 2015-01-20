class Gasoline < ActiveRecord::Base
  has_many :tanks
  validates_uniqueness_of :name
  validates :name, :grade, :price, presence: true

  def amount 
    total = 0
    tanks.each do |tank|
      total += tank.filled
    end
    total
  end

  def available?(amount)
    available = false
    tanks.each do |tank|
      if tank.filled > amount
        available = true 
        break
      end
    end
    available
  end

  def biggest_tank
    tanks.all.order(filled: :desc).first
  end

  def outpour(amount) 
    tank = biggest_tank
    tank.update({filled: tank.filled - amount})
    tank.save
  end 

  def self.options_for_select
    self.all.map do |gas|
      [ gas.name, gas.id ]
    end
  end
end
