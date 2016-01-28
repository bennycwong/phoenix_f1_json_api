defmodule PhoenixF1JsonApi.SeasonControllerTest do
  use PhoenixF1JsonApi.ConnCase

  alias PhoenixF1JsonApi.Season
  @valid_attrs %{url: "some content", year: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, season_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    season = Repo.insert! %Season{}
    conn = get conn, season_path(conn, :show, season)
    assert json_response(conn, 200)["data"] == %{"id" => season.id,
      "year" => season.year,
      "url" => season.url}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, season_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, season_path(conn, :create), season: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Season, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, season_path(conn, :create), season: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    season = Repo.insert! %Season{}
    conn = put conn, season_path(conn, :update, season), season: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Season, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    season = Repo.insert! %Season{}
    conn = put conn, season_path(conn, :update, season), season: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    season = Repo.insert! %Season{}
    conn = delete conn, season_path(conn, :delete, season)
    assert response(conn, 204)
    refute Repo.get(Season, season.id)
  end
end
