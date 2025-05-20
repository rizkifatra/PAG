<?php
// Prevent any output before headers
ob_start();

// Disable error display but log them
ini_set('display_errors', '0');
ini_set('log_errors', '1');
error_reporting(E_ALL);

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

// Database connection
require_once '../config/database.php';

// Clear any previous output
ob_clean();

$debug = [];
$level = isset($_GET['level']) ? intval($_GET['level']) : 1;

try {
    $database = new Database();
    
    if (!$database->testConnection()) {
        throw new Exception('Database connection failed');
    }
    
    $db = $database->getConnection();

    // Check table structure
    $structure = $db->query("DESCRIBE mcq_questions");
    $debug['table_structure'] = $structure->fetchAll(PDO::FETCH_ASSOC);

    $stmt = $db->prepare("SELECT id, question_text, options, correct_answer, level FROM mcq_questions WHERE level = ? ORDER BY RAND() LIMIT 5");
    $stmt->execute([$level]);
    
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $debug['query_result'] = $questions;
    
    if (empty($questions)) {
        $debug['message'] = 'No questions found for level ' . $level;
        // Return sample question if no questions found
        echo json_encode([
            [
                'id' => 1,
                'question_text' => 'What does HTML stand for?',
                'options' => [
                    'Hyper Text Markup Language',
                    'High Tech Modern Language',
                    'Hyper Transfer Markup Language',
                    'Home Tool Markup Language'
                ],
                'correct_answer' => 0
            ]
        ]);
        exit;
    }
    
    // Format questions for frontend
    $formatted_questions = array_map(function($q) {
        // Parse options JSON if it's stored as a string
        $options = $q['options'];
        if (is_string($options)) {
            try {
                $options = json_decode($options, true);
            } catch (Exception $e) {
                $options = [];
            }
        }
        
        return [
            'id' => $q['id'],
            'question_text' => $q['question_text'],
            'options' => $options,
            'correct_answer' => $q['correct_answer'],
            'level' => $q['level']
        ];
    }, $questions);
    
    echo json_encode($formatted_questions);
    
} catch (Exception $e) {
    // Enhanced error response
    $debug['error'] = $e->getMessage();
    $debug['trace'] = $e->getTraceAsString();
    
    echo json_encode([
        'success' => false,
        'message' => 'Error fetching questions: ' . $e->getMessage(),
        'debug' => $debug
    ]);
}
// Flush and end output
ob_end_flush();
