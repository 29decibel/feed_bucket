defmodule FeedBucket.Repo do
  use Ecto.Repo,
    otp_app: :feed_bucket,
    adapter: Ecto.Adapters.Postgres
end
