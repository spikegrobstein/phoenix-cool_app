defmodule CoolApp.TrackTest do
  use CoolApp.ModelCase

  alias CoolApp.Track

  @valid_attrs %{album: "some content", album_sid: "some content", artist: "some content", artist_sid: "some content", sid: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Track.changeset(%Track{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Track.changeset(%Track{}, @invalid_attrs)
    refute changeset.valid?
  end
end
