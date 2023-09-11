<?php

namespace App\Http\Requests\Backoffice;

use Illuminate\Foundation\Http\FormRequest;

class ApplicationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'aplikasi_kategori_id' => ['required', 'string'],
            'aplikasi_nama' => ['required', 'string'],
            'aplikasi_ikon' => ['image', 'mimes:jpg,png,jpeg,gif,svg', 'max:2048'],
            'aplikasi_ikon_normal' => ['image', 'mimes:jpg,png,jpeg,gif,svg', 'max:2048'],
            'aplikasi_tautan' => ['required', 'string'],
            'aplikasi_jenis' => ['required', 'string'],
        ];
    }

    public function messages()
    {
        return [
            'aplikasi_kategori_id.required' => 'Kategori tidak boleh kosong',
            'aplikasi_nama.required' => 'Aplikasi tidak boleh kosong',
            'aplikasi_ikon.image' => 'Ikon harus berupa file gambar',
            'aplikasi_ikon.mimes' => 'Ikon harus ber extension jpg,png,jpeg,gif,svg',
            'aplikasi_ikon.max' => 'Ikon maksimal ukuran 2mb',
            'aplikasi_ikon_normal.image' => 'Ikon Normal harus berupa file gambar',
            'aplikasi_ikon_normal.mimes' => 'Ikon Normal harus ber extension jpg,png,jpeg,gif,svg',
            'aplikasi_ikon_normal.max' => 'Ikon Normal maksimal ukuran 2mb',
            'aplikasi_tautan.required' => 'Tautan tidak boleh kosong',
            'aplikasi_jenis.required' => 'Jenis tidak boleh kosong',
        ];
    }
}
