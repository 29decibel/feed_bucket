defmodule FeedBucket.FeedsTest do
  use FeedBucket.DataCase

  alias FeedBucket.Feeds

  describe "feed_contents" do
    alias FeedBucket.Feeds.FeedContent

    import FeedBucket.FeedsFixtures

    @invalid_attrs %{
      latest_rss_content: nil,
      subscribers_count: nil,
      summary: nil,
      title: nil,
      url: nil
    }

    test "list_feed_contents/0 returns all feed_contents" do
      feed_content = feed_content_fixture()
      assert Feeds.list_feed_contents() == [feed_content |> FeedBucket.Repo.preload(:feed_items)]
    end

    test "get_feed_content!/1 returns the feed_content with given id" do
      feed_content = feed_content_fixture()
      assert Feeds.get_feed_content!(feed_content.id) == feed_content
    end

    test "create_feed_content/1 with valid data creates a feed_content" do
      valid_attrs = %{
        latest_rss_content: "some latest_rss_content",
        subscribers_count: 42,
        summary: "some summary",
        title: "some title",
        url: "some url"
      }

      assert {:ok, %FeedContent{} = feed_content} = Feeds.create_feed_content(valid_attrs)
      assert feed_content.latest_rss_content == "some latest_rss_content"
      assert feed_content.subscribers_count == 42
      assert feed_content.summary == "some summary"
      assert feed_content.title == "some title"
      assert feed_content.url == "some url"
    end

    test "create_feed_content/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feeds.create_feed_content(@invalid_attrs)
    end

    test "update_feed_content/2 with valid data updates the feed_content" do
      feed_content = feed_content_fixture()

      update_attrs = %{
        latest_rss_content: "some updated latest_rss_content",
        subscribers_count: 43,
        summary: "some updated summary",
        title: "some updated title",
        url: "some updated url"
      }

      assert {:ok, %FeedContent{} = feed_content} =
               Feeds.update_feed_content(feed_content, update_attrs)

      assert feed_content.latest_rss_content == "some updated latest_rss_content"
      assert feed_content.subscribers_count == 43
      assert feed_content.summary == "some updated summary"
      assert feed_content.title == "some updated title"
      assert feed_content.url == "some updated url"
    end

    test "update_feed_content/2 with invalid data returns error changeset" do
      feed_content = feed_content_fixture()
      assert {:error, %Ecto.Changeset{}} = Feeds.update_feed_content(feed_content, @invalid_attrs)
      assert feed_content == Feeds.get_feed_content!(feed_content.id)
    end

    test "delete_feed_content/1 deletes the feed_content" do
      feed_content = feed_content_fixture()
      assert {:ok, %FeedContent{}} = Feeds.delete_feed_content(feed_content)
      assert_raise Ecto.NoResultsError, fn -> Feeds.get_feed_content!(feed_content.id) end
    end

    test "change_feed_content/1 returns a feed_content changeset" do
      feed_content = feed_content_fixture()
      assert %Ecto.Changeset{} = Feeds.change_feed_content(feed_content)
    end
  end

  describe "feed_items" do
    alias FeedBucket.Feeds.FeedItem

    import FeedBucket.FeedsFixtures

    @invalid_attrs %{
      authors: nil,
      html_content: nil,
      published_at: nil,
      summary: nil,
      text_content: nil,
      title: nil,
      content_updated_at: nil,
      url: nil
    }

    test "list_feed_items/0 returns all feed_items" do
      feed_item = feed_item_fixture()
      assert Feeds.list_feed_items() == [feed_item]
    end

    test "get_feed_item!/1 returns the feed_item with given id" do
      feed_item = feed_item_fixture()
      assert Feeds.get_feed_item!(feed_item.id) == feed_item
    end

    test "create_feed_item/1 with valid data creates a feed_item" do
      valid_attrs = %{
        authors: "some authors",
        html_content: "some html_content",
        published_at: ~D[2022-10-02],
        summary: "some summary",
        text_content: "some text_content",
        title: "some title",
        content_updated_at: ~D[2022-10-02],
        url: "some url"
      }

      assert {:ok, %FeedItem{} = feed_item} = Feeds.create_feed_item(valid_attrs)
      assert feed_item.authors == "some authors"
      assert feed_item.html_content == "some html_content"
      assert feed_item.published_at == ~D[2022-10-02]
      assert feed_item.summary == "some summary"
      assert feed_item.text_content == "some text_content"
      assert feed_item.title == "some title"
      assert feed_item.content_updated_at == ~D[2022-10-02]
      assert feed_item.url == "some url"
    end

    test "create_feed_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feeds.create_feed_item(@invalid_attrs)
    end

    test "update_feed_item/2 with valid data updates the feed_item" do
      feed_item = feed_item_fixture()

      update_attrs = %{
        authors: "some updated authors",
        html_content: "some updated html_content",
        published_at: ~D[2022-10-03],
        summary: "some updated summary",
        text_content: "some updated text_content",
        title: "some updated title",
        content_updated_at: ~D[2022-10-03],
        url: "some updated url"
      }

      assert {:ok, %FeedItem{} = feed_item} = Feeds.update_feed_item(feed_item, update_attrs)
      assert feed_item.authors == "some updated authors"
      assert feed_item.html_content == "some updated html_content"
      assert feed_item.published_at == ~D[2022-10-03]
      assert feed_item.summary == "some updated summary"
      assert feed_item.text_content == "some updated text_content"
      assert feed_item.title == "some updated title"
      assert feed_item.content_updated_at == ~D[2022-10-03]
      assert feed_item.url == "some updated url"
    end

    test "update_feed_item/2 with invalid data returns error changeset" do
      feed_item = feed_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Feeds.update_feed_item(feed_item, @invalid_attrs)
      assert feed_item == Feeds.get_feed_item!(feed_item.id)
    end

    test "delete_feed_item/1 deletes the feed_item" do
      feed_item = feed_item_fixture()
      assert {:ok, %FeedItem{}} = Feeds.delete_feed_item(feed_item)
      assert_raise Ecto.NoResultsError, fn -> Feeds.get_feed_item!(feed_item.id) end
    end

    test "change_feed_item/1 returns a feed_item changeset" do
      feed_item = feed_item_fixture()
      assert %Ecto.Changeset{} = Feeds.change_feed_item(feed_item)
    end
  end
end
