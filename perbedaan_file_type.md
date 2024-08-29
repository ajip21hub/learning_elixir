Dalam Elixir, terdapat dua ekstensi file utama, yaitu `.ex` dan `.exs`, yang digunakan untuk tujuan yang berbeda:

1. **`.ex` (Elixir Script)**
   - File dengan ekstensi `.ex` adalah file skrip Elixir yang berisi kode yang biasanya akan dikompilasi ke dalam bytecode. File ini digunakan untuk modul, fungsi, dan logika program yang ingin dikompilasi dan digunakan dalam aplikasi Elixir. Karena dikompilasi, file `.ex` biasanya digunakan dalam pengembangan aplikasi yang lebih besar dan kompleks.

2. **`.exs` (Elixir Script Executable)**
   - File dengan ekstensi `.exs` adalah file skrip Elixir yang dieksekusi langsung tanpa dikompilasi. Ini digunakan untuk menulis skrip yang bersifat sementara atau ad-hoc, seperti skrip untuk tes, skrip build, atau skrip yang hanya diperlukan untuk satu kali eksekusi. File `.exs` lebih cocok untuk skenario di mana kecepatan eksekusi lebih penting daripada kompiling kode, seperti dalam pengujian atau scripting sederhana.

**Perbedaan utama**:
- `.ex` digunakan untuk kode yang dikompilasi dan diimpor sebagai bagian dari aplikasi yang lebih besar.
- `.exs` digunakan untuk skrip yang dieksekusi langsung tanpa perlu dikompilasi terlebih dahulu.

Misalnya, Anda mungkin menulis modul utama aplikasi Anda dalam file `.ex`, sementara Anda menggunakan file `.exs` untuk menulis skrip pengujian atau skrip migrasi database yang hanya perlu dijalankan sekali.

Berikut ini adalah contoh kode sederhana yang menunjukkan perbedaan antara file `.ex` dan `.exs`, serta bagaimana keduanya digunakan dalam aplikasi Elixir.

### Contoh Kode dalam File `.ex`
File `.ex` umumnya digunakan untuk mendefinisikan modul dan fungsi yang akan dikompilasi dan digunakan oleh aplikasi.

**`lib/hello.ex`**
```elixir
defmodule Hello do
  def greet(name) do
    "Hello, #{name}!"
  end
end
```

**Penggunaan:**
File ini dapat dikompilasi dan digunakan dalam aplikasi Elixir yang lebih besar. Misalnya, kita bisa memanggil modul `Hello` dari modul atau fungsi lain dalam aplikasi.

```elixir
# Mengompilasi file dan menggunakan modul
iex> c("lib/hello.ex")
[Hello]

iex> Hello.greet("Alice")
"Hello, Alice!"
```

### Contoh Kode dalam File `.exs`
File `.exs` biasanya digunakan untuk skrip yang lebih sederhana, seperti skrip pengujian atau skrip satu kali eksekusi.

**`scripts/greet.exs`**
```elixir
IO.puts "What's your name?"
name = IO.gets("> ") |> String.trim()
IO.puts Hello.greet(name)
```

**Penggunaan:**
File `.exs` dapat dieksekusi langsung dari command line tanpa perlu dikompilasi terlebih dahulu.

```bash
$ elixir scripts/greet.exs
What's your name?
> Bob
Hello, Bob!
```

### Contoh Aplikasi Elixir Sederhana

Misalkan Anda ingin membuat aplikasi Elixir sederhana yang memiliki dua modul: satu modul untuk menyapa pengguna (`Hello.ex`) dan satu modul lain untuk menghitung (`Calculator.ex`). Kemudian, Anda ingin menulis skrip untuk menjalankan fungsi dari modul-modul tersebut menggunakan file `.exs`.

**Struktur Proyek:**
```
my_app/
│
├── lib/
│   ├── hello.ex
│   └── calculator.ex
│
└── scripts/
    └── run.exs
```

**`lib/hello.ex`**
```elixir
defmodule Hello do
  def greet(name) do
    "Hello, #{name}!"
  end
end
```

**`lib/calculator.ex`**
```elixir
defmodule Calculator do
  def add(a, b) do
    a + b
  end

  def multiply(a, b) do
    a * b
  end
end
```

**`scripts/run.exs`**
```elixir
# Muat modul
Code.require_file("../lib/hello.ex", __DIR__)
Code.require_file("../lib/calculator.ex", __DIR__)

# Gunakan fungsi dari modul
IO.puts Hello.greet("World")

result = Calculator.add(10, 20)
IO.puts "10 + 20 = #{result}"

result = Calculator.multiply(5, 6)
IO.puts "5 * 6 = #{result}"
```

**Cara Penggunaan:**

1. **Kompilasi dan Jalankan di IEx:**
   ```bash
   $ iex -S mix
   iex> Hello.greet("Alice")
   "Hello, Alice!"
   iex> Calculator.add(10, 15)
   25
   ```

2. **Jalankan Skrip `.exs`:**
   ```bash
   $ elixir scripts/run.exs
   Hello, World!
   10 + 20 = 30
   5 * 6 = 30
   ```

### Penjelasan:
- **File `.ex`** digunakan untuk mendefinisikan logika aplikasi yang dapat digunakan kembali, dan file ini dikompilasi ketika aplikasi berjalan.
- **File `.exs`** digunakan untuk mengeksekusi logika ini dalam bentuk skrip, biasanya untuk tujuan tertentu yang tidak memerlukan kompiling.

Dengan contoh ini, Anda dapat melihat bagaimana file `.ex` dan `.exs` berkolaborasi dalam aplikasi Elixir yang sederhana.


Untuk membuktikan perbedaan antara file `.ex` dan `.exs`, Anda dapat melakukan beberapa langkah praktis di lingkungan Elixir untuk melihat bagaimana kedua jenis file tersebut berfungsi secara berbeda dalam hal kompilasi dan eksekusi.

### 1. **Perbedaan Kompilasi**

#### File `.ex`
- File `.ex` dikompilasi sebelum dapat dieksekusi. Ini berarti jika Anda menulis kode dalam file `.ex`, kode tersebut akan diubah menjadi bytecode dan disimpan dalam format `.beam` di direktori `_build`.

**Langkah-langkah:**
1. Buat file `hello.ex` dalam direktori `lib/`:
   ```elixir
   # lib/hello.ex
   defmodule Hello do
     def greet(name) do
       "Hello, #{name}!"
     end
   end
   ```

2. Jalankan perintah kompilasi di IEx:
   ```bash
   $ iex -S mix
   iex> c("lib/hello.ex")
   ```

3. Periksa apakah file `.beam` telah dibuat di direktori `_build`:
   ```bash
   $ ls _build/dev/lib/my_app/ebin/
   Elixir.Hello.beam
   ```

**Hasil:** File `.ex` akan dikompilasi menjadi file `.beam` yang dapat digunakan kembali.

#### File `.exs`
- File `.exs` tidak dikompilasi menjadi bytecode, tetapi langsung dieksekusi sebagai skrip. Ini berarti tidak ada file `.beam` yang dihasilkan.

**Langkah-langkah:**
1. Buat file `script.exs` dalam direktori `scripts/`:
   ```elixir
   # scripts/script.exs
   IO.puts "This is a script!"
   ```

2. Jalankan skrip `.exs` langsung dari terminal:
   ```bash
   $ elixir scripts/script.exs
   ```

3. Periksa direktori `_build` untuk melihat apakah ada file `.beam`:
   ```bash
   $ ls _build/dev/lib/my_app/ebin/
   ```

**Hasil:** Tidak ada file `.beam` yang dibuat karena `.exs` hanya dieksekusi dan tidak dikompilasi.

### 2. **Perbedaan Penggunaan**

#### File `.ex`
- Setelah dikompilasi, modul yang ditentukan dalam file `.ex` dapat digunakan di seluruh aplikasi.

**Langkah-langkah:**
1. Jalankan IEx dengan perintah berikut:
   ```bash
   $ iex -S mix
   ```

2. Gunakan modul yang dikompilasi:
   ```elixir
   iex> Hello.greet("Alice")
   "Hello, Alice!"
   ```

**Hasil:** Modul `Hello` tersedia di lingkungan interaktif Elixir dan dapat digunakan kapan saja setelah kompilasi.

#### File `.exs`
- File `.exs` digunakan sekali dan hasilnya tidak dapat digunakan kembali setelah eksekusi.

**Langkah-langkah:**
1. Jalankan skrip `.exs`:
   ```bash
   $ elixir scripts/script.exs
   ```

2. Coba gunakan fungsi dari file `.exs` di IEx (tidak akan tersedia):
   ```elixir
   iex> Script.function() # Tidak akan ditemukan karena tidak dikompilasi menjadi modul
   ```

**Hasil:** Fungsi atau modul yang ditulis dalam file `.exs` tidak akan tersedia di lingkungan interaktif Elixir setelah skrip selesai dieksekusi.

### 3. **Perbedaan Penggunaan dalam Aplikasi**

#### File `.ex`
- Digunakan untuk modul dan logika aplikasi yang akan dikompilasi dan digunakan di berbagai bagian aplikasi.

#### File `.exs`
- Digunakan untuk skrip satu kali yang menjalankan logika tertentu, misalnya, untuk pengujian, migrasi database, atau tugas otomatis lainnya.

### **Kesimpulan:**
1. **Kompilasi:** File `.ex` dikompilasi menjadi bytecode (`.beam`), sedangkan file `.exs` dieksekusi langsung tanpa dikompilasi.
2. **Penggunaan:** File `.ex` digunakan untuk membuat modul dan fungsi yang digunakan di seluruh aplikasi, sementara file `.exs` digunakan untuk skrip ad-hoc yang tidak dimaksudkan untuk digunakan kembali.
3. **Eksistensi Hasil:** Modul dari file `.ex` tetap ada setelah kompilasi dan dapat digunakan kembali, sedangkan kode dalam file `.exs` hanya ada selama eksekusi skrip.
