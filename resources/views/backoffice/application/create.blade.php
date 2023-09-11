@extends('layouts.dashboard')

@section('title', 'Tambah Aplikasi')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">@yield('title')</h3>
                </div>
                <div class="card-body">
                    {{ Form::open(['route' => 'aplikasi.store', 'method' => 'post', 'files' => true]) }}
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-4">
                                {{ Form::label('aplikasi_nama', 'Aplikasi', ['class' => 'form-label']) }}
                                {{ Form::text('aplikasi_nama', null, ['placeholder' => 'Aplikasi', 'class' => $errors->has('aplikasi_nama') ? 'form-control is-invalid' : 'form-control', 'autocomplete'=>'aplikasi_nama', 'autofocus'=>'autofocus']) }}
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
                                {{ Form::select('aplikasi_jenis', ['utama' => 'utama', 'lainnya' => 'lainnya'], null, ['placeholder' => 'Pilih Jenis Aplikasi', 'class' => $errors->has('aplikasi_jenis') ? 'form-select select2 is-invalid' : 'form-select select2', 'autocomplete'=>'aplikasi_jenis']) }}
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
                                {{ Form::select('aplikasi_kategori_id', $data['categories'], null, ['placeholder' => 'Pilih Kategori', 'class' => $errors->has('aplikasi_kategori_id') ? 'form-select select2 is-invalid' : 'form-select select2', 'autocomplete'=>'aplikasi_kategori_id']) }}
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
                                {{ Form::text('aplikasi_tautan', null, ['placeholder' => 'Tautan', 'class' => $errors->has('aplikasi_tautan') ? 'form-control is-invalid' : 'form-control', 'autocomplete'=>'aplikasi_tautan', 'autofocus'=>'autofocus']) }}
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
                                {{ Form::file('aplikasi_ikon', ['placeholder' => 'Ikon', 'class' => $errors->has('aplikasi_ikon') ? 'form-control dropify is-invalid' : 'form-control dropify', 'autocomplete'=>'aplikasi_ikon', 'autofocus'=>'autofocus']) }}
                                @error('aplikasi_ikon')
                                <div class="mt-1 text-danger">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-4">
                                {{ Form::label('aplikasi_ikon_normal', 'Ikon Normal', ['class' => 'form-label']) }}
                                {{ Form::file('aplikasi_ikon_normal', ['placeholder' => 'Ikon Normal', 'class' => $errors->has('aplikasi_ikon_normal') ? 'form-control dropify is-invalid' : 'form-control dropify', 'autocomplete'=>'aplikasi_ikon_normal', 'autofocus'=>'autofocus']) }}
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