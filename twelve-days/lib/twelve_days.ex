defmodule TwelveDays do
  @ordinals %{
    1 => "first",
    2 => "second",
    3 => "third",
    4 => "fourth",
    5 => "fifth",
    6 => "sixth",
    7 => "seventh",
    8 => "eighth",
    9 => "ninth",
    10 => "tenth",
    11 => "eleventh",
    12 => "twelfth"
  }
  @verseList %{
    1 => "a Partridge in a Pear Tree.",
    2 => "two Turtle Doves, and a Partridge in a Pear Tree.",
    3 => "three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    4 => "four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    5 => "five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    6 => "six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    7 => "seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    8 => "eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    9 => "nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    10 => "ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    11 => "eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    12 => "twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
  }



  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    print_sentence(@ordinals[number], @verseList[number])
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    print_range(starting_verse,ending_verse, "")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end

  defp print_sentence(ordinal, verse) do
    "On the #{ordinal} day of Christmas my true love gave to me: #{verse}"
  end

  defp print_range(starting_verse, ending_verse, verses) when starting_verse > ending_verse do
    verses
  end

  defp print_range(starting_verse, ending_verse, verses) when starting_verse == ending_verse do
    verse = print_sentence(@ordinals[starting_verse], @verseList[starting_verse])
    print_range(starting_verse + 1, ending_verse, verses <> verse)
  end

  defp print_range(starting_verse, ending_verse, verses) do
    verse = print_sentence(@ordinals[starting_verse], @verseList[starting_verse])
    print_range(starting_verse + 1, ending_verse, verses <> verse <> "\n")
  end
end
