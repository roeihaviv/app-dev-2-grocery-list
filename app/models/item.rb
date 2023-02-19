class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  enum category: {
    fruit: "fruit",
    vegetable: "vegetable",
    dairy: "dairy",
    meat: "meat",
    seafood: "seafood",
    bakery: "bakery",
    household: "household",
    beverages: "beverages",
    alcohol: "alcohol"
  }
  
  enum status: {
    cart: "cart",
    stock: "stock"
  }
end
