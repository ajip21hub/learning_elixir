### **Penggunaan `cond` di Elixir**

`cond` adalah struktur kontrol di Elixir yang digunakan untuk memeriksa beberapa kondisi atau ekspresi boolean dan mengeksekusi blok kode yang sesuai dengan kondisi pertama yang benar. `cond` sangat berguna ketika Anda memiliki beberapa kondisi yang harus diperiksa secara berurutan, mirip dengan rantai `if-else if-else` di bahasa pemrograman lain.

**Contoh Penggunaan `cond`:**

1. **Dasar Penggunaan `cond`:**

   ```elixir
   x = 15

   result = cond do
     x < 10 -> "x kurang dari 10"
     x == 10 -> "x sama dengan 10"
     x > 10 -> "x lebih besar dari 10"
   end

   IO.puts(result)  # Output: x lebih besar dari 10
   ```

   Dalam contoh ini, `cond` memeriksa beberapa ekspresi boolean. Ekspresi pertama yang benar akan menyebabkan blok kode yang sesuai dieksekusi.

2. **Menggunakan `cond` dengan `when` untuk Guard Clause:**

   ```elixir
   age = 25

   category = cond do
     age < 18 -> "Remaja"
     age >= 18 and age < 65 -> "Dewasa"
     age >= 65 -> "Lansia"
   end

   IO.puts(category)  # Output: Dewasa
   ```

   Di sini, `cond` digunakan untuk mengkategorikan usia ke dalam beberapa kelompok. Setiap kondisi diperiksa secara berurutan hingga satu kondisi benar.

3. **Menggunakan `cond` dengan Kasus Default:**

   ```elixir
   score = 75

   grade = cond do
     score >= 90 -> "A"
     score >= 80 -> "B"
     score >= 70 -> "C"
     score >= 60 -> "D"
     true -> "F"
   end

   IO.puts("Nilai Anda: #{grade}")  # Output: Nilai Anda: C
   ```

   Dalam contoh ini, kondisi terakhir `true -> "F"` bertindak sebagai kasus default yang akan dieksekusi jika tidak ada kondisi sebelumnya yang benar. Ini mirip dengan `else` di `if-else`.

### **Sample Code untuk Aplikasi Menggunakan `cond`**

Berikut adalah contoh aplikasi sederhana yang menggunakan `cond` untuk menentukan jenis hari berdasarkan input suhu.

```elixir
defmodule Weather do
  def classify_temperature(temp) do
    cond do
      temp < 0 -> "Freezing"
      temp >= 0 and temp < 15 -> "Cold"
      temp >= 15 and temp < 25 -> "Cool"
      temp >= 25 and temp < 35 -> "Warm"
      temp >= 35 -> "Hot"
    end
  end
end

# Menjalankan aplikasi
IO.puts("Temperature is -5°C: #{Weather.classify_temperature(-5)}")  # Output: Temperature is -5°C: Freezing
IO.puts("Temperature is 10°C: #{Weather.classify_temperature(10)}")  # Output: Temperature is 10°C: Cold
IO.puts("Temperature is 20°C: #{Weather.classify_temperature(20)}")  # Output: Temperature is 20°C: Cool
IO.puts("Temperature is 30°C: #{Weather.classify_temperature(30)}")  # Output: Temperature is 30°C: Warm
IO.puts("Temperature is 40°C: #{Weather.classify_temperature(40)}")  # Output: Temperature is 40°C: Hot
```

### **Penjelasan:**

- **classify_temperature/1:** Fungsi ini mengambil suhu dalam derajat Celcius sebagai input dan menggunakan `cond` untuk menentukan klasifikasi suhu (Freezing, Cold, Cool, Warm, atau Hot). Kondisi diperiksa secara berurutan hingga menemukan yang sesuai.

### **Aplikasi Praktis Lainnya:**

- **Penentuan Tarif atau Diskon:** Menggunakan `cond` untuk menentukan tarif, pajak, atau diskon berdasarkan nilai total pembelian atau kriteria lain.

- **Penanganan Kondisi Kompleks:** Dalam aplikasi yang memerlukan pemeriksaan beberapa kondisi kompleks secara berurutan, `cond` sangat berguna untuk mengelola logika tersebut secara bersih dan terstruktur.

- **Pemrosesan Input:** `cond` bisa digunakan untuk memproses input dari pengguna atau data yang diterima dari API, menentukan tindakan yang tepat berdasarkan kondisi data.

Dengan memanfaatkan `cond`, Anda dapat membuat kontrol alur yang lebih fleksibel dan mudah dipahami, terutama ketika berurusan dengan beberapa kondisi atau skenario yang perlu dievaluasi dalam urutan tertentu. Ini menjadikannya alat yang sangat berguna dalam menulis logika program yang kompleks dan mudah dipelihara.
