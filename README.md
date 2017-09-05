# Vivid.PNG

Vivid.PNG adds PNG generating support to [Vivid](https://hex.pm/packages/vivid),
a 2D rendering library implemented 100% in Elixir with no dependencies.

## Installation

[Available in Hex](https://hex.pm/packages/vivid_png), the package can be installed
by adding `vivid_png` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:vivid_png, "~> 0.1.0"}]
end
```

## License

Source code is licensed under the terms of the MIT license, the text of which
is included in the `LICENSE` file in this distribution.

## Documentation

Documentations can be found at [https://hexdocs.pm/vivid_png](https://hexdocs.pm/vivid_png).

## Status

```elixir
use Vivid
alias Vivid.PNG

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
|> PNG.to_png("example.png")
```

![example.png](https://raw.githubusercontent.com/jamesotron/vivid_png.ex/master/priv/example.png)

