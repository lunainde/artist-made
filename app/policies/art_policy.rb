class ArtPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def favor?
    true
  end
  def show?
    true
  end
end
