defmodule Ew.Mixfile do
  use Mix.Project

  def project do
    [ app: :ew,
      version: "0.0.1",
      dynamos: [Ew.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/ew/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo, :inets],
      mod: { Ew, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
      { :yahoo_finance,"0.1.0",git: "https://github.com/baldmountain/yahoo_finance"} ]
  end
end
