<?php

namespace App\Http\Controllers\Backoffice;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backoffice\InformationRequest;
use App\Models\Backoffice\Information;
use Illuminate\Http\Request;
use DataTables;
use Harimayco\Menu\Models\Menus;
use Illuminate\Support\Facades\Auth;

class InformationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Information::select('informasi_id', 'informasi_judul', 'informasi_deskripsi', 'pengguna_nama')
                ->join('pengguna', 'informasi.informasi_dibuat_pengguna_id', '=', 'pengguna.pengguna_id');

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('actions', function ($data) {
                    $btn = "<div class='text-center'>";
                    if (PermissionMenu()[0]->groups->filter(function ($item) {
                        return $item->grup_id == Auth::user()->groups[0]->grup_id;
                    })->flatten()[0]->pivot->grup_menu_item_ubah == 'ya') $btn .= "<a class='btn btn-sm btn-primary w-100 mb-1 waitme' href='" . route('informasi.edit', $data->informasi_id) . "'><i class='fas fa-edit'></i></a>";
                    if (PermissionMenu()[0]->groups->filter(function ($item) {
                        return $item->grup_id == Auth::user()->groups[0]->grup_id;
                    })->flatten()[0]->pivot->grup_menu_item_hapus == 'ya') $btn .= "<button type='submit' class='btn btn-sm btn-danger w-100 mb-1 destroy' id='" . route('informasi.destroy', $data->informasi_id) . "'><i class='fa fa-trash destroy' id='" . route('informasi.destroy', $data->informasi_id) . "'></i></button>";
                    if ($btn == "<div class='text-center'>") $btn .= '-';
                    $btn .= '</div>';

                    return $btn;
                })
                ->rawColumns(['actions'])
                ->make(true);
        }

        $data = [
            'menus' => Menus::where('menu_nama', 'Sidebar')->first()->items()->whereRelation('groups', 'grup_menu_item_grup_id', '=', Auth::user()->groups[0]->grup_id)->get()
        ];

        return view('backoffice.information.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = [
            'menus' => Menus::where('menu_nama', 'Sidebar')->first()->items()->whereRelation('groups', 'grup_menu_item_grup_id', '=', Auth::user()->groups[0]->grup_id)->get()
        ];

        return view('backoffice.information.create', compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(InformationRequest $request)
    {
        $data = $request->all();

        $data['informasi_dibuat_pengguna_id'] = Auth::user()->pengguna_id;

        Information::create($data);
        return redirect()->route('informasi.index')->with('success', 'Data berhasil ditambahkan!');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Information $information)
    {
        $data = [
            'menus' => Menus::where('menu_nama', 'Sidebar')->first()->items()->whereRelation('groups', 'grup_menu_item_grup_id', '=', Auth::user()->groups[0]->grup_id)->get(),
            'information' => $information
        ];

        return view('backoffice.information.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(InformationRequest $request, Information $information)
    {
        $data = $request->all();

        Information::findOrFail($information->informasi_id)
            ->update($data);

        return redirect()->route('informasi.index')->with('success', 'Data berhasil diubah!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Information::destroy($id);

        return response()->json(['success' => 'Data berhasil dihapus!']);
    }
}
