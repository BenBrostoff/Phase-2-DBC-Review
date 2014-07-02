class Skill < ActiveRecord::Base
  validates :name, :presence => true
  validates :context, :presence => true

  has_many :users, through: :user_skills, source: :user
  has_many :user_skills
  # Remember to create a migration!
end
