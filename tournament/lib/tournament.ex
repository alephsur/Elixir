defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    process_input(input, [])
    |> Enum.group_by(&(&1.team))
    |> Map.to_list()
    |> process_map_team([])
    |> Enum.sort_by(&(&1.points), :desc)
    |> array_maps_tournament_to_string(initial_text())
  end

  def process_input([], result) do
    result
  end

  def process_input([head|tail], result) do
    line_splitted = String.split(head, ";")

    cond do
      length(line_splitted) == 3 && valid_result(line_splitted) == true -> process_input(tail, result ++ process_line(line_splitted))
      true -> process_input(tail, result)
    end
  end

  def valid_result(line_splitted) do
    cond do
      Enum.at(line_splitted,2) == "win" -> true
      Enum.at(line_splitted,2) == "loss" -> true
      Enum.at(line_splitted,2) == "draw" -> true
      true -> false
    end
  end

  def process_line(line_splitted) do
    cond do
      Enum.at(line_splitted,2) == "win" -> add_victory(line_splitted)
      Enum.at(line_splitted,2) == "loss" -> add_loss(line_splitted)
      Enum.at(line_splitted,2) == "draw" -> add_draw(line_splitted)
    end
  end

  def add_victory(line) do
    [
      %{team: Enum.at(line,0), matches: 1, wins: 1 ,draws: 0, losses: 0 ,points: 3},
      %{team: Enum.at(line,1), matches: 1, wins: 0, draws: 0, losses: 1 ,points: 0}
    ]
  end

  def add_loss(line) do
    [
      %{team: Enum.at(line,0), matches: 1, wins: 0, draws: 0, losses: 1 ,points: 0},
      %{team: Enum.at(line,1), matches: 1, wins: 1, draws: 0, losses: 0, points: 3}
    ]
  end

  def add_draw(line) do
    [
      %{team: Enum.at(line,0), matches: 1, wins: 0, draws: 1, losses: 0 ,points: 1},
      %{team: Enum.at(line,1), matches: 1, wins: 0, draws: 1, losses: 0 ,points: 1}
    ]
  end

  def process_map_team([], result) do
    result
  end

  def process_map_team([head|tail], result) do
    process_map_team(tail, result ++ [get_grouped_properties(elem(head,1))])
  end

  def get_grouped_properties(mapped_values) do
    Enum.reduce(mapped_values, fn item, acc ->
        %{
          team: item.team,
          draws: item.draws + acc.draws,
          matches: item.matches + acc.matches,
          wins: item.wins + acc.wins,
          points: item.points + acc.points,
          losses: item.losses + acc.losses
        } end
      )
  end

  def initial_text() do
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def array_maps_tournament_to_string([], text) do
    text |> String.slice(0..-2)

  end

  def array_maps_tournament_to_string([head|tail], text) do
    array_maps_tournament_to_string(tail, text <> get_line_from_map(head))
  end

  def get_line_from_map(team_result) do
    String.pad_trailing(team_result.team, 30) <> " | " <>
    String.pad_leading(Integer.to_string(team_result.matches), 2) <> " | " <>
    String.pad_leading(Integer.to_string(team_result.wins), 2) <> " | " <>
    String.pad_leading(Integer.to_string(team_result.draws), 2) <> " | " <>
    String.pad_leading(Integer.to_string(team_result.losses), 2) <> " | " <>
    String.pad_leading(Integer.to_string(team_result.points), 2) <> "\n"
  end

end
