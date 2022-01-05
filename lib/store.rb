class Store < ActiveRecord::Base
  has_many :employees
  
  validates :annual_revenue, :mens_apparel, :womens_apparel, presence: true
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0, only_integer: true }
 
  validates :apparel

  def apparel
    if womens_apparel == false && mens_apparel == false
      error.add(:mens_apparel, "store can't be empty")
    end
  end

end
