defmodule BeleskeWeb.UserView do
  use BeleskeWeb, :view
  alias Beleske.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
      |> String.split(" ")
      |> Enum.at(0)
  end
end
