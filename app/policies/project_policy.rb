class ProjectPolicy < ApplicationPolicy
    attr_reader :user, :project
    def initialize(user,project)
        @user=user
        @project=project   
    end
    def create?
        user.usertype=="manager"
    end
    def update?
        user.usertype=="manager"
    end
    def destroy?
        user.usertype=="manager"
    end
    def update?
        user.usertype=="manager"
    end


end    