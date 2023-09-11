<?php

namespace App\Http\Requests\Backoffice;

use Illuminate\Foundation\Http\FormRequest;

class InformationRequest extends FormRequest
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
            'informasi_judul' => ['required', 'string'],
            'informasi_deskripsi' => ['required', 'string'],
        ];
    }

    public function messages()
    {
        return [
            'informasi_judul.required' => 'Judul tidak boleh kosong',
            'informasi_deskripsi.required' => 'Deskripsi tidak boleh kosong',
        ];
    }
}
