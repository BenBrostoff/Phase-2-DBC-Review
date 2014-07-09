require 'active_record'

require 'minitest/autorun'
require 'minitest/spec'

require 'set'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

ActiveRecord::Migration.create_table :players do |t|
  t.string :name

end

ActiveRecord::Migration.create_table :teams do |t|
  t.string :name
  t.belongs_to :captain
  #migrations are normal excepting 16 + 17

end

ActiveRecord::Migration.create_table :team_players do |t|
  t.belongs_to :team
  t.belongs_to :player
  t.belongs_to :morale_guy

end


#
# end migrations
#
#
# the following line executes the migrations, don't delete it
ActiveRecord::Migrator.up "db/migrate"


class Team < ActiveRecord::Base
  has_many :team_players
  has_many :players, through: :team_players, source: :player
  has_many :morale_guys, through: :team_players, source: :morale_guy

  belongs_to :captain, class_name: :Player, foreign_key: :captain_id
  
end

class Player < ActiveRecord::Base
  has_many :team_players
  has_many :teams, through: :team_players, source: :team
  has_many :captaincies, class_name: :Team, foreign_key: :captain_id

end

class TeamPlayer < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  belongs_to :captain, class_name: :Player
  belongs_to :morale_guy, class_name: :Player

end

patriots = Team.create(name: "Patriots")
broncos = Team.create(name: "Broncos")

brady = Player.create(name: "Tom Brady")
manning = Player.create(name: "Peyton Manning")
mankins = Player.create(name: "Logan Mankins")
slater = Player.create(name: "Matthew Slater")
vinateiri = Player.create(name: "Adam Vinateiri")


# patriots.players << brady

# p brady.teams
# p patriots.players

puts "*************************"

# patriots.morale_guys << [mankins, slater]
# patriots.players << vinateiri
brady.captaincies << [patriots, broncos]

p patriots.captain #mankins, slater









