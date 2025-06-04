defmodule GenReport do
  import GenReport.Parser

  def build(filename) do
    filename
    |> parse_file()
    |> Enum.each(&IO.inspect(&1))
  end

  %{
    name: %{
      total: 0,
      months: %{
        janeiro: 0
      },
      years: %{
        "2017": 0
      }
    }
  }

  # Iterar a matriz
  # Pra cada linha... Pegar os dados da linha
  # Criar matriz com o modelo acima
  # Incrementar cada valor

  defp sum_values(list) do
    Enum.reduce(list, %{}, fn [name, hours, day, month, year], acc ->
      person_info = Map.get(acc, name, %{})
      total = Map.get(person_info, :total, 0)
      months = Map.get(person_info, :months, %{})
      years = Map.get(person_info, :years, %{})

      person_info = Map.put(person_info, total, hours + total)
    end)
  end
end
