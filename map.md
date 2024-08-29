### **Penggunaan Map di Elixir**

Map adalah struktur data yang digunakan untuk menyimpan pasangan kunci-nilai (key-value pairs). Map sangat berguna ketika Anda perlu menyimpan data yang diakses melalui kunci unik. Tidak seperti List atau Tuple, Map tidak bergantung pada urutan elemen dan memungkinkan akses langsung ke nilai berdasarkan kunci.

**Contoh Penggunaan Map:**

1. **Membuat Map:**
   ```elixir
   map = %{"name" => "Alice", "age" => 30, "city" => "New York"}
   IO.inspect(map)  # Output: %{"name" => "Alice", "age" => 30, "city" => "New York"}
   ```

2. **Mengakses Nilai dalam Map:**
   - Menggunakan kunci untuk mengakses nilai:
   ```elixir
   map = %{"name" => "Alice", "age" => 30, "city" => "New York"}
   IO.puts(map["name"])  # Output: Alice
   IO.puts(map["age"])   # Output: 30
   ```

   - Menggunakan sintaksis atom untuk kunci atom:
   ```elixir
   map = %{name: "Alice", age: 30, city: "New York"}
   IO.puts(map.name)  # Output: Alice
   IO.puts(map.age)   # Output: 30
   ```

3. **Menambahkan atau Mengubah Nilai dalam Map:**
   - Menambahkan atau mengubah nilai menggunakan `put/3`:
   ```elixir
   map = %{"name" => "Alice", "age" => 30}
   updated_map = Map.put(map, "city", "New York")
   IO.inspect(updated_map)  # Output: %{"name" => "Alice", "age" => 30, "city" => "New York"}
   ```

   - Menggunakan sintaksis pembaruan:
   ```elixir
   map = %{name: "Alice", age: 30}
   updated_map = %{map | age: 31}
   IO.inspect(updated_map)  # Output: %{name: "Alice", age: 31}
   ```

4. **Menghapus Kunci dari Map:**
   ```elixir
   map = %{"name" => "Alice", "age" => 30, "city" => "New York"}
   updated_map = Map.delete(map, "age")
   IO.inspect(updated_map)  # Output: %{"name" => "Alice", "city" => "New York"}
   ```

5. **Mengecek Keberadaan Kunci:**
   ```elixir
   map = %{"name" => "Alice", "age" => 30}

   IO.puts(Map.has_key?(map, "name"))  # Output: true
   IO.puts(Map.has_key?(map, "city"))  # Output: false
   ```

6. **Iterasi melalui Map:**
   ```elixir
   map = %{"name" => "Alice", "age" => 30, "city" => "New York"}

   Enum.each(map, fn {key, value} ->
     IO.puts("#{key}: #{value}")
   end)
   # Output:
   # name: Alice
   # age: 30
   # city: New York
   ```

### **Sample Code untuk Aplikasi Menggunakan Map**

Berikut adalah contoh aplikasi sederhana yang menggunakan map untuk mengelola informasi kontak dalam sebuah buku alamat.

```elixir
defmodule AddressBook do
  # Fungsi untuk membuat buku alamat baru
  def new_book do
    %{}
  end

  # Fungsi untuk menambahkan kontak baru ke buku alamat
  def add_contact(book, name, phone, email) do
    contact = %{name: name, phone: phone, email: email}
    Map.put(book, name, contact)
  end

  # Fungsi untuk menampilkan semua kontak
  def show_contacts(book) do
    Enum.each(book, fn {name, contact} ->
      IO.puts("Name: #{contact.name}")
      IO.puts("Phone: #{contact.phone}")
      IO.puts("Email: #{contact.email}")
      IO.puts("---")
    end)
  end

  # Fungsi untuk menghapus kontak dari buku alamat
  def remove_contact(book, name) do
    Map.delete(book, name)
  end

  # Fungsi untuk mencari kontak berdasarkan nama
  def find_contact(book, name) do
    case Map.fetch(book, name) do
      {:ok, contact} -> IO.inspect(contact)
      :error -> IO.puts("Contact not found")
    end
  end
end

# Menjalankan aplikasi
address_book = AddressBook.new_book()
address_book = AddressBook.add_contact(address_book, "Alice", "123-456-7890", "alice@example.com")
address_book = AddressBook.add_contact(address_book, "Bob", "098-765-4321", "bob@example.com")

IO.puts("All Contacts:")
AddressBook.show_contacts(address_book)
# Output:
# All Contacts:
# Name: Alice
# Phone: 123-456-7890
# Email: alice@example.com
# ---
# Name: Bob
# Phone: 098-765-4321
# Email: bob@example.com
# ---

AddressBook.find_contact(address_book, "Alice")
# Output: %{email: "alice@example.com", name: "Alice", phone: "123-456-7890"}

address_book = AddressBook.remove_contact(address_book, "Bob")
IO.puts("\nContacts after removal:")
AddressBook.show_contacts(address_book)
# Output:
# Contacts after removal:
# Name: Alice
# Phone: 123-456-7890
# Email: alice@example.com
# ---
```

### **Penjelasan:**

- **new_book/0:** Fungsi ini membuat map kosong yang akan digunakan sebagai buku alamat.

- **add_contact/4:** Fungsi ini menambahkan kontak baru ke dalam map. Kontak disimpan sebagai map dalam map utama, di mana nama kontak digunakan sebagai kunci.

- **show_contacts/1:** Fungsi ini menampilkan semua kontak yang tersimpan dalam buku alamat dengan mengiterasi melalui map.

- **remove_contact/2:** Fungsi ini menghapus kontak dari map berdasarkan nama.

- **find_contact/2:** Fungsi ini mencari kontak dalam map berdasarkan nama dan menampilkan informasinya jika ditemukan.

### **Aplikasi Praktis Lainnya:**

- **Pengelolaan Konfigurasi:** Map digunakan untuk menyimpan dan mengelola konfigurasi aplikasi, di mana setiap opsi konfigurasi diidentifikasi dengan kunci tertentu.

- **Representasi JSON:** Map sering digunakan untuk mewakili data JSON di Elixir karena struktur kunci-nilai yang serupa, memudahkan parsing dan pembuatan JSON.

Dengan menggunakan map, Anda dapat mengelola data yang berpasangan kunci-nilai dengan cara yang efisien, mendukung berbagai operasi seperti penambahan, penghapusan, dan pencarian data dengan mudah dan cepat. Map sangat cocok untuk aplikasi yang memerlukan akses cepat ke data menggunakan kunci unik.