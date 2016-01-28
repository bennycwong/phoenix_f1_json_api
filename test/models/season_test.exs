defmodule PhoenixF1JsonApi.SeasonTest do
  use PhoenixF1JsonApi.ModelCase

  alias PhoenixF1JsonApi.Season

  @valid_attrs %{url: "some content", year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Season.changeset(%Season{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Season.changeset(%Season{}, @invalid_attrs)
    refute changeset.valid?
  end
end
