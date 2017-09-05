defmodule Vivid.PNGTest do
  use ExUnit.Case
  doctest Vivid.PNG
  use Vivid
  alias Vivid.PNG

  test "it generates a PNG file" do
    output = "#{System.tmp_dir()}/example.png"
    frame  = Frame.init(300,200)
    text   = Font.line("seems to work")
             |> Transform.fill(frame)
             |> Transform.center(frame)
             |> Transform.apply
    circle = Circle.init(Point.init(100, 100), 50)
    box    = Box.init(Point.init(250,150), Point.init(275, 175))

    frame
    |> Frame.push(text,   RGBA.black)
    |> Frame.push(circle, RGBA.init(1,0,0,0.5))
    |> Frame.push(box,    RGBA.init(0,0,1, 0.75))
    |> PNG.to_png(output)

    generated = File.read(output)
    canonical = File.read("#{:code.priv_dir(:vivid_png)}/example.png")
    assert generated == canonical
  end
end
