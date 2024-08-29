### **Penggunaan Pattern Matching di Elixir**

Pattern matching adalah salah satu fitur paling kuat di Elixir, yang memungkinkan Anda untuk mencocokkan struktur data dengan pola tertentu dan mengekstrak nilai dari dalamnya. Pattern matching dapat digunakan di berbagai tempat, termasuk dalam penugasan variabel, kontrol alur, fungsi, dan lebih banyak lagi.

**Contoh Penggunaan Pattern Matching:**

1. **Pattern Matching dengan Variabel:**

   ```elixir
   # Penugasan sederhana
   x = 1
   IO.puts(x)  # Output: 1

   # Penugasan dengan tuple
   {a, b, c} = {1, 2, 3}
   IO.puts(a)  # Output: 1
   IO.puts(b)  # Output: 2
   IO.puts(c)  # Output: 3
   ```

   Dalam contoh ini, `x = 1` adalah contoh sederhana dari pattern matching, di mana nilai 1 diikat ke variabel `x`. Dalam `{a, b, c} = {1, 2, 3}`, tuple di sisi kanan harus cocok dengan pola di sisi kiri, dan nilainya diekstraksi ke variabel `a`, `b`, dan `c`.

2. **Pattern Matching dengan List:**

   ```elixir
   # List sederhana
   [head | tail] = [1, 2, 3, 4]
   IO.puts(head)  # Output: 1
   IO.inspect(tail)  # Output: [2, 3, 4]
   ```

   Dalam contoh ini, `head` diikat ke elemen pertama list `[1, 2, 3, 4]`, dan `tail` diikat ke list sisanya `[2, 3, 4]`.

3. **Pattern Matching dengan Map:**

   ```elixir
   person = %{name: "Alice", age: 30}

   # Match key "name"
   %{name: name} = person
   IO.puts(name)  # Output: Alice

   # Match key "age"
   %{age: age} = person
   IO.puts(age)  # Output: 30
   ```

   Di sini, `name` dan `age` diekstraksi dari map `person` menggunakan pattern matching.

4. **Pattern Matching dengan Fungsi:**

   ```elixir
   defmodule Math do
     def sum({a, b}) do
       a + b
     end
   end

   result = Math.sum({3, 4})
   IO.puts(result)  # Output: 7
   ```

   Dalam contoh ini, fungsi `sum/1` menerima tuple sebagai argumen, dan pattern matching digunakan untuk mengekstrak elemen-elemen tuple tersebut langsung ke dalam variabel `a` dan `b`.

5. **Pattern Matching dalam Kontrol Alur (`case`):**

   ```elixir
   case {1, 2, 3} do
     {1, x, 3} -> IO.puts("Matched: x = #{x}")
     _ -> IO.puts("No match")
   end
   # Output: Matched: x = 2
   ```

   Dalam contoh ini, `case` digunakan untuk mencocokkan pola tuple `{1, 2, 3}` dengan pola `{1, x, 3}`. Karena pola cocok, nilai `x` diisi dengan `2`.

### **Sample Code untuk Aplikasi Menggunakan Pattern Matching**

Berikut adalah contoh aplikasi sederhana yang menggunakan pattern matching untuk mengekstrak informasi dari struktur data yang lebih kompleks, seperti hasil dari API.

```elixir
defmodule ApiClient do
  def process_response({:ok, %{status: 200, body: body}}) do
    IO.puts("Request succeeded with body: #{body}")
  end

  def process_response({:ok, %{status: status}}) when status >= 400 do
    IO.puts("Request failed with status: #{status}")
  end

  def process_response({:error, reason}) do
    IO.puts("Request failed due to: #{reason}")
  end
end

# Menjalankan aplikasi
ApiClient.process_response({:ok, %{status: 200, body: "Success"}})
# Output: Request succeeded with body: Success

ApiClient.process_response({:ok, %{status: 404}})
# Output: Request failed with status: 404

ApiClient.process_response({:error, "Timeout"})
# Output: Request failed due to: Timeout
```

### **Penjelasan:**

- **process_response/1:** Fungsi ini menggunakan pattern matching untuk menangani tiga jenis respons API yang berbeda:
  - Respons sukses dengan status 200 dan body.
  - Respons error dengan status di atas 400.
  - Respons yang gagal karena suatu alasan, seperti timeout.

- Fungsi ini memanfaatkan pattern matching untuk langsung mengekstrak nilai dari tuple dan map yang diberikan sebagai argumen.

### **Aplikasi Praktis Lainnya:**

- **Validasi Data:** Pattern matching bisa digunakan untuk memvalidasi dan mengekstrak data dari input pengguna atau data yang diterima dari sumber eksternal.

- **Penanganan Pesan:** Dalam aplikasi yang menggunakan proses atau actor, pattern matching sering digunakan untuk mengekstrak dan menangani berbagai jenis pesan.

- **Parsing Data:** Pattern matching berguna dalam memparsing data terstruktur, seperti JSON, XML, atau CSV, ke dalam elemen-elemen yang dapat digunakan dalam program.

Dengan memanfaatkan pattern matching, Anda dapat membuat kode yang lebih bersih, lebih mudah dibaca, dan lebih efisien dalam menangani berbagai jenis data dan skenario kontrol alur. Pattern matching adalah salah satu fitur yang benar-benar menunjukkan kekuatan dan fleksibilitas Elixir dalam pemrograman.
