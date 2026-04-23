<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Pharmacy;
use Illuminate\Http\Request;
use App\Models\AccountDetail;
use App\Mail\RegisterPharmacy;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class PharmacyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Pharmacy::orderBy('id', 'DESC')->get();
        // return $data;
        return view('admin.pharmacy.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.pharmacy.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return $request;
        $request->validate([
            'branch_name' => 'required',
            'email' => 'required|unique:pharmacies',
            'branch_no' => 'required',
            'address' => 'required',
            'license' => 'required',
            'phone_no' => 'required',
            'opening_time' => 'required',
            'closing_time' => 'required',
        ]);

        $password = random_int(10000000, 99999999);
        $hashedPassword = Hash::make($password);
        $pharmacyData['status'] = 'active'; // Set status as "active"
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move(public_path('admin/assets/images/users/'), $filename);
            $image = 'public/admin/assets/images/users/' . $filename;
            // return $image;
        } else {
            $image = 'public/admin/assets/images/users/1687245386.jpg';
        }
        $openingTime = Carbon::createFromFormat('H:i', $request->opening_time)->format('h:i A');
        $closingTime = Carbon::createFromFormat('H:i', $request->closing_time)->format('h:i A');
        $pharmacyData = $request->all();
        // return $pharmacyData;
        $pharmacyData['password'] = $hashedPassword;
        $pharmacyData['is_active'] = '1';
        $pharmacyData['image'] = $image;
        $pharmacyData['opening_time'] = $openingTime; // Save the formatted time
        $pharmacyData['closing_time'] = $closingTime;
        $pharmacy = Pharmacy::create($pharmacyData);

        $message['name'] = $request->branch_name;
        $message['email'] = $request->email;
        $message['latitude'] = $request->latitude;
        $message['longitude'] = $request->longitude;
        $message['password'] = $password;

        try {
            Mail::to($request->email)->send(new RegisterPharmacy($message));
            return redirect()->route('pharmacy.index')->with(['status' => true, 'message' => 'Created Successfully']);
        } catch (\Throwable $th) {
            dd($th->getMessage());
            return back()->with(['status' => false, 'message' => $th->getMessage()]);
        }

    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $pharmacy = Pharmacy::with('accountDetail')->find($request->id);
        // return $pharmacy;
        $pharmacies = view('admin.pharmacy.model', compact('pharmacy'))->render();
        return response()->json($pharmacies);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Pharmacy::find($id);
        return view('admin.pharmacy.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'branch_name' => 'required',
            'email' => 'required',
            'branch_no' => 'required',
            'address' => 'required',
            'license' => 'required',
            'phone_no' => 'required',
            'opening_time' => 'required',
            'closing_time' => 'required',

        ]);
        // return $request;

        $data = Pharmacy::find($id);
        $data->branch_name = $request->input('branch_name');
        $data->email = $request->input('email');
        $data->branch_no = $request->input('branch_no');
        $data->address = $request->input('address');
        $data->license = $request->input('license');
        $data->phone_no = $request->input('phone_no');
        $data->latitude = $request->input('latitude');
        $data->longitude = $request->input('longitude');
        $data->opening_time = $request->input('opening_time');
        $data->closing_time = $request->input('closing_time');

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move(public_path('admin/assets/images/users/'), $filename);
            $data->image = 'public/admin/assets/images/users/' . $filename;
        }
        $data->save();
        return redirect()->route('pharmacy.index')->with(['status' => true, 'message' => 'Updated Successfully']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Pharmacy::destroy($id);
        return redirect()->back()->with(['status' => true, 'message' => 'Deleted Successfully']);
    }

    public function status($id)
    {
        $data = Pharmacy::find($id);
        $data->update(['is_active' => $data->is_active == 0 ? '1' : '0']);
        return redirect()->back()->with(['status' => true, 'message' => 'Updated Successfully']);
    }
}
