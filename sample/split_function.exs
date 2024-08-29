Code.require_file(fect)

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


defmodule ParallelFetcher do
  # Fungsi fetch_all_urls/1
  def fetch_all_urls(urls) do
    tasks = for url <- urls do
      Task.async(fn -> UrlFetcher.fetch_url(url) end)
    end

    results = for task <- tasks do
      Task.await(task)
    end

    IO.puts("All URLs fetched")
    results
  end
end


# Mendefinisikan daftar URL yang akan diambil
urls = [
  "http://example.com/1",
  "http://example.com/2",
  "http://example.com/3",
  "http://example.com/4",
  "http://example.com/5",
  "http://example.com/6",
  "http://example.com/7",
  "http://example.com/8",
  "http://example.com/9",
  "http://example.com/10",
  "http://example.com/11",
  "http://example.com/12",
  "http://example.com/13",
  "http://example.com/14",
  "http://example.com/15"
]

# Mendapatkan waktu sistem saat ini dalam milidetik sebelum memulai pengambilan URL
start_time = :os.system_time(:millisecond)
# Memanggil fungsi fetch_all_urls/1 dengan daftar URL
ParallelFetcher.fetch_all_urls(urls)
# Mendapatkan waktu sistem saat ini dalam milidetik setelah semua URL diambil
end_time = :os.system_time(:millisecond)

# Mencetak total waktu eksekusi untuk mengambil semua URL
IO.puts("Total execution time: #{end_time - start_time} milliseconds")
