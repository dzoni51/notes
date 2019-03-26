defmodule Beleske.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :title, :string
      add :note, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:notes, [:user_id])
  end
end
