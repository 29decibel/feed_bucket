defmodule FeedBucket.Feeds.FeedItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "feed_items" do
    field :authors, :string
    field :html_content, :string
    field :published_at, :date
    field :summary, :string
    field :text_content, :string
    field :title, :string
    field :content_updated_at, :date
    field :url, :string

    belongs_to :feed_content, FeedBucket.Feeds.FeedContent, foreign_key: :feed_id

    timestamps()
  end

  @doc false
  def changeset(feed_item, attrs) do
    feed_item
    |> cast(attrs, [
      :url,
      :title,
      :summary,
      :html_content,
      :text_content,
      :authors,
      :published_at,
      :content_updated_at,
      :feed_id
    ])
    |> validate_required([
      :url,
      :title,
      :published_at,
      :content_updated_at
    ])
  end
end
