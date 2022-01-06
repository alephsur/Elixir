defmodule LogLevel do

  @logs %{
          0 => [:trace, false],
          1 => [:debug,true],
          2 => [:info, true],
          3 => [:warning, true],
          4 => [:error, true],
          5 => [:fatal, false]
        }

  def to_label(level, legacy?) do
    log = @logs[level]
    cond do
      log == nil -> :unknown
      Enum.at(log, 1) == true -> Enum.at(log, 0)
      Enum.at(log, 1) == legacy? -> Enum.at(log, 0)
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      :error -> :ops
      :fatal -> :ops
      :unknown when legacy? == true -> :dev1
      :unknown when legacy? == false -> :dev2
      _ -> nil
    end
  end
end
