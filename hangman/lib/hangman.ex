defmodule Hangman do

  alias Hangman.Game

  def new_game()  do
    Hangman.Server.start_link()
  end

  def make_move(game_pid,guess) do
    GenServer.call(game_pid, {:tally})
  end

  def make_move(game_pid,guess) do
    GenServer.call(game_pid, {:make_move, guess})
  end


end