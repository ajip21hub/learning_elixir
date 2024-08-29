defmodule UrlFetcher do
  # Fungsi fetch_url/1
  def fetch_url(url) do
    start_time = :os.system_time(:millisecond)
    :timer.sleep(1000)
    end_time = :os.system_time(:millisecond)
    IO.puts("Fetched #{url} in #{end_time - start_time} milliseconds")
    {:ok, url}
  end
end
