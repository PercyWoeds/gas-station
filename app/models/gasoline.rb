class Gasoline < ActiveRecord::Base
  has_many :tanks
  accepts_nested_attributes_for :tanks

  def amount 
    total = 0
    tanks.each do |tank|
      total += tank.filled
    end
    total
  end
end
