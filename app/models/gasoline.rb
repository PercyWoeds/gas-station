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

  def self.options_for_select
    self.all.map do |gas|
      [ gas.name, gas.id ]
    end
  end
end
