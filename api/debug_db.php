<?php
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once '../config/database.php';

// This script provides database diagnostic information
$response = [
    'success' => false,
    'database_info' => [],
    'tables' => [],
    'error' => null
];

try {
    // Test database connection
    $database = new Database();
    $conn = $database->getConnection();
    $response['success'] = true;
    $response['database_info']['connection'] = 'Success';
    
    // Get database version and name
    $stmt = $conn->query('SELECT VERSION() as version');
    $version = $stmt->fetch(PDO::FETCH_ASSOC);
    $response['database_info']['version'] = $version['version'];
    $response['database_info']['name'] = $database->getDbName();
    
    // Get table list
    $stmt = $conn->query('SHOW TABLES');
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);
    $response['tables']['list'] = $tables;
    
    // For each table, get structure
    foreach ($tables as $table) {
        // Get columns
        $stmt = $conn->query("DESCRIBE `$table`");
        $columns = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response['tables']['structures'][$table] = $columns;
        
        // Get row count
        $stmt = $conn->query("SELECT COUNT(*) as count FROM `$table`");
        $count = $stmt->fetch(PDO::FETCH_ASSOC);
        $response['tables']['counts'][$table] = $count['count'];
        
        // If it's a question-related table, show a sample
        if (strpos($table, 'question') !== false || strpos($table, 'mcq') !== false || strpos($table, 'puzzle') !== false) {
            $stmt = $conn->query("SELECT * FROM `$table` LIMIT 1");
            $sample = $stmt->fetch(PDO::FETCH_ASSOC);
            $response['tables']['samples'][$table] = $sample;
        }
    }
    
} catch (Exception $e) {
    $response['error'] = [
        'message' => $e->getMessage(),
        'trace' => $e->getTrace()
    ];
}

echo json_encode($response, JSON_PRETTY_PRINT);
?>
