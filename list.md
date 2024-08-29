### **Penggunaan List di Elixir**

List adalah struktur data dasar dalam Elixir yang digunakan untuk menyimpan koleksi elemen dalam urutan tertentu. List di Elixir diimplementasikan sebagai linked list, yang membuatnya sangat efisien untuk operasi seperti penambahan atau penghapusan elemen di bagian depan.

**Contoh Penggunaan List:**

1. **Membuat List:**
   ```elixir
   list = [1, 2, 3, 4, 5]
   IO.inspect(list)  # Output: [1, 2, 3, 4, 5]
   ```

2. **Menambahkan Elemen ke List:**
   - Menambahkan elemen di depan list menggunakan kons operator (`|`):
   ```elixir
   list = [2, 3, 4]
   new_list = [1 | list]
   IO.inspect(new_list)  # Output: [1, 2, 3, 4]
   ```

3. **Mengakses Elemen dalam List:**
   - Mengakses elemen dengan fungsi `hd/1` (head) dan `tl/1` (tail):
   ```elixir
   list = [1, 2, 3, 4]

   head = hd(list)
   IO.puts(head)  # Output: 1

   tail = tl(list)
   IO.inspect(tail)  # Output: [2, 3, 4]
   ```

4. **Menggabungkan Dua List:**
   ```elixir
   list1 = [1, 2]
   list2 = [3, 4]

   combined_list = list1 ++ list2
   IO.inspect(combined_list)  # Output: [1, 2, 3, 4]
   ```

5. **Menghapus Elemen dari List:**
   ```elixir
   list = [1, 2, 3, 4]
   new_list = list -- [2, 4]
   IO.inspect(new_list)  # Output: [1, 3]
   ```

6. **Mengiterasi List:**
   ```elixir
   list = ["apple", "banana", "cherry"]

   Enum.each(list, fn fruit ->
     IO.puts("I like #{fruit}")
   end)
   # Output:
   # I like apple
   # I like banana
   # I like cherry
   ```

### **Sample Code untuk Aplikasi Menggunakan List**

Berikut adalah contoh aplikasi sederhana yang menggunakan list untuk menyimpan dan mengelola daftar tugas (to-do list).

```elixir
defmodule TodoList do
  # Fungsi untuk membuat to-do list baru
  def new_list do
    []
  end

  # Fungsi untuk menambahkan tugas ke to-do list
  def add_task(list, task) do
    [task | list]
  end

  # Fungsi untuk menampilkan semua tugas
  def show_tasks(list) do
    Enum.each(list, fn task ->
      IO.puts("Task: #{task}")
    end)
  end

  # Fungsi untuk menghapus tugas dari to-do list
  def remove_task(list, task) do
    list -- [task]
  end
end

# Menjalankan aplikasi
my_list = TodoList.new_list()
my_list = TodoList.add_task(my_list, "Buy groceries")
my_list = TodoList.add_task(my_list, "Write Elixir code")
my_list = TodoList.add_task(my_list, "Exercise")

IO.puts("Current To-Do List:")
TodoList.show_tasks(my_list)
# Output:
# Current To-Do List:
# Task: Exercise
# Task: Write Elixir code
# Task: Buy groceries

my_list = TodoList.remove_task(my_list, "Write Elixir code")
IO.puts("\nUpdated To-Do List:")
TodoList.show_tasks(my_list)
# Output:
# Updated To-Do List:
# Task: Exercise
# Task: Buy groceries
```

### **Penjelasan:**

- **new_list/0:** Fungsi ini membuat to-do list baru yang merupakan list kosong (`[]`).

- **add_task/2:** Fungsi ini menambahkan tugas baru ke bagian depan list menggunakan operator kons (`|`). List di Elixir lebih efisien untuk penambahan elemen di bagian depan daripada di bagian belakang.

- **show_tasks/1:** Fungsi ini menampilkan semua tugas dalam to-do list dengan iterasi menggunakan `Enum.each/2`.

- **remove_task/2:** Fungsi ini menghapus tugas tertentu dari list menggunakan operator `--`, yang menghapus semua elemen dari list yang sesuai dengan elemen dalam list yang diberikan.

### **Aplikasi Praktis Lainnya:**

- **Pengelolaan Koleksi Data:** List digunakan untuk menyimpan dan mengelola koleksi data seperti daftar item, nama pengguna, atau data transaksi.

- **Pemrosesan Batch:** List sering digunakan untuk memproses data dalam batch di mana setiap elemen dalam list diproses satu per satu dalam loop atau fungsi rekursif.

Dengan memanfaatkan list, Anda dapat mengelola koleksi data dalam urutan yang fleksibel dan efisien, memungkinkan operasi seperti penambahan, penghapusan, dan iterasi dengan mudah dan efektif.