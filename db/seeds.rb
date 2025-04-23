# Create admin user
User.create(email: 'admin@loltournament.com', password: 'password', password_confirmation: 'password', is_admin: true)

# Create teams
team1 = Team.create(name: 'Cloud9')
team2 = Team.create(name: 'Team Liquid')
team3 = Team.create(name: 'TSM')
team4 = Team.create(name: 'Fnatic')

# Create players for team1
Player.create(first_name: 'John', last_name: 'Doe', role: 'Top laner', team: team1)
Player.create(first_name: 'Jane', last_name: 'Smith', role: 'Jungler', team: team1)
Player.create(first_name: 'Alice', last_name: 'Johnson', role: 'Mid laner', team: team1)
Player.create(first_name: 'Bob', last_name: 'Williams', role: 'ADC', team: team1)
Player.create(first_name: 'Charlie', last_name: 'Brown', role: 'Support', team: team1)

# Create players for team2
Player.create(first_name: 'David', last_name: 'Miller', role: 'Top laner', team: team2)
Player.create(first_name: 'Emma', last_name: 'Davis', role: 'Jungler', team: team2)
Player.create(first_name: 'Frank', last_name: 'Wilson', role: 'Mid laner', team: team2)
Player.create(first_name: 'Grace', last_name: 'Moore', role: 'ADC', team: team2)
Player.create(first_name: 'Henry', last_name: 'Taylor', role: 'Support', team: team2)

# Create players for team3
Player.create(first_name: 'Isaac', last_name: 'Anderson', role: 'Top laner', team: team3)
Player.create(first_name: 'Julia', last_name: 'Thomas', role: 'Jungler', team: team3)
Player.create(first_name: 'Kevin', last_name: 'Jackson', role: 'Mid laner', team: team3)
Player.create(first_name: 'Laura', last_name: 'White', role: 'ADC', team: team3)
Player.create(first_name: 'Michael', last_name: 'Harris', role: 'Support', team: team3)

# Create players for team4
Player.create(first_name: 'Nina', last_name: 'Martin', role: 'Top laner', team: team4)
Player.create(first_name: 'Oscar', last_name: 'Thompson', role: 'Jungler', team: team4)
Player.create(first_name: 'Penny', last_name: 'Garcia', role: 'Mid laner', team: team4)
Player.create(first_name: 'Quinn', last_name: 'Martinez', role: 'ADC', team: team4)
Player.create(first_name: 'Robert', last_name: 'Robinson', role: 'Support', team: team4)

# Create matches
match1 = Match.create(
  team1: team1,
  team2: team2,
  match_date: 1.day.ago,
  score_team1: 3,
  score_team2: 1
)

match2 = Match.create(
  team1: team3,
  team2: team4,
  match_date: 2.days.ago,
  score_team1: 2,
  score_team2: 2
)

match3 = Match.create(
  team1: team1,
  team2: team3,
  match_date: 3.days.ago,
  score_team1: 0,
  score_team2: 2
)

match4 = Match.create(
  team1: team2,
  team2: team4,
  match_date: 4.days.ago,
  score_team1: 1,
  score_team2: 3
)

# Create a future match
Match.create(
  team1: team1,
  team2: team4,
  match_date: 1.day.from_now
)

puts "Seed data created successfully!"