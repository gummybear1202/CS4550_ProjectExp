# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Broadcast.Repo.insert!(%Broadcast.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Broadcast.Repo
alias Broadcast.Account.User
alias Broadcast.Account.Team
alias Broadcast.Alert.Broadcast

Repo.delete_all(Team)
Repo.delete_all(Broadcast)
Repo.delete_all(User)

cc = Repo.insert!(%User{first_name: "Christine", last_name: "Chen", email: "chen.chr@husky.neu.edu", isManager?: true, isAdmin?: false})
tg = Repo.insert!(%User{first_name: "Taliah", last_name: "Green", email: "green.ta@husky.neu.edu", isManager?: false, isAdmin?: false})
cw = Repo.insert!(%User{first_name: "Cindy", last_name: "Wu", email: "cinderswu@gmail.com", isManager?: false, isAdmin?: false})
rh = Repo.insert!(%User{first_name: "Ray", last_name: "You", email: "rayray@gmail.com", isManager?: false, isAdmin?: false})


Repo.insert!(%Team{team_name: "Team 42", manager_id: cc.id, employee_id: tg.id})
Repo.insert!(%Team{team_name: "Team 42", manager_id: cc.id, employee_id: cw.id})
Repo.insert!(%Team{team_name: "Team 42", manager_id: cc.id, employee_id: rh.id})

Repo.insert!(%Broadcast{desc: "Welcome to the team!", user_id: cc.id})

