defmodule BroadcastWeb.SessionController do
	use BroadcastWeb, :controller

	alias Broadcast.Account
# Attribution to Prof. Tuck's Lecture code on sessions and password

	def login(conn, %{"email" => email}) do 
		user = Account.get_user_by_email(email)

		if user do 
			conn
			|> put_session(:user_id, user.id)
			|> put_flash(:info, "Logged in as #{user.email}")
			|> redirect(to: broadcast_path(conn, :index))
		else
			conn
			|> put_session(:user_id, nil)
			|> put_flash(:error, "No such user")
			|> redirect(to: broadcast_path(conn, :index))
		end
	end 

	def logout(conn, _args) do 
		conn 
		|> put_session(:user_id, nil)
		|> put_flash(:info, "Thank you for using Manager App. You've logged out!")
		|> redirect(to: broadcast_path(conn, :index))
	end
end