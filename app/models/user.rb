class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :username, presence: true
         validates :usertype, presence: true
  has_many :project_users
  has_many :projects, through: :project_users    
  def full_name
    "#{username} -- #{usertype}"
  end
end
