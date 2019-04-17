defmodule Input do
  def process(input) do
    try do
      move = String.trim(input) |>
      String.to_integer

      {:ok, move}
    rescue
      ArgumentError ->
        {:error, "Input is invalid!"}
    end
  end
end
