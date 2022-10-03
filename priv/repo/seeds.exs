# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FeedBucket.Repo.insert!(%FeedBucket.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FeedBucket.Feeds

# create a feed
{:ok, feed} =
  Feeds.create_feed_content(%{
    url: "https://austinkleon.com/feed/",
    title: "Austin Kleon"
  })

# this is happening during the parsing
# create multiple items
{:ok, feed_item} =
  Feeds.create_feed_item(%{
    feed_id: feed.id,
    title: "The past few weeks",
    url: "https://austinkleon.com/2022/09/29/the-past-few-weeks/",
    published_at: DateTime.now!("Etc/UTC"),
    content_updated_at: DateTime.now!("Etc/UTC")
  })
