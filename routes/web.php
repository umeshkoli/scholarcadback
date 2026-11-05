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


