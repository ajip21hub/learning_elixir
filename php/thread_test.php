<?php
function heavy_task($n) {
  $result = 1;
  $start_time = microtime(true); // Mulai waktu untuk tugas
  for ($i = 1; $i <= $n; $i++) {
      $result *= $i;
  }
  $end_time = microtime(true); // Akhiri waktu untuk tugas
  $execution_time = round(($end_time - $start_time) * 1000, 3); // Bulatkan waktu eksekusi ke 3 digit
  echo "Task {$n}: Completed in {$execution_time} milliseconds\n"; // Tampilkan waktu eksekusi
  return $result;
}
function run_serial_tasks() {
    $results = [];

    foreach (range(10000, 20000) as $number) {
        $results[] = heavy_task($number);
    }

    echo "All tasks completed\n";
    return $results;
}

$start_time = microtime(true);
run_serial_tasks();
$end_time = microtime(true);

$execution_time = ($end_time - $start_time) * 1000;
echo "Total execution time: {$execution_time} milliseconds\n";
?>
