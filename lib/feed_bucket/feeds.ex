defmodule FeedBucket.Feeds do
  @moduledoc """
  The Feeds context.
  """

  import Ecto.Query, warn: false
  alias FeedBucket.Repo

  alias FeedBucket.Feeds.FeedContent

  @doc """
  Returns the list of feed_contents.

  ## Examples

      iex> list_feed_contents()
      [%FeedContent{}, ...]

  """
  def list_feed_contents do
    Repo.all(FeedContent) |> Repo.preload(:feed_items)
  end

  @doc """
  Gets a single feed_content.

  Raises `Ecto.NoResultsError` if the Feed content does not exist.

  ## Examples

      iex> get_feed_content!(123)
      %FeedContent{}

      iex> get_feed_content!(456)
      ** (Ecto.NoResultsError)

  """
  def get_feed_content!(id), do: Repo.get!(FeedContent, id)

  @doc """
  Creates a feed_content.

  ## Examples

      iex> create_feed_content(%{field: value})
      {:ok, %FeedContent{}}

      iex> create_feed_content(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_feed_content(attrs \\ %{}) do
    %FeedContent{}
    |> FeedContent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a feed_content.

  ## Examples

      iex> update_feed_content(feed_content, %{field: new_value})
      {:ok, %FeedContent{}}

      iex> update_feed_content(feed_content, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_feed_content(%FeedContent{} = feed_content, attrs) do
    feed_content
    |> FeedContent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a feed_content.

  ## Examples

      iex> delete_feed_content(feed_content)
      {:ok, %FeedContent{}}

      iex> delete_feed_content(feed_content)
      {:error, %Ecto.Changeset{}}

  """
  def delete_feed_content(%FeedContent{} = feed_content) do
    Repo.delete(feed_content)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking feed_content changes.

  ## Examples

      iex> change_feed_content(feed_content)
      %Ecto.Changeset{data: %FeedContent{}}

  """
  def change_feed_content(%FeedContent{} = feed_content, attrs \\ %{}) do
    FeedContent.changeset(feed_content, attrs)
  end

  alias FeedBucket.Feeds.FeedItem

  @doc """
  Returns the list of feed_items.

  ## Examples

      iex> list_feed_items()
      [%FeedItem{}, ...]

  """
  def list_feed_items do
    Repo.all(FeedItem)
  end

  @doc """
  Gets a single feed_item.

  Raises `Ecto.NoResultsError` if the Feed item does not exist.

  ## Examples

      iex> get_feed_item!(123)
      %FeedItem{}

      iex> get_feed_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_feed_item!(id), do: Repo.get!(FeedItem, id)

  @doc """
  Creates a feed_item.

  ## Examples

      iex> create_feed_item(%{field: value})
      {:ok, %FeedItem{}}

      iex> create_feed_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_feed_item(attrs \\ %{}) do
    %FeedItem{}
    |> FeedItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a feed_item.

  ## Examples

      iex> update_feed_item(feed_item, %{field: new_value})
      {:ok, %FeedItem{}}

      iex> update_feed_item(feed_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_feed_item(%FeedItem{} = feed_item, attrs) do
    feed_item
    |> FeedItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a feed_item.

  ## Examples

      iex> delete_feed_item(feed_item)
      {:ok, %FeedItem{}}

      iex> delete_feed_item(feed_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_feed_item(%FeedItem{} = feed_item) do
    Repo.delete(feed_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking feed_item changes.

  ## Examples

      iex> change_feed_item(feed_item)
      %Ecto.Changeset{data: %FeedItem{}}

  """
  def change_feed_item(%FeedItem{} = feed_item, attrs \\ %{}) do
    FeedItem.changeset(feed_item, attrs)
  end
end
