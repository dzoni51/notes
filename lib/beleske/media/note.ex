defmodule Beleske.Media.Note do
  use Ecto.Schema
  import Ecto.Changeset


  schema "notes" do
    field :note, :string
    field :title, :string
    belongs_to :user, Beleske.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:title, :note])
    |> validate_required([:title, :note])
  end
end
