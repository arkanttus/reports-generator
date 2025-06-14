defmodule GenReport.Parser do
  def parse_file(filename) do
    filename
    |> File.stream!()
    |> Stream.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
  end

  defp line_to_int(list) do
    Enum.map(list, fn el ->
      case Integer.parse(el) do
        {num, _} -> num
        _ -> el
      end
    end)
  end
end
