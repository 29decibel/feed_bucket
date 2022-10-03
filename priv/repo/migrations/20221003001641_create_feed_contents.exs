defmodule FeedBucket.Repo.Migrations.CreateFeedContents do
  use Ecto.Migration

  def change do
    create table(:feed_contents, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :url, :string, null: false
      add :title, :string, null: false
      add :summary, :string
      add :latest_rss_content, :string
      add :subscribers_count, :integer

      timestamps()
    end
  end
end
