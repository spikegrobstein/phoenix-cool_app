defmodule CoolApp.AlbumArtTest do
  use CoolApp.ModelCase

  alias CoolApp.AlbumArt

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AlbumArt.changeset(%AlbumArt{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AlbumArt.changeset(%AlbumArt{}, @invalid_attrs)
    refute changeset.valid?
  end
end
