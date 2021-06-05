class ShoppingCartItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    user ? true : false
  end
  def create_one_item?
    user ? true : false
  end
  def update?
    user ? true : false
  end
end
