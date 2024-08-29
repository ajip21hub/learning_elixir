defmodule ParallelFetcher do
  # Fungsi fetch_url/1 adalah fungsi yang menerima satu argumen berupa URL dan mensimulasikan pengambilan data dari URL tersebut dengan tidur selama 1 detik, kemudian mengembalikan tuple {:ok, url} yang menunjukkan bahwa URL telah berhasil diambil.
  def fetch_url(url) do
    # Mendapatkan waktu sistem saat ini dalam milidetik dan menyimpannya dalam variabel start_time
    start_time = :os.system_time(:millisecond)
    # Simulasi waktu pengambilan data dengan tidur selama 1 detik
    :timer.sleep(1000)
    # Mendapatkan waktu sistem saat ini dalam milidetik setelah tidur dan menyimpannya dalam variabel end_time
    end_time = :os.system_time(:millisecond)
    # Mencetak pesan yang menunjukkan URL yang diambil dan waktu yang dibutuhkan
    IO.puts("Fetched #{url} in #{end_time - start_time} milliseconds")
    # Mengembalikan tuple {:ok, url} sebagai hasil dari fungsi
    {:ok, url}
  end

  # Mendefinisikan fungsi fetch_all_urls/1 yang menerima satu argumen urls
  def fetch_all_urls(urls) do
    # Membuat daftar tugas asinkron untuk setiap URL dalam daftar urls
    tasks = for url <- urls do
      # Menggunakan Task.async untuk menjalankan fetch_url/1 secara paralel
      Task.async(fn -> fetch_url(url) end)
    end

    # Menunggu semua tugas selesai dan mengumpulkan hasilnya dalam daftar results
    results = for task <- tasks do
      # Menggunakan Task.await untuk menunggu hasil dari setiap tugas
      Task.await(task)
    end

    # Mencetak pesan yang menunjukkan semua URL telah diambil
    IO.puts("All URLs fetched")
    # Mengembalikan daftar hasil dari semua tugas
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
