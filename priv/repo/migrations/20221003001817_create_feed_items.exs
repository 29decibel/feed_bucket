defmodule FeedBucket.Repo.Migrations.CreateFeedItems do
  use Ecto.Migration

  def change do
    create table(:feed_items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :url, :string, null: false
      add :title, :string, null: false
      add :summary, :string
      add :html_content, :string
      add :text_content, :string
      add :authors, :string
      add :published_at, :date, null: false
      add :content_updated_at, :date, null: false
      add :feed_id, references(:feed_contents, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:feed_items, [:feed_id])
  end
end
