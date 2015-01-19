class Gasoline < ActiveRecord::Base
  has_many :tanks

  def amount 
    total = 0
    tanks.each do |tank|
      total += tank.filled
    end
    total
  end

  def self.options_for_select
    self.all.map do |gas|
      [ gas.name, gas.id ]
    end
  end
end
