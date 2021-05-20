class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    record.shopping_cart.user == user && record.shopping_cart.paid == false
    # true
  end
  def show?
    record.user == user
  end
end
