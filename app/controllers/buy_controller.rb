class BuyController < ApplicationController
  def index
    @buy_shipping = BuyShipping.new
  end

  def create
    binding.pry
  en
end
