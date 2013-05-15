<?php

$rockstars = ['Stoškus', 'Arnas', 'Podolskis', 'Pawka', 'Žilvytis', 'Marius', 'Gintas', 'Mindaugas'];

shuffle($rockstars);
$chunks = array_chunk($rockstars, 2);
foreach ($chunks as $key => $chunk) {
    echo "Team " . ($key + 1) . ":\n";
    sleep(rand(3, 5));
    echo $chunk[0] . "\n";
    sleep(rand(3, 5));
    echo $chunk[1] . "\n";
    sleep(rand(3, 5));
    echo "===============================\n\n";
}
