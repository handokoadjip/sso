@extends('layouts.dashboard')

@section('title', 'Tambah Informasi')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">@yield('title')</h3>
                </div>
                <div class="card-body">
                    {{ Form::open(['route' => 'informasi.store', 'method' => 'post']) }}
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-4">
                                {{ Form::label('informasi_judul', 'Judul', ['class' => 'form-label']) }}
                                {{ Form::text('informasi_judul', null, ['placeholder' => 'Judul', 'class' => $errors->has('informasi_judul') ? 'form-control is-invalid' : 'form-control', 'autocomplete'=>'informasi_judul', 'autofocus'=>'autofocus']) }}
                                @error('informasi_judul')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-4">
                                {{ Form::label('informasi_deskripsi', 'Deskripsi', ['class' => 'form-label']) }}
                                {{ Form::text('informasi_deskripsi', null, ['placeholder' => 'Deskripsi', 'class' => $errors->has('informasi_deskripsi') ? 'form-control is-invalid' : 'form-control', 'autocomplete'=>'informasi_deskripsi']) }}
                                @error('informasi_deskripsi')
                                <div class="invalid-feedback">
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