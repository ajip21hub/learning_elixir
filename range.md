### **Penggunaan Range di Elixir**

Range di Elixir digunakan untuk mewakili urutan nilai dari suatu angka awal hingga angka akhir. Range sangat berguna dalam iterasi, seleksi kondisi, dan operasi lainnya yang memerlukan interval angka. Range didefinisikan dengan dua titik (`..`) antara angka awal dan angka akhir.

**Contoh Penggunaan Range:**

1. **Membuat Range:**
   ```elixir
   range = 1..10
   IO.inspect(range)  # Output: 1..10
   ```

2. **Iterasi Menggunakan Range:**
   ```elixir
   range = 1..5
   Enum.each(range, fn x -> IO.puts("Angka: #{x}") end)
   # Output:
   # Angka: 1
   # Angka: 2
   # Angka: 3
   # Angka: 4
   # Angka: 5
   ```

3. **Menggunakan Range dalam Kondisi:**
   ```elixir
   age = 25

   case age do
     0..12 -> IO.puts("Anak-anak")
     13..19 -> IO.puts("Remaja")
     20..59 -> IO.puts("Dewasa")
     _ -> IO.puts("Lansia")
   end
   # Output: Dewasa
   ```

4. **Mengecek Keanggotaan dalam Range:**
   ```elixir
   IO.puts(5 in 1..10)  # Output: true
   IO.puts(15 in 1..10) # Output: false
   ```

### **Sample Code untuk Aplikasi Menggunakan Range**

Berikut adalah contoh aplikasi sederhana yang menggunakan range untuk menghitung jumlah bilangan prima dalam rentang tertentu.

```elixir
defmodule PrimeCalculator do
  # Fungsi untuk memeriksa apakah sebuah angka adalah prima
  def is_prime?(2), do: true
  def is_prime?(n) when n < 2, do: false
  def is_prime?(n) do
    range = 2..:math.sqrt(n) |> round()
    Enum.all?(range, fn x -> rem(n, x) != 0 end)
  end

  # Fungsi untuk menghitung jumlah bilangan prima dalam range tertentu
  def count_primes_in_range(range) do
    Enum.filter(range, &is_prime?/1) |> Enum.count()
  end
end

# Menjalankan aplikasi
range = 1..100
IO.puts("Jumlah bilangan prima dalam rentang #{range} adalah #{PrimeCalculator.count_primes_in_range(range)}")
# Output: Jumlah bilangan prima dalam rentang 1..100 adalah 25
```

### **Penjelasan:**

- **is_prime?/1:** Fungsi untuk memeriksa apakah suatu angka adalah bilangan prima.
  - Jika angka adalah 2, maka itu adalah prima.
  - Jika angka kurang dari 2, itu bukan prima.
  - Untuk angka lainnya, fungsi ini memeriksa apakah angka tersebut habis dibagi oleh bilangan lain dalam rentang 2 hingga akar kuadrat dari angka tersebut.

- **count_primes_in_range/1:** Fungsi ini mengambil range dan menghitung jumlah bilangan prima di dalamnya dengan memfilter elemen-elemen dalam range menggunakan fungsi `is_prime?/1`.

- **Main Program:** Aplikasi ini menghitung dan mencetak jumlah bilangan prima dalam rentang 1 hingga 100.

### **Aplikasi Praktis Lainnya:**

- **Pemeriksaan Range Usia:**
  Menggunakan range untuk menentukan kategori usia (anak-anak, remaja, dewasa, lansia) berdasarkan input usia pengguna.

- **Pemisahan Data Berdasarkan Rentang:**
  Misalnya, Anda bisa menggunakan range untuk memfilter data penjualan berdasarkan periode tertentu dalam laporan bulanan.

Dengan memanfaatkan range, Anda bisa menulis kode yang lebih bersih dan efisien dalam banyak kasus, khususnya saat bekerja dengan urutan angka atau interval tertentu.