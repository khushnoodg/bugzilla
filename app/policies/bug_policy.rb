class BugPolicy < ApplicationPolicy
    attr_reader :user, :bug
    def initialize(user,bug)
        @user=user
        @bug=bug   
    end
    def create?
        user.usertype=="qa"
    end
    def destroy?
        user.usertype=="qa"
    end
     def update?
      user.usertype!="manager"
     end
     def hide_tag?
        user.usertype == "qa"
     end
     def status?
        user.usertype == "developer"
     end
   
end