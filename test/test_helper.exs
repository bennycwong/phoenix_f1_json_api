ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PhoenixF1JsonApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PhoenixF1JsonApi.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PhoenixF1JsonApi.Repo)

