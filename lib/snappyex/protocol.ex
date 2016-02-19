defmodule Snappyex.Protocol do
  @moduledoc false
  def connect(opts) do
    {:ok, host} = Keyword.fetch(opts, :hostname)
    {:ok, port} = Keyword.fetch(opts, :port)
    {:ok, client} = :thrift_client_util.new(host, port, :g_f_x_d_service_thrift, [])
    Snappyex.Client.start_link(client)
  end
end
