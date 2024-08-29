### **Penggunaan `case` di Elixir**

`case` adalah salah satu struktur kontrol di Elixir yang digunakan untuk melakukan *pattern matching* terhadap suatu nilai dan mengeksekusi blok kode berdasarkan kecocokan pola tersebut. `case` sangat berguna untuk memeriksa beberapa kondisi atau pola dalam satu nilai secara bersamaan.

**Contoh Penggunaan `case`:**

1. **Dasar Penggunaan `case`:**

   ```elixir
   number = 5

   result = case number do
     1 -> "Satu"
     2 -> "Dua"
     3 -> "Tiga"
     4 -> "Empat"
     5 -> "Lima"
     _ -> "Tidak diketahui"
   end

   IO.puts(result)  # Output: Lima
   ```

   Dalam contoh ini, `case` memeriksa nilai dari `number`. Jika nilainya cocok dengan salah satu pola (`1`, `2`, `3`, `4`, `5`), maka blok kode yang sesuai akan dieksekusi. Jika tidak ada yang cocok, blok `_ -> "Tidak diketahui"` akan dijalankan.

2. **Menggunakan `case` dengan Tuple:**

   ```elixir
   tuple = {:ok, "Berhasil"}

   message = case tuple do
     {:ok, result} -> "Sukses: #{result}"
     {:error, reason} -> "Gagal: #{reason}"
     _ -> "Hasil tidak diketahui"
   end

   IO.puts(message)  # Output: Sukses: Berhasil
   ```

   Di sini, `case` digunakan untuk melakukan *pattern matching* pada sebuah tuple. Jika tuple adalah `{:ok, result}`, maka pesan sukses akan ditampilkan; jika tuple adalah `{:error, reason}`, maka pesan gagal akan ditampilkan. Jika tuple tidak cocok dengan salah satu pola, maka akan menampilkan pesan "Hasil tidak diketahui".

3. **Menggunakan `case` dengan List:**

   ```elixir
   list = [1, 2, 3]

   result = case list do
     [1, 2, 3] -> "Daftar lengkap"
     [1, 2] -> "Daftar pendek"
     [] -> "Daftar kosong"
     _ -> "Daftar lainnya"
   end

   IO.puts(result)  # Output: Daftar lengkap
   ```

   Dalam contoh ini, `case` memeriksa apakah list cocok dengan salah satu pola tertentu. Jika cocok, maka hasil yang sesuai akan ditampilkan.

4. **Menggunakan `case` dengan Map:**

   ```elixir
   person = %{name: "Alice", age: 30}

   description = case person do
     %{age: age} when age < 18 -> "Masih muda"
     %{age: age} when age >= 18 and age < 65 -> "Dewasa"
     %{age: age} when age >= 65 -> "Lanjut usia"
     _ -> "Umur tidak diketahui"
   end

   IO.puts(description)  # Output: Dewasa
   ```

   Di sini, `case` digunakan untuk memeriksa nilai dalam map. Blok `when` digunakan untuk menambahkan kondisi tambahan (guard clauses) pada pola yang dicocokkan.

### **Sample Code untuk Aplikasi Menggunakan `case`**

Berikut adalah contoh aplikasi sederhana yang menggunakan `case` untuk memeriksa status HTTP dan memberikan respons yang sesuai.

```elixir
defmodule HttpStatus do
  def handle_status(code) do
    case code do
      200 -> "OK - Request succeeded"
      404 -> "Not Found - The resource could not be found"
      500 -> "Internal Server Error - An error occurred on the server"
      403 -> "Forbidden - You do not have permission to access this resource"
      _ -> "Unknown Status Code"
    end
  end
end

# Menjalankan aplikasi
IO.puts(HttpStatus.handle_status(200))  # Output: OK - Request succeeded
IO.puts(HttpStatus.handle_status(404))  # Output: Not Found - The resource could not be found
IO.puts(HttpStatus.handle_status(500))  # Output: Internal Server Error - An error occurred on the server
IO.puts(HttpStatus.handle_status(123))  # Output: Unknown Status Code
```

### **Penjelasan:**

- **handle_status/1:** Fungsi ini menerima kode status HTTP sebagai argumen dan menggunakan `case` untuk mencocokkan kode tersebut dengan berbagai status HTTP umum. Berdasarkan hasil kecocokan, fungsi akan mengembalikan pesan yang sesuai dengan kode tersebut.

### **Aplikasi Praktis Lainnya:**

- **Penanganan Error:** Menggunakan `case` untuk menangani berbagai skenario error berdasarkan tipe kesalahan yang terjadi, seperti `{:error, reason}` dalam operasi I/O atau database.

- **Routing:** Dalam aplikasi web, `case` bisa digunakan untuk mencocokkan rute HTTP dengan tindakan yang sesuai berdasarkan URL atau metode request.

- **Penanganan Input:** Menggunakan `case` untuk memeriksa dan menangani berbagai jenis input yang diterima dari pengguna atau sistem lain, memastikan bahwa setiap tipe input diproses dengan benar.

Dengan memanfaatkan `case`, Anda dapat membuat kontrol alur yang lebih fleksibel dan kuat dalam aplikasi Anda, memungkinkan penanganan berbagai skenario dan pola data dengan cara yang efisien dan mudah dibaca.
