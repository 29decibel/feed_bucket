defmodule FeedBucket.FeedsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FeedBucket.Feeds` context.
  """

  @doc """
  Generate a feed_content.
  """
  def feed_content_fixture(attrs \\ %{}) do
    {:ok, feed_content} =
      attrs
      |> Enum.into(%{
        latest_rss_content: "some latest_rss_content",
        subscribers_count: 42,
        summary: "some summary",
        title: "some title",
        url: "some url"
      })
      |> FeedBucket.Feeds.create_feed_content()

    feed_content
  end

  @doc """
  Generate a feed_item.
  """
  def feed_item_fixture(attrs \\ %{}) do
    {:ok, feed_item} =
      attrs
      |> Enum.into(%{
        authors: "some authors",
        html_content: "some html_content",
        published_at: ~D[2022-10-02],
        summary: "some summary",
        text_content: "some text_content",
        title: "some title",
        content_updated_at: ~D[2022-10-02],
        url: "some url"
      })
      |> FeedBucket.Feeds.create_feed_item()

    feed_item
  end
end
