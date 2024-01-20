class Project < ApplicationRecord
    has_many :project_users, dependent: :destroy, inverse_of: :project
    has_many :users, through: :project_users
    accepts_nested_attributes_for :project_users,allow_destroy: true,reject_if: :all_blank
    has_many :bugs, dependent: :destroy
end 
