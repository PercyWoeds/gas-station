class Tank < ActiveRecord::Base
  belongs_to :gasoline
  

  def max_liters
    volume * 1000
  end

  def empty?
    filled == 0
  end

  def empty_space
    max_liters - filled
  end
end
