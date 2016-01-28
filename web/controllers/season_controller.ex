require IEx

defmodule PhoenixF1JsonApi.SeasonController do
  use PhoenixF1JsonApi.Web, :controller

  alias PhoenixF1JsonApi.Season

  plug :scrub_params, "season" when action in [:create, :update]

  def index(conn, _params) do
    seasons = Repo.all(Season)
    render(conn, "index.json", seasons: seasons)
  end

  def create(conn, %{"season" => season_params}) do
    changeset = Season.changeset(%Season{}, season_params)

    case Repo.insert(changeset) do
      {:ok, season} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", season_path(conn, :show, season))
        |> render("show.json", season: season)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixF1JsonApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    season = Repo.get!(Season, id)
    render(conn, "show.json", season: season)
  end

  def update(conn, %{"id" => id, "season" => season_params}) do
    season = Repo.get!(Season, id)
    changeset = Season.changeset(season, season_params)

    case Repo.update(changeset) do
      {:ok, season} ->
        render(conn, "show.json", season: season)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixF1JsonApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    season = Repo.get!(Season, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(season)

    send_resp(conn, :no_content, "")
  end
end
