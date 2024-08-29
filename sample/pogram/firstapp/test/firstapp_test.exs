defmodule FirstappTest do
  use ExUnit.Case
  doctest Firstapp

  test "greets the world" do
    assert Firstapp.hello() == :world
  end
end
