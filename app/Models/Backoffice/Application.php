<?php

namespace App\Models\Backoffice;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    use HasFactory;
    use \App\Traits\TraitUuid;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'aplikasi';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'aplikasi_id';

    const CREATED_AT = 'aplikasi_dibuat_pada';
    const UPDATED_AT = 'aplikasi_diubah_pada';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'aplikasi_kategori_id',
        'aplikasi_nama',
        'aplikasi_ikon',
        'aplikasi_ikon_normal',
        'aplikasi_tautan',
        'aplikasi_jenis',
        'aplikasi_dibuat_pengguna_id',
    ];

    /**
     * Get the category that owns the application.
     */
    public function category()
    {
        return $this->belongsTo(Category::class, 'kategori_id', 'aplikasi_kategori_id');
    }

    /**
     * Get the user that owns the application.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'pengguna_id', 'aplikasi_dibuat_pengguna_id');
    }
}
