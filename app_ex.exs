# Contoh penulisan atom di Elixir dan penggunaannya dalam program

# 1. Atom sebagai nilai konstan
status = :ok
IO.puts(status) # Output: ok

# 2. Atom sebagai kunci dalam map
user = %{name: "Alice", status: :active}
IO.puts(user[:status]) # Output: active

# 3. Atom dalam pattern matching
# Modul Example mendefinisikan fungsi status_message/1 yang menggunakan pattern matching dengan atoms.
defmodule Example do
  # Jika argumen adalah atom :ok, maka mengembalikan pesan "Semua baik-baik saja!"
  def status_message(:ok), do: "Semua baik-baik saja!"

  # Jika argumen adalah atom :error, maka mengembalikan pesan "Ada sesuatu yang salah!"
  def status_message(:error), do: "Ada sesuatu yang salah!"

  # Jika argumen tidak cocok dengan pola di atas, maka mengembalikan pesan "tidak ada yang cocok"
  def status_message(_), do: "tidak ada yang cocok"
end

IO.puts(Example.status_message(:ok))    # Output: Semua baik-baik saja!
IO.puts(Example.status_message(:error)) # Output: Ada sesuatu yang salah!

IO.puts(Example.status_message(:tes)) # Output: Ada sesuatu yang salah!

# Note: Atom adalah nilai konstan yang sering digunakan sebagai kunci dalam map, nilai konstan, dan dalam pattern matching. Atom dimulai dengan tanda titik dua (:) dan diikuti oleh serangkaian karakter tanpa spasi.


# Modul Name mendefinisikan fungsi call/1 yang menerima string sebagai argumen dan mengembalikan string yang sesuai.
defmodule Name do
  # Jika argumen adalah string "aji", maka mengembalikan "aji pangestu"
  def call("aji"), do: "aji pangestu"

  # Jika argumen adalah string "budi", maka mengembalikan "budi doremi"
  def call("budi"), do: "budi doremi"
end

IO.puts(Name.call("aji"))



defmodule Math do
  def perkalian(a,b) do
    a * b
  end
end

IO.inspect(Math.perkalian(3,5))
