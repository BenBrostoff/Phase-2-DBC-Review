class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,}/}
  validates :password, presence: true

  has_many :skills, through: :user_skills, source: :skill
  has_many :user_skills
  # Remember to create a migration!
end
