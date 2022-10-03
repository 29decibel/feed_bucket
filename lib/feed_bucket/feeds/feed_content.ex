defmodule FeedBucket.Feeds.FeedContent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "feed_contents" do
    field :latest_rss_content, :string
    field :subscribers_count, :integer
    field :summary, :string
    field :title, :string
    field :url, :string

    has_many :feed_items, FeedBucket.Feeds.FeedItem, foreign_key: :feed_id

    timestamps()
  end

  @doc false
  def changeset(feed_content, attrs) do
    feed_content
    |> cast(attrs, [:url, :title, :summary, :latest_rss_content, :subscribers_count])
    |> validate_required([:url, :title])
  end
end
