<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Artisan;

Route::get('/storage-link', function () {
    Artisan::call('storage:link');
    return 'Artisan storage:link command has been executed.';
});


Route::get('/optimize-app', function () {
    Artisan::call('optimize');
    return 'Laravel application configuration and routes successfully cached and optimized!';
});

Route::get('/clear-everything', function () {
    // Runs the equivalent of 'php artisan optimize:clear'
    Artisan::call('optimize:clear');
    
    return 'All Laravel caches have been successfully cleared!';
});

Route::post('/encrypt-request', function (Request $request) {
    return response()->json([
        'encrypted' => encrypt(json_encode($request->input('payload')))
    ]);
})->name('encrypt-request');

// Route::get('/language-switch', [\Modules\Core\Http\Controllers\LanguageController::class, 'languageSwitch'])
//     ->name('language.switch');


// Route::get('/test', function (Request $request) {
//      dd('hhh');

// });


include_once __DIR__.'/test.php';
require __DIR__ . '/../Modules/LandingPage/Routes/web.php';



Route::get('/documents/{path}', function (\Illuminate\Http\Request $request, $path) {
    $request->merge(['path' => 'documents/' . $path]);
    return app(\Modules\DynamicMaster\Http\Controllers\DynamicMasterController::class)->callAction('secure_file', [$request]);
})->where('path', '.*');


Route::get('/storage/documents/{path}', function (\Illuminate\Http\Request $request, $path) {
    $request->merge(['path' => 'documents/' . $path]);
    return app(\Modules\DynamicMaster\Http\Controllers\DynamicMasterController::class)->callAction('secure_file', [$request]);
})->where('path', '.*');

Route::get('/assets/{path}', function (\Illuminate\Http\Request $request, $path) {
    $fullPath = public_path('assets/' . $path);
    if (file_exists($fullPath) && is_file($fullPath)) {
        $ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
        $mimes = ['jpg' => 'image/jpeg', 'jpeg' => 'image/jpeg', 'png' => 'image/png', 'webp' => 'image/webp', 'svg' => 'image/svg+xml', 'gif' => 'image/gif'];
        $mime = $mimes[$ext] ?? (@mime_content_type($fullPath) ?: 'image/jpeg');
        return response()->file($fullPath, [
            'Access-Control-Allow-Origin' => '*',
            'Content-Type' => $mime,
        ]);
    }
    abort(404);
})->where('path', '.*');
