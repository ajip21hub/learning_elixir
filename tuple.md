### **Penggunaan Tuple di Elixir**

Tuple di Elixir adalah struktur data yang digunakan untuk menyimpan koleksi elemen dalam urutan tetap dan memiliki jumlah elemen yang tetap. Tuple sangat efisien untuk akses cepat ke elemen berdasarkan indeks dan sering digunakan ketika Anda tahu jumlah elemen tidak akan berubah.

**Contoh Penggunaan Tuple:**

1. **Membuat Tuple:**
   ```elixir
   tuple = {1, "Elixir", :ok}
   IO.inspect(tuple)  # Output: {1, "Elixir", :ok}
   ```

2. **Mengakses Elemen dalam Tuple:**
   ```elixir
   tuple = {1, "Elixir", :ok}

   first_element = elem(tuple, 0)
   IO.puts(first_element)  # Output: 1

   second_element = elem(tuple, 1)
   IO.puts(second_element)  # Output: Elixir
   ```

3. **Mengubah Elemen dalam Tuple:**
   - Perlu diingat bahwa tuple di Elixir bersifat *immutable*. Anda tidak bisa mengubah elemen langsung dalam tuple, tapi Anda bisa membuat tuple baru dengan elemen yang diubah menggunakan `put_elem/3`.
   ```elixir
   tuple = {1, "Elixir", :ok}
   updated_tuple = put_elem(tuple, 1, "Phoenix")
   IO.inspect(updated_tuple)  # Output: {1, "Phoenix", :ok}
   ```

4. **Menggunakan Tuple dalam Pattern Matching:**
   ```elixir
   {status, message} = {:ok, "Operation successful"}
   IO.puts(status)  # Output: ok
   IO.puts(message)  # Output: Operation successful
   ```

### **Sample Code untuk Aplikasi Menggunakan Tuple**

Berikut adalah contoh aplikasi sederhana yang menggunakan tuple untuk menyimpan dan mengelola data koordinat dalam sistem 2D.

```elixir
defmodule CoordinateSystem do
  # Fungsi untuk membuat titik baru
  def create_point(x, y) do
    {x, y}
  end

  # Fungsi untuk menghitung jarak antara dua titik
  def distance({x1, y1}, {x2, y2}) do
    :math.sqrt(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2))
  end

  # Fungsi untuk mencetak koordinat
  def print_point({x, y}) do
    IO.puts("Point coordinates: (#{x}, #{y})")
  end
end

# Menjalankan aplikasi
point1 = CoordinateSystem.create_point(3, 4)
point2 = CoordinateSystem.create_point(7, 1)

CoordinateSystem.print_point(point1)  # Output: Point coordinates: (3, 4)
CoordinateSystem.print_point(point2)  # Output: Point coordinates: (7, 1)

distance = CoordinateSystem.distance(point1, point2)
IO.puts("Distance between points: #{distance}")  # Output: Distance between points: 5.0
```

### **Penjelasan:**

- **create_point/2:** Fungsi ini membuat dan mengembalikan tuple yang mewakili koordinat titik pada sistem 2D.

- **distance/2:** Fungsi ini menghitung jarak antara dua titik (dua tuple) menggunakan rumus Pythagoras. Nilai yang dikembalikan adalah jarak antara dua titik tersebut.

- **print_point/1:** Fungsi ini mencetak koordinat dari titik yang diberikan.

### **Aplikasi Praktis Lainnya:**

- **Menyimpan Data Konfigurasi:**
  Tuple sering digunakan untuk menyimpan konfigurasi tetap seperti status (`:ok`, `:error`) dengan pesan atau nilai yang terkait, mirip dengan bagaimana hasil fungsi biasanya dikembalikan di Elixir.

- **Kombinasi Kunci dan Nilai Sementara:**
  Tuple digunakan dalam operasi di mana kombinasi kunci dan nilai sementara dibutuhkan sebelum data disimpan dalam struktur data lain seperti map atau list.

Dengan memanfaatkan tuple, Anda bisa menyimpan dan mengelola data dalam struktur yang efisien, memastikan urutan dan ukuran data tetap konsisten. Ini sangat bermanfaat dalam banyak aplikasi, terutama yang membutuhkan akses cepat dan efisien ke elemen-elemen data.