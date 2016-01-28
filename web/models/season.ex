defmodule PhoenixF1JsonApi.Season do
  use PhoenixF1JsonApi.Web, :model

  @primary_key {:year, :integer, []}
  schema "seasons" do
    field :url, :string
  end

  @required_fields ~w(url)
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
end
