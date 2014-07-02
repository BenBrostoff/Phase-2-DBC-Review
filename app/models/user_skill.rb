class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  # Remember to create a migration!
end
