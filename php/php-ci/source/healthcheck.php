<?php
header("HTTP/1.1 200 OK");
header('Content-Type: application/json; charset=utf-8');
echo json_encode(json_encode(['status' => 'OK'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));