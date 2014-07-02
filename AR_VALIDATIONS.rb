# Below are examples of key active validations

# Email / In General

class Student < ActiveRecord::Base
  has_many :lectures, foreign_key: :student_id
  has_many :teachers, through: :lectures
  validates :age, numericality: {greater_than: 5}
  validates :email, uniqueness: true
  validates :email, format: {with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,}/}
  validates :phone, format: {with: /[-0-9.+_x() ]{10,}/}
end

# Presence of

class Person < ActiveRecord::Base
  has_one :face #generally not necessary
  validates_presence_of :face
end

# Unique

class Person < ActiveRecord::Base
  validates_uniqueness_of :user_name
end

# Examples from Adrian's Project

class User < ActiveRecord::Base
  has_many :bets
  has_many :accepted_bets
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :username, :length => { :minimum => 5, :message => "must be at least 5 characters doge!" }
  validates :entered_password, :length => { :minimum => 6 }
  after_save :get_new_address
end

