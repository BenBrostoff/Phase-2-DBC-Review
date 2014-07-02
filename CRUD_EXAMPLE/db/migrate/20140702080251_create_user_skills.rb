class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.belongs_to :user
      t.belongs_to :skill
      t.integer :years
      t.boolean :formal
      t.timestamps
    end
  end
end
