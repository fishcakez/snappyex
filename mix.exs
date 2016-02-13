defmodule TcpConnection.Mixfile do
  use Mix.Project

  def project do
    [app: :tcp_connection,
     version: "0.0.1",
     elixir: "~> 1.2.2",
     compilers: [:thrift | Mix.compilers],
     thrift_files: Mix.Utils.extract_files(["thrift"], [:thrift]),
     thrift_version: ">= 0.9.3",
     thrift_options: ~w[--gen erl:maps],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :db_connection]]
  end

  defp deps do
    [{:db_connection, ">= 0.0.0"},
     {:riffed, github: "pinterest/riffed", tag: "1.0.0", submodules: true}
    ]
  end
end
