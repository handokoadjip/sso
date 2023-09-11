<?php

namespace App\Http\Controllers\Backoffice;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backoffice\ApplicationRequest;
use App\Models\Backoffice\Application;
use App\Models\Backoffice\Category;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\File;
use Harimayco\Menu\Models\Menus;
use Illuminate\Support\Facades\Auth;

class ApplicationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Application::select('aplikasi_id', 'aplikasi_nama', 'aplikasi_ikon', 'aplikasi_tautan', 'aplikasi_jenis', 'pengguna_nama')
                ->join('kategori', 'aplikasi.aplikasi_kategori_id', '=', 'kategori.kategori_id')
                ->join('pengguna', 'kategori.kategori_dibuat_pengguna_id', '=', 'pengguna.pengguna_id');

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('application', function ($data) {
                    return "<a href='{$data->aplikasi_tautan}' target='_blank'>{$data->aplikasi_nama}</a>";
                })
                ->addColumn('actions', function ($data) {
                    $btn = "<div class='text-center'>";
                    if (PermissionMenu()[0]->groups->filter(function ($item) {
                        return $item->grup_id == Auth::user()->groups[0]->grup_id;
                    })->flatten()[0]->pivot->grup_menu_item_ubah == 'ya') $btn .= "<a class='btn btn-sm btn-primary w-100 mb-1 waitme' href='" . route('aplikasi.edit', $data->aplikasi_id) . "'><i class='fas fa-edit'></i></a>";
                    if (PermissionMenu()[0]->groups->filter(function ($item) {
                        return $item->grup_id == Auth::user()->groups[0]->grup_id;
                    })->flatten()[0]->pivot->grup_menu_item_hapus == 'ya') $btn .= "<button type='submit' class='btn btn-sm btn-danger w-100 mb-1 destroy' id='" . route('aplikasi.destroy', $data->aplikasi_id) . "'><i class='fa fa-trash destroy' id='" . route('aplikasi.destroy', $data->aplikasi_id) . "'></i></button>";
                    if ($btn == "<div class='text-center'>") $btn .= '-';
                    $btn .= '</div>';

                    return $btn;
                })
                ->rawColumns(['application', 'actions'])
                ->make(true);
        }

        $data = [
            'menus' => Menus::where('menu_nama', 'Sidebar')->first()->items()->whereRelation('groups', 'grup_menu_item_grup_id', '=', Auth::user()->groups[0]->grup_id)->get()
        ];

        return view('backoffice.application.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = [
            'menus' => Menus::where('menu_nama', 'Sidebar')->first()->items()->whereRelation('groups', 'grup_menu_item_grup_id', '=', Auth::user()->groups[0]->grup_id)->get(),
            'categories' => Category::pluck('kategori_nama', 'kategori_id'),
        ];

        return view('backoffice.application.create', compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ApplicationRequest $request)
    {
        $data = $request->all();

        if ($request->file('aplikasi_ikon')) {
            $filename = time() . '_IKON.' . $request->aplikasi_ikon->extension();
            $request->aplikasi_ikon->move(public_path('_uploads/ikon'), $filename);
            $data['aplikasi_ikon'] = $filename;
        }

        if ($request->file('aplikasi_ikon_normal')) {
            $filename = time() . '_IKON_NORMAL.' . $request->aplikasi_ikon_normal->extension();
            $request->aplikasi_ikon_normal->move(public_path('_uploads/ikon'), $filename);
            $data['aplikasi_ikon_normal'] = $filename;
        }

        $data['aplikasi_dibuat_pengguna_id'] = Auth::user()->pengguna_id;

        Application::create($data);
        return redirect()->route('aplikasi.index')->with('success', 'Data berhasil ditambahkan!');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Application $application)
    {
        $data = [
            'menus' => Menus::where('menu_nama', 'Sidebar')->first()->items()->whereRelation('groups', 'grup_menu_item_grup_id', '=', Auth::user()->groups[0]->grup_id)->get(),
            'categories' => Category::pluck('kategori_nama', 'kategori_id'),
            'application' => $application,
        ];

        return view('backoffice.application.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ApplicationRequest $request, Application $application)
    {
        $data = $request->all();

        if ($request->file('aplikasi_ikon')) {
            if (File::exists(public_path("_uploads/ikon/{$application->aplikasi_ikon}")) && $application->aplikasi_ikon != 'default.jpg') File::delete(public_path("_uploads/ikon/{$application->aplikasi_ikon}"));

            $filename = time() . '_IKON.' . $request->aplikasi_ikon->extension();
            $request->aplikasi_ikon->move(public_path('_uploads/ikon'), $filename);
            $data['aplikasi_ikon'] = $filename;
        }

        if ($request->file('aplikasi_ikon_normal')) {
            if (File::exists(public_path("_uploads/ikon/{$application->aplikasi_ikon_normal}")) && $application->aplikasi_ikon_normal != 'default.jpg') File::delete(public_path("_uploads/ikon/{$application->aplikasi_ikon_normal}"));

            $filename = time() . '_IKON_NORMAL.' . $request->aplikasi_ikon_normal->extension();
            $request->aplikasi_ikon_normal->move(public_path('_uploads/ikon'), $filename);
            $data['aplikasi_ikon_normal'] = $filename;
        }

        Application::findOrFail($application->aplikasi_id)
            ->update($data);

        return redirect()->route('aplikasi.index')->with('success', 'Data berhasil diubah!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $application = Application::findOrFail($id);
        if (File::exists(public_path("_uploads/ikon/{$application->aplikasi_ikon}")) && $application->aplikasi_ikon != 'default.jpg') File::delete(public_path("_uploads/ikon/{$application->aplikasi_ikon}"));
        if (File::exists(public_path("_uploads/ikon/{$application->aplikasi_ikon_normal}")) && $application->aplikasi_ikon_normal != 'default.jpg') File::delete(public_path("_uploads/ikon/{$application->aplikasi_ikon_normal}"));

        Application::destroy($id);

        return response()->json(['success' => 'Data berhasil dihapus!']);
    }
}
