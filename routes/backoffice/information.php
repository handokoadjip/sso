<?php

use App\Http\Controllers\Backoffice\InformationController;
use Illuminate\Support\Facades\Route;

Route::prefix('/backoffice')
    ->middleware(['auth', 'prevent-back-history', 'permission'])
    ->group(function () {
        Route::resource('informasi', InformationController::class)->except([
            'show'
        ])->parameters(['informasi' => 'information']);
    });
