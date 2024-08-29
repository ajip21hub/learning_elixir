defmodule ConcurrentTasks do
    def run_task do
      Task.start(fn ->
        :timer.sleep(1000)
        IO.puts "Task completed"
      end)
    end
  end

  ConcurrentTasks.run_task()
  IO.puts "Main process continues"
