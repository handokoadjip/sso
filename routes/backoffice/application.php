<?php

use App\Http\Controllers\Backoffice\ApplicationController;
use Illuminate\Support\Facades\Route;

Route::prefix('/backoffice')
    ->middleware(['auth', 'prevent-back-history', 'permission'])
    ->group(function () {
        Route::resource('aplikasi', ApplicationController::class)->except([
            'show'
        ])->parameters(['aplikasi' => 'application']);
    });
