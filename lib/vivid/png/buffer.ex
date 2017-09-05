defimpl Vivid.PNG, for: Vivid.Buffer do
  alias Vivid.{Buffer, RGBA}

  @moduledoc false

  @doc false
  @spec to_png(Buffer.t, Path.t) :: :ok | {:error, any}
  def to_png(buffer, path) do
    with {:ok, file} <- File.open(path, [:write]),
         png         <- create_png(buffer, file),
         :ok         <- :png.close(png),
         :ok         <- File.close(file),
         do: :ok
  end

  defp config(%Buffer{rows: height, columns: width}, file) do
    %{
      size:    {width, height},
      mode:    {:rgba, 8},
      file:    file,
    }
  end

  defp create_png(%Buffer{columns: width} = buffer, file) do
    png = buffer
      |> config(file)
      |> :png.create

    buffer
      |> Stream.map(&colour_to_binary(&1))
      |> Stream.chunk(width)
      |> Stream.map(&Enum.join(&1))
      |> Enum.reverse
      |> Enum.reduce(png, &(:png.append(&2, {:row, &1})))
  end

  defp colour_to_binary(%RGBA{red: r, green: g, blue: b, alpha: a}) do
    r = round(r * 255)
    g = round(g * 255)
    b = round(b * 255)
    a = round(a * 255)
    <<r::integer-size(8),
      g::integer-size(8),
      b::integer-size(8),
      a::integer-size(8)>>
  end
end
