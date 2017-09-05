defmodule Vivid.PNG.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :vivid_png,
     version: @version,
     description: description(),
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     deps: deps(),
     docs: [source_ref: "v{#{@version}",
            canonical: "http://hexdocs.pm/vivid",
            source_url: "https://github.com/jamesotron/vivid_ong.ex"]]
  end

  def application do
    [applications: [:logger, :png]]
  end

  def description do
    """
    Generate PNG files with Vivid.
    """
  end

  def package do
    [
      maintainers: [ "James Harton <james@automat.nz>" ],
      licenses: [ "MIT" ],
      links: %{
        "Source" => "https://github.com/jamesotron/vivid_png.ex"
      }
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:png,    "~> 0.1.1"},
      {:vivid,  ">= 0.3.0"},
      {:credo,  "~> 0.6", only: ~w(dev test)a},
      {:inch_ex, "~> 0.5", only: :docs}
    ]
  end
end
