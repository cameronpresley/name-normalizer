defmodule NameNameNormalizerTest do
  use ExUnit.Case

  test "returns empty string when empty" do
    assert NameNormalizer.normalize("") == {:ok, ""}
  end

  @tag :pending
  test "returns single word name" do
    assert NameNormalizer.normalize("Plato") == {:ok, "Plato"}
  end

  @tag :pending
  test "swaps first and last names" do
    assert NameNormalizer.normalize("Haruki Murakami") == {:ok, "Murakami, Haruki"}
  end

  @tag :pending
  test "trims leading and trailing whitespace" do
    assert NameNormalizer.normalize("  Big Boi   ") == {:ok, "Boi, Big"}
  end

  @tag :pending
  test "initializes middle name" do
    assert NameNormalizer.normalize("Henry David Thoreau") == {:ok, "Thoreau, Henry D."}
  end

  @tag :pending
  test "does not initialize one letter middle name" do
    assert NameNormalizer.normalize("Harry S Truman") == {:ok, "Truman, Harry S"}
  end

  @tag :pending
  test "initializes each of multiple middle names" do
    assert NameNormalizer.normalize("Julia Scarlett Elizabeth Louis-Dreyfus") ==
             {:ok, "Louis-Dreyfus, Julia S. E."}
  end

  @tag :pending
  test "appends suffixes to end" do
    assert NameNormalizer.normalize("Martin Luther King, Jr.") == {:ok, "King, Martin L., Jr."}
  end

  @tag :pending
  test "returns an error when name contains two commas" do
    assert NameNormalizer.normalize("Thurston, Howell, III") == {:error, "Too many commas"}
  end
end
