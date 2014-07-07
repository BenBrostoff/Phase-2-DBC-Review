
class TeamProfile < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
end

class Team < ActiveRecord::Base
  has_many :playerteams #all many to many will have many of join
  has_many :players, through: :playerteams, source: :player
  belongs_to :captain, class_name: "Player", foreign_key: "captain_id" #has one captain
end

class Player < ActiveRecord::Base
  has_many :playerteams #all many to many will have many of join
  has_many :teams, through: :playerteams, source: :team
  has_many :captaincies, class_name: "Team", foreign_key: "captain_id" #let's assume not pro sports
end

# Based on the above and below, you can now call:

# Player.first.captaincies #will return many captaincies (not pro sports)
# Player.first.teams #will return many teams (not pro sports)

# Team.first.captain #will return one captain
# Team.first.players #will return many players

# Lines 10 and 16 are the keys here.
# In 10, you effectively make captain an instance of player via the foreign key captain_id
# In 16, you effectively make captaincies an instancies of teams via the foreign key captain_id


class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string  :name
      t.integer :captain_id #each team has one captain
      # 46 is a key line as it plays two parts

      t.timestamps
    end
  end
end

class CreatePlayerTeams < ActiveRecord::Migration #join
  def change
    create_table :playerteams do |t|
      t.integer :team_id #another means of references / belongs_to
      t.integer :player_id #another means of references / belongs_to

      t.timestamps
    end
  end
end
