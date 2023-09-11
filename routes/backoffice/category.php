<?php

use App\Http\Controllers\Backoffice\CategoryController;
use Illuminate\Support\Facades\Route;

Route::prefix('/backoffice')
    ->middleware(['auth', 'prevent-back-history', 'permission'])
    ->group(function () {
        Route::resource('kategori', CategoryController::class)->except([
            'show'
        ])->parameters(['kategori' => 'category']);
    });
