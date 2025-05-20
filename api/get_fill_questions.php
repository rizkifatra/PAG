<?php
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once '../config/database.php';

$debug = [];
$level = isset($_GET['level']) ? intval($_GET['level']) : 1;

try {
    $database = new Database();
    $db = $database->getConnection();
    
    // Query fill in the blank questions for this level
    $stmt = $db->prepare("SELECT id, question_text, answers, level FROM fill_blank_questions WHERE level = ? ORDER BY RAND() LIMIT 5");
    $stmt->execute([$level]);
    
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $debug['query_result'] = $questions;
    
    if (empty($questions)) {
        $debug['message'] = 'No fill in the blank questions found for level ' . $level;
        // Return sample question if no questions found
        echo json_encode([
            [
                'id' => 1,
                'question_text' => 'HTML stands for [blank] Text Markup Language.',
                'answers' => ['Hyper'],
                'level' => $level
            ]
        ]);
        exit;
    }
    
    // Format questions for frontend
    $formatted_questions = array_map(function($q) {
        // Parse answers JSON if it's stored as a string
        $answers = $q['answers'];
        if (is_string($answers)) {
            try {
                $answers = json_decode($answers, true);
            } catch (Exception $e) {
                $answers = [];
            }
        }
        
        return [
            'id' => $q['id'],
            'question_text' => $q['question_text'],
            'answers' => $answers,
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
        'message' => 'Error fetching fill in the blank questions: ' . $e->getMessage(),
        'debug' => $debug
    ]);
}
?>
