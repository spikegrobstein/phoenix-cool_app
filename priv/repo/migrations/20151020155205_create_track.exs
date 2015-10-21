defmodule CoolApp.Repo.Migrations.CreateTrack do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :sid, :string
      add :title, :string
      add :artist, :string
      add :artist_sid, :string
      add :album, :string
      add :album_sid, :string

      add :album_art, { :array, :map }, default: []

      timestamps
    end

    create unique_index(:tracks, [:sid])
  end
end
