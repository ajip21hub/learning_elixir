defmodule PrimeCalculator do
  # Fungsi untuk memeriksa apakah sebuah angka adalah prima
  def is_prime?(2), do: true
  def is_prime?(n) when n < 2, do: false
  def is_prime?(n) do
    range = 2..round(:math.sqrt(n))  # Mengubah ke integer
    Enum.all?(range, fn x -> rem(n, x) != 0 end)
  end

  # Fungsi untuk menghitung jumlah bilangan prima dalam range tertentu
  def count_primes_in_range(range) do
    Enum.filter(range, &is_prime?/1) |> Enum.count()
  end
end

# Menjalankan aplikasi
range = 1..10
IO.puts("Jumlah bilangan prima dalam rentang #{inspect(range)} adalah #{PrimeCalculator.count_primes_in_range(range)}")
# Output: Jumlah bilangan prima dalam rentang 1..100 adalah 25
