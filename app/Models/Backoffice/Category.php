<?php

namespace App\Models\Backoffice;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    use \App\Traits\TraitUuid;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'kategori';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'kategori_id';

    const CREATED_AT = 'kategori_dibuat_pada';
    const UPDATED_AT = 'kategori_diubah_pada';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'kategori_nama',
        'kategori_dibuat_pengguna_id',
    ];

    /**
     * Get the user that owns the phone.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'pengguna_id', 'kategori_dibuat_pengguna_id');
    }
}
