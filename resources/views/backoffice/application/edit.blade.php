@extends('layouts.dashboard')

@section('title', 'Ubah Aplikasi')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">@yield('title')</h3>
                </div>
                <div class="card-body">
                    {{ Form::open(['route' => ['aplikasi.update', $data['application']->aplikasi_id], 'method' => 'put', 'files' => true]) }}
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-4">
                                {{ Form::label('aplikasi_nama', 'Aplikasi', ['class' => 'form-label']) }}
                                {{ Form::text('aplikasi_nama', old('aplikasi_nama', $data['application']->aplikasi_nama), ['placeholder' => 'Aplikasi', 'class' => $errors->has('aplikasi_nama') ? 'form-control is-invalid' : 'form-control', 'autocomplete'=>'aplikasi_nama', 'autofocus'=>'autofocus']) }}
                                @error('aplikasi_nama')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-4">
                                {{ Form::label('aplikasi_jenis', 'Jenis Aplikasi', ['class' => 'form-label']) }}
                                {{ Form::select('aplikasi_jenis', ['utama' => 'utama', 'lainnya' => 'lainnya'], $data['application']->aplikasi_jenis, ['placeholder' => 'Pilih Jenis Aplikasi', 'class' => $errors->has('aplikasi_jenis') ? 'form-select select2 is-invalid' : 'form-select select2', 'autocomplete'=>'aplikasi_jenis']) }}
                                @error('aplikasi_jenis')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-4">
                                {{ Form::label('aplikasi_kategori_id', 'Kategori Aplikasi', ['class' => 'form-label']) }}
                                {{ Form::select('aplikasi_kategori_id', $data['categories'], $data['application']->aplikasi_kategori_id, ['placeholder' => 'Pilih Kategori', 'class' => $errors->has('aplikasi_kategori_id') ? 'form-select select2 is-invalid' : 'form-select select2', 'autocomplete'=>'aplikasi_kategori_id']) }}
                                @error('aplikasi_kategori_id')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-4">
                                {{ Form::label('aplikasi_tautan', 'Tautan', ['class' => 'form-label']) }}
                                {{ Form::text('aplikasi_tautan', $data['application']->aplikasi_tautan, ['placeholder' => 'Tautan', 'class' => $errors->has('aplikasi_tautan') ? 'form-control is-invalid' : 'form-control', 'autocomplete'=>'aplikasi_tautan', 'autofocus'=>'autofocus']) }}
                                @error('aplikasi_tautan')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-4">
                                {{ Form::label('aplikasi_ikon', 'Ikon', ['class' => 'form-label']) }}
                                {{ Form::file('aplikasi_ikon', ['placeholder' => 'Ikon', 'class' => $errors->has('aplikasi_ikon') ? 'form-control dropify is-invalid' : 'form-control dropify', 'autocomplete'=>'aplikasi_ikon', 'autofocus'=>'autofocus', 'data-default-file' => asset("_uploads/ikon/{$data['application']->aplikasi_ikon}")]) }}
                                @error('aplikasi_ikon')
                                <div class="mt-1 text-danger">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-4">
                                {{ Form::label('aplikasi_ikon_normal', 'Ikon', ['class' => 'form-label']) }}
                                {{ Form::file('aplikasi_ikon_normal', ['placeholder' => 'Ikon', 'class' => $errors->has('aplikasi_ikon_normal') ? 'form-control dropify is-invalid' : 'form-control dropify', 'autocomplete'=>'aplikasi_ikon_normal', 'autofocus'=>'autofocus', 'data-default-file' => asset("_uploads/ikon/{$data['application']->aplikasi_ikon_normal}")]) }}
                                @error('aplikasi_ikon_normal')
                                <div class="mt-1 text-danger">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>

                    </div>

                    {{ Form::submit('Simpan', ['class' => 'btn btn-success waitme']) }}
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection