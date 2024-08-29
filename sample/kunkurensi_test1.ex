defmodule HeavyProcessing do
  def heavy_task(n) do
    # Simulasi proses berat dengan menghitung faktorial dari angka besar
    start_time = :os.system_time(:millisecond) # Mulai waktu untuk tugas
    result = Enum.reduce(1..n, 1, &*/2)
    end_time = :os.system_time(:millisecond) # Akhiri waktu untuk tugas
    execution_time = Float.round(end_time - start_time |> Kernel./(1000), 3) # Bulatkan waktu eksekusi ke 3 digit
    IO.puts("Task #{n}: Completed in #{execution_time} seconds") # Tampilkan waktu eksekusi
    result
  end

  def run_concurrent_tasks do
    tasks = for n <- 10000..20000 do  # Ubah rentang dari 1 hingga 50
      Task.async(fn -> heavy_task(n) end)
    end

    results = for task <- tasks do
      Task.await(task)
    end

    IO.puts("All tasks completed")
    results
  end
end

start_time = :os.system_time(:millisecond)
HeavyProcessing.run_concurrent_tasks()
end_time = :os.system_time(:millisecond)

IO.puts("Total execution time: #{end_time - start_time} milliseconds")
