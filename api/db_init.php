<?php
// Set appropriate headers
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

// Error reporting for debugging
if (isset($_GET['debug']) && $_GET['debug'] == 'true') {
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
}

// Include database configuration
include_once dirname(__DIR__) . '/config/database.php';

// Global debug array for detailed error reporting
$debug = [
    'timestamp' => date('Y-m-d H:i:s'),
    'php_version' => PHP_VERSION,
    'request_method' => $_SERVER['REQUEST_METHOD'],
    'query_params' => $_GET
];

// Initialize database connection
try {
    $database = new Database();
    $db = $database->getConnection();
    $debug['database_connected'] = true;
} catch (Exception $e) {
    $debug['database_connected'] = false;
    $debug['connection_error'] = $e->getMessage();
    
    // Output connection error
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Database connection failed',
        'debug' => $debug
    ]);
    exit;
}

// Start output buffering to prevent header issues
ob_start();
?>
