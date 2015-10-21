defmodule CoolApp.Track do
  use CoolApp.Web, :model

  alias CoolApp.AlbumArt
  alias CoolApp.Track
  alias CoolApp.Repo

  schema "tracks" do
    field :sid, :string
    field :title, :string
    field :artist, :string
    field :artist_sid, :string
    field :album, :string
    field :album_sid, :string

    embeds_many :album_art, AlbumArt, on_replace: :delete

    timestamps
  end

  @required_fields ~w(sid title artist artist_sid album album_sid)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def persist_track(track_params, sort_order) do
    album_art_params = transform_json_album_art_params(track_params.album_art)
    
    track_params =
      track_params
      |> Map.delete(:album_art)
      |> Map.put(:sort_order, sort_order)

    try do
      Repo.get_by!(Track, sid: track_params.sid)
      |> Track.changeset(track_params)
      |> Ecto.Changeset.put_change(:album_art, album_art_params)
      |> Repo.update!
    rescue
      Ecto.NoResultsError ->
        Track.changeset(%Track{}, track_params)
        |> Ecto.Changeset.put_change(:album_art, album_art_params)
        |> Repo.insert!
      error ->
        raise error

    end
  end

  defp transform_json_album_art_params(album_art) do
    album_art
    |> Enum.map(fn(art) ->
        %AlbumArt{height: art["height"], width: art["width"], url: art["url"]}
    end)
  end
end
