class Api::DrinksController < ApplicationController
  def detail
    drink = Drink.includes(:category, :container, :ingredients).find_by(id: params[:id])
    return head :not_found unless drink

    render locals: { drink: drink }
  end

  def search
    query = params[:query].presence
    index = params[:index].presence&.to_i || 0
    limit = params[:limit].presence&.to_i || 6

    drinks = Drink.includes(:category)
    drinks = drinks.where('name LIKE ?', "%#{query}%") if query

    total_count = drinks.count

    drinks = drinks.offset(index).limit(limit)

    render locals: { drinks: drinks, total_count: total_count }
  end
end
