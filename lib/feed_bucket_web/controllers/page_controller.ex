defmodule FeedBucketWeb.PageController do
  use FeedBucketWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
