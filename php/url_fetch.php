<?php
function fetch_url($url) {
    $start_time = microtime(true);
    // Simulasi waktu pengambilan data (misalnya 1 detik)
    usleep(1000000); // 1 detik
    $end_time = microtime(true);
    $execution_time = ($end_time - $start_time) * 1000;
    echo "Fetched {$url} in {$execution_time} milliseconds\n";
    return $url;
}

function fetch_all_urls($urls) {
    $multiHandle = curl_multi_init();
    $curlHandles = [];

    foreach ($urls as $url) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_multi_add_handle($multiHandle, $ch);
        $curlHandles[] = $ch;
    }

    $running = null;
    do {
        curl_multi_exec($multiHandle, $running);
        curl_multi_select($multiHandle);
    } while ($running > 0);

    foreach ($curlHandles as $ch) {
        fetch_url(curl_getinfo($ch, CURLINFO_EFFECTIVE_URL));
        curl_multi_remove_handle($multiHandle, $ch);
        curl_close($ch);
    }

    curl_multi_close($multiHandle);
    echo "All URLs fetched\n";
}

$urls = [
  "http://example.com/1",
  "http://example.com/2",
  "http://example.com/3",
  "http://example.com/4",
  "http://example.com/5",
  "http://example.com/6",
  "http://example.com/7",
  "http://example.com/8",
  "http://example.com/9",
  "http://example.com/10",
  "http://example.com/11",
  "http://example.com/12",
  "http://example.com/13",
  "http://example.com/14",
  "http://example.com/15"
];
$start_time = microtime(true);
fetch_all_urls($urls);
$end_time = microtime(true);

$execution_time = ($end_time - $start_time) * 1000;
echo "Total execution time: {$execution_time} milliseconds\n";
?>
