defprotocol Vivid.PNG do
  use Vivid

  @moduledoc ~S"""
  Turn a Vivid frame or shape into a PNG

  ## Examples

    Generating a PNG file from a frame containing shapes:


      iex> use Vivid
      ...> frame    = Frame.init(400, 200, RGBA.white)
      ...> box      = Box.init(Point.init(20,20), Point.init(120,120))
      ...> circle   = Circle.init(Point.init(200, 100), 50)
      ...> triangle = Circle.init(Point.init(300, 70), 5)
      ...>   |> Circle.to_polygon(3)
      ...> frame
      ...>   |> Frame.push(box, RGBA.init(1, 0, 0))
      ...>   |> Frame.push(circle, RGBA.init(0, 1, 0))
      ...>   |> Frame.push(triangle, RGBA.init(0, 0, 1))
      ...>   |> Vivid.PNG.to_png("priv/shapes.png")
      :ok

    ![shapes.png](https://raw.githubusercontent.com/jamesotron/vivid_png.ex/master/priv/shapes.png)
  """

  @doc """
  Turn a frame or shape into a PNG file.
  """
  @spec to_png(Shape.t | Frame.t | Buffer.t, Path.t) :: :ok | {:error, any}
  def to_png(shape, file)
end
