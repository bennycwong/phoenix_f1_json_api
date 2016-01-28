defmodule PhoenixF1JsonApi.SeasonView do
  use PhoenixF1JsonApi.Web, :view

  def render("index.json", %{seasons: seasons}) do
    %{data: render_many(seasons, PhoenixF1JsonApi.SeasonView, "season.json")}
  end

  def render("show.json", %{season: season}) do
    %{data: render_one(season, PhoenixF1JsonApi.SeasonView, "season.json")}
  end

  def render("season.json", %{season: season}) do
    %{year: season.year,
      url: season.url}
  end
end
