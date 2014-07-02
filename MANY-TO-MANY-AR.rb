# Migrations

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :p_hash, :salt, :email
      t.timestamps
    end
  end
end


class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
  end
end

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :user
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end

class CreateArticleTags < ActiveRecord::Migration #JOIN TABLE
  def change
    create_table :article_tags do |t|
      t.belongs_to :article
      t.belongs_to :tag
      t.timestamps
    end
  end
end

#Models

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :articles
  before_create :make_salt, :make_salted_hash
end

class Tag < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :presence => true, uniqueness: true

  has_many :article_tags
  has_many :articles, through: :article_tags
  before_destroy :delete_relations
end

class Article < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, :presence => true
  validates :title, :presence => true

  belongs_to :user
  has_many :article_tags
  has_many :tags, through: :article_tags
end

class ArticleTag < ActiveRecord::Base
  # Remember to create a migrations
  belongs_to :article
  belongs_to :tag
end


























