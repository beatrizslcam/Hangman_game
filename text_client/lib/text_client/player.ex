defmodule TextClient.Player do

  alias TextClient.{Mover,Prompter,State,Summary}


#If you won or lost  the game, the play function will show a message and it will end the game;
  def play( %State{tally: %{game_state: :won}}) do
    exit_with_message("You WON!!")
  end

  def play(%State{ tally: %{game_state: :lost}}) do
    exit_with_message("Sorry, you lost!")
  end

#But if you just make a good or a bad guess the game keeps on;

  def play(game = %State{ tally: %{game_state: :good_guess}}) do
    continue_with_message(game,"Good guess!")

  end

  def play(game = %State{ tally: %{game_state: :bad_guess}}) do
    continue_with_message(game,"Sorry, that isn't in the word!")
  end


  def play(game = %State{ tally: %{game_state: :already_used}}) do
    continue_with_message(game,"You've already use that letter!")
  end

#This function bellow keeps the recursivity, it keeps calling the game to continue.
  def play(game) do
    continue(game)

  end

  def display (game) do
    game
  end


  def continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end

#This function continue the game and receive the actual state of the game.

  def continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |> play()
  end


#essa função finaliza o jogo.

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end
end
