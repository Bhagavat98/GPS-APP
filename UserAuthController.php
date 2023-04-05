<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use App\Helpers\Common;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class UserAuthController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //Log::useFiles(storage_path() . '/logs/' . 'unifiedmobapi-' . date('Y-m-d') . '.log', 'info');
    }
    /**
     * Function userRegister
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function userRegister(Request $request)
    {   
        try{
            $log_data = [];
            $log_data['function'] = 'userRegister()----------------';
            $log_data['request->all'] = $request->all();
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:255',
                'email' => 'required|email|unique:users',
                'mobile_no' => 'required|digits:10|unique:users,mobile_no',
                'date_of_birth' => 'required|date_format:Y-m-d',
                'address'=>'required',
                'gender' => 'required|in:m,f,o',
            ]);
            if($validator->fails()) // if validation error true
            {   
                $result["status"] = false;
                $result["responseMessage"] = Common::validationErrorsToString($validator->errors());
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
            // insert 
            $data['name'] = $request->name;
            $data['email'] = $request->email;
            $data['mobile_no'] = $request->mobile_no;
            $data['date_of_birth'] = $request->date_of_birth;
            $data['address'] = $request->address;
            $data['gender'] = $request->gender;
            $data['password'] = bcrypt($request->mobile_no);
            $data['user_type'] = "user";
            $user = User::create($data);

            if(!empty($user)  &&  isset($user)){
                $result["status"] = true;
                $result["responseMessage"] = "Account create Successfully";
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }else{
                $result["status"] = false;
                $result["responseMessage"] = "Something went wrong! #e1000";
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | userRegister()';
            Log::info($log_data);
            $result["status"] = true;
            $result["responseMessage"] = "Server Error! #e1001";
            return response($result,200);
        }
    }


    /**
     * Function login
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function loginWithOtp(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'loginWithOtp()----------------';
            $log_data['request->all'] = $request->all();
            $validator = Validator::make($request->all(), [
                'mobile_no' => 'required|digits:10|exists:users,mobile_no',
            ]);
            if($validator->fails()) // if validation error true
            {   
                $result["status"] = false;
                $result["responseMessage"] = Common::validationErrorsToString($validator->errors());
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
            // check mobile no 
            $userDetails = User::where("status","1")
            ->where("mobile_no",$request->mobile_no)
            ->first();

            if(!empty($userDetails)  &&  isset($userDetails)){

                $otp = 123456;//rand(100000, 999999); // randm otp
                $message = 'Welcome to Company, Use this OTP '.$otp.' to confirm your Company account request.';
                $isSuccess = Common::sendSmsApi($message,$userDetails->mobile_no);
                // new otp save
                $insertOtp = DB::table('otp_verification')
                ->insertGetId([
                    'otp' => $otp,
                    'mobile_no' => $userDetails->mobile_no,
                    'created_at' => date('Y-m-d H:i:s'), 
                    'updated_at' => date('Y-m-d H:i:s'),
                ]);
                $log_data["isSuccess"] = $isSuccess;
                $log_data["insertOtp"] = $insertOtp;
                // otp send u mobile no.
                if(isset($insertOtp)  &&  isset($isSuccess)){
                    $result["status"] = true;
                    $result["responseMessage"] = "otp has been sent to your registered mobile no.";
                    $log_data["result"] = $result;
                    Log::info($log_data);
                    return response($result,200);
                }else{
                    $result["status"] = false;
                    $result["responseMessage"] = "Something went wrong! #e1002";
                    $log_data["result"] = $result;
                    Log::info($log_data);
                    return response($result,200);
                }
            }else{
                $result["status"] = false;
                $result["responseMessage"] = "Something went wrong! #e1003";
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | loginWithOtp()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }


    /**
     * Function verifyOtp
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function verifyOtp(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'verifyOtp()----------------';
            $log_data['request->all'] = $request->all();
            $validator = Validator::make($request->all(), [
                'mobile_no' => 'required|digits:10|exists:users,mobile_no',
                'otp' => 'required|digits:6',
            ]);
            if($validator->fails()) // if validation error true
            {   
                $result["status"] = false;
                $result["responseMessage"] = Common::validationErrorsToString($validator->errors());
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
           
            //check otp verification 
            $last2MintAgoDateTime = date("Y-m-d H:i:s", strtotime('-2 minutes'));
            $verification = DB::table('otp_verification')
            ->where('mobile_no',$request->mobile_no)
            ->where('otp',$request->otp)
            ->where('status',"1")
            // ->where('created_at', '>=', $last2MintAgoDateTime)
            // ->where('created_at', '<=', date("Y-m-d H:i:s"))
            ->orderBy('id', 'desc')
            ->first();
            if(!empty($verification)   &&  isset($verification)){
                // update otp_verification table
                $verificationAff = DB::table('otp_verification')
                ->where('id',$verification->id)
                ->update([
                    "status"=>"0",
                    "updated_at"=>date("Y-m-d H:i:s"),
                ]);
                $log_data["verificationAff"] = $verificationAff;

                // get user Details
                $userDetails = User::where("status","1")
                ->select('id', 'name', 'email', 'mobile_no', 'date_of_birth', 'address', 'gender','user_type','activate_free_trial', 'activate_free_trial_status')
                ->where("mobile_no",$request->mobile_no)
                ->where("status","1")
                ->first();
                // create token
                $accessToken = $userDetails->createToken('TutsForWeb')->accessToken;
                //$accessToken = $user->createToken('API Token')->accessToken;

                $result["status"] = true;
                $result["data"] = [
                    "userDetails"=>$userDetails,
                    'accessToken' => $accessToken,
                    'tokenType' => 'bearer',
                ];
                $result["responseMessage"] = "login successful";
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }else{
                $result["status"] = false;
                $result["responseMessage"] = "OTP is invalid! #e1003";
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | verifyOtp()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }

    /**
     * Function addBusiness
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function addBusiness(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'addBusiness()----------------';
            $log_data['request->all'] = $request->all();
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:255',
                'city' => 'required|max:255',
                'state' => 'required|max:255',
                'landmark' => 'required|max:255',
                'category'=>'required',
            ]);
            if($validator->fails()) // if validation error true
            {   
                $result["status"] = false;
                $result["responseMessage"] = Common::validationErrorsToString($validator->errors());
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
            
            // insert 
            $insertData = [];
            $insertData['name'] = $request->name;
            $insertData['city'] = $request->city;
            $insertData['state'] = $request->state;
            $insertData['landmark'] = $request->landmark;
            $insertData['category'] = $request->category;
            $insertData['user_id'] = auth()->user()->id;
            $insertData['last_updated_by'] = auth()->user()->id;
            $insertData['status'] = "1";
            $insertData['created_at'] = date('Y-m-d H:i:s');
            $insertData['updated_at'] = date('Y-m-d H:i:s');

            // insert new business
            $insertBusinessId = DB::table('business')
            ->insertGetId($insertData);
            $log_data["insertBusinessId"] = $insertBusinessId;

            if(!empty($insertBusinessId)   &&  isset($insertBusinessId)){
                $result["status"] = true;
                $result["responseMessage"] = "Business added successful";
            }else{
                $result["status"] = false;
                $result["responseMessage"] = "Something went wrong!! #e1022";
            }

            $log_data["result"] = $result;
            Log::info($log_data);
            return response($result,200);
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | addBusiness()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }

    /**
     * Function updateBusiness
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function updateBusiness(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'updateBusiness()----------------';
            $log_data['request->all'] = $request->all();
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:255',
                'city' => 'required|max:255',
                'state' => 'required|max:255',
                'landmark' => 'required|max:255',
                'category'=>'required',
            ]);
            if($validator->fails()) // if validation error true
            {   
                $result["status"] = false;
                $result["responseMessage"] = Common::validationErrorsToString($validator->errors());
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
            
            // insert 
            $updateData = [];
            $updateData['name'] = $request->name;
            $updateData['city'] = $request->city;
            $updateData['state'] = $request->state;
            $updateData['landmark'] = $request->landmark;
            $updateData['category'] = $request->category;
            $updateData['user_id'] = auth()->user()->id;
            $updateData['last_updated_by'] = auth()->user()->id;
            $updateData['status'] = "1";
            //$updateData['created_at'] = date('Y-m-d H:i:s');
            $updateData['updated_at'] = date('Y-m-d H:i:s');

            // update new business
            $updateDataBusinessId = DB::table('business')
            ->where("id",$request->business_id)
            ->where("user_id",auth()->user()->id)
            ->update($updateData);
            $log_data["updateDataBusinessId"] = $updateDataBusinessId;

            if(!empty($updateDataBusinessId)   &&  isset($updateDataBusinessId)){
                $result["status"] = true;
                $result["responseMessage"] = "Business update successful";
            }else{
                $result["status"] = false;
                $result["responseMessage"] = "Something went wrong!! #e1022";
            }

            $log_data["result"] = $result;
            Log::info($log_data);
            return response($result,200);
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | updateBusiness()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }


    /**
     * Function getBusiness
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function getBusiness(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'getBusiness()----------------';
            $log_data['request->all'] = $request->all();
            
            // business Details
            $businessDetails = DB::table('business')
            ->select('id as business_id','name', 'city', 'state', 'landmark', 'category')
            ->where("user_id",auth()->user()->id)
            ->where("status","1")
            ->get();
            
            $result["status"] = true;
            $result["data"] = $businessDetails;
            $result["responseMessage"] = "Business fetch successfully";
            $log_data["result"] = $result;
            Log::info($log_data);
            return response($result,200);
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | getBusiness()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }


    /**
     * Function addSubUser
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function addSubUser(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'addSubUser()----------------';
            $log_data['request->all'] = $request->all();
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:255',
                'address'=>'required',
                'age' => 'required',
                'role' => 'required',
                'gender' => 'required|in:m,f,o',
                'email' => 'required|email|unique:users',
                'mobile_no' => 'required|digits:10|unique:users,mobile_no',
            ]);
            if($validator->fails()) // if validation error true
            {   
                $result["status"] = false;
                $result["responseMessage"] = Common::validationErrorsToString($validator->errors());
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
            
            // insert 
            $insertData = [];
            $insertData['name'] = $request->name;
            $insertData['address'] = $request->address;
            $insertData['age'] = $request->age;
            $insertData['role'] = $request->role;
            $insertData['gender'] = $request->gender;
            $insertData['email'] = $request->email;
            $insertData['mobile_no'] = $request->mobile_no;
            $insertData['password'] = bcrypt($request->mobile_no);
            $insertData['user_type'] = "subUser";
            $insertData['status'] = "1";
            $insertData['user_id'] = auth()->user()->id;
            $insertData['created_at'] = date('Y-m-d H:i:s');
            $insertData['updated_at'] = date('Y-m-d H:i:s');

            $user = User::create($insertData);

            if(!empty($user)  &&  isset($user)){
                $result["status"] = true;
                $result["responseMessage"] = "Sub User create Successfully";
            }else{
                $result["status"] = false;
                $result["responseMessage"] = "Something went wrong! #e1000";
            }

            $log_data["result"] = $result;
            Log::info($log_data);
            return response($result,200);
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | addSubUser()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }

    /**
     * Function updateSubUser
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function updateSubUser(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'updateSubUser()----------------';
            $log_data['request->all'] = $request->all();
            $validator = Validator::make($request->all(), [
                'sub_user_id' => 'required',
                'name' => 'required|max:255',
                'address'=>'required',
                'age' => 'required',
                'role' => 'required',
                'gender' => 'required|in:m,f,o',
                'email' => 'required|email|unique:users,email,'.$request->sub_user_id,
                'mobile_no' => 'required|unique:users,mobile_no,'.$request->sub_user_id,
            ]);
            if($validator->fails()) // if validation error true
            {   
                $result["status"] = false;
                $result["responseMessage"] = Common::validationErrorsToString($validator->errors());
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
            // update user
            $updateData = [];
            $updateData['name'] = $request->name;
            $updateData['address'] = $request->address;
            $updateData['age'] = $request->age;
            $updateData['role'] = $request->role;
            $updateData['gender'] = $request->gender;
            $updateData['email'] = $request->email;
            $updateData['mobile_no'] = $request->mobile_no;
            //$updateData['user_type'] = "subUser";
            $updateData['status'] = "1";
            $updateData['created_at'] = date('Y-m-d H:i:s');
            $updateData['updated_at'] = date('Y-m-d H:i:s');

            // update new business
            $updateDataBusinessId = DB::table('users')
            ->where("id",$request->sub_user_id)
            ->update($updateData);
            $log_data["updateDataBusinessId"] = $updateDataBusinessId;

            if(!empty($updateDataBusinessId)   &&  isset($updateDataBusinessId)){
                $result["status"] = true;
                $result["responseMessage"] = "sub user update successful";
            }else{
                $result["status"] = false;
                $result["responseMessage"] = "Something went wrong!! #e1022";
            }

            $log_data["result"] = $result;
            Log::info($log_data);
            return response($result,200);
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | updateSubUser()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }


    /**
     * Function geSubUser
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function getSubUser(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'getSubUser()----------------';
            $log_data['request->all'] = $request->all();
            
            // sub Users Details
            $subUsersDetails = DB::table('users')
            ->select('id as sub_user_id','name', 'email', 'mobile_no', 'address', 'gender', 'age',  'role')
            ->where("user_id",auth()->user()->id)
            ->where("user_type","subUser")
            ->where("status","1")
            ->get();

            $result["status"] = true;
            $result["data"] = $subUsersDetails;
            $result["responseMessage"] = "sub user fetch successfully";
            $log_data["result"] = $result;
            Log::info($log_data);
            return response($result,200);
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | getSubUser()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }


    /**
     * Function activateFreeTrial
     * @access  Public
     * @package User Auth Controller Controller
     * @bhagavt
     * @param array
     * @return array
    */
    public function activateFreeTrial(Request $request)
    {
        try{
            $log_data = [];
            $log_data['function'] = 'activateFreeTrial()----------------';
            $log_data['request->all'] = $request->all();
            $validator = Validator::make($request->all(), [
                'business_id' => 'required',
            ]);
            if($validator->fails()) // if validation error true
            {   
                $result["status"] = false;
                $result["responseMessage"] = Common::validationErrorsToString($validator->errors());
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }
            
            // check already used or not
            if(!empty(auth()->user()->activate_free_trial)  &&  isset(auth()->user()->activate_free_trial_status)){
                $result["status"] = false;
                $result["responseMessage"] = "your have already activat free trial";
                $log_data["result"] = $result;
                Log::info($log_data);
                return response($result,200);
            }

            $updateData = [];
            $updateData['activate_free_trial'] = date("Y-m-d H:i:s", strtotime("+ 10 day"));
            $updateData['activate_free_trial_status'] = 'active';
            $updateData['updated_at'] = date('Y-m-d H:i:s');

            // update activate_free_trial in users table
            $updateDataUsersId = DB::table('users')
            ->where("id",auth()->user()->id)
            ->update($updateData);
            $log_data["updateDataUsersId"] = $updateDataUsersId;

            if(!empty($updateDataUsersId)   &&  isset($updateDataUsersId)){
                $result["status"] = true;
                $result["responseMessage"] = "Your Free Trial activate successful";
            }else{
                $result["status"] = false;
                $result["responseMessage"] = "Something went wrong!! #e1022";
            }

            $log_data["result"] = $result;
            Log::info($log_data);
            return response($result,200);
        }catch(\Exception $ex) {
            $log_data['ServiceError'] = 'errorMessage( '.$ex->getMessage().' ) | errorLine( '.$ex->getLine().' ) | errorFile( '.$ex->getFile().' ) | activateFreeTrial()';
            Log::info($log_data);
            $result["status"] = false;
            $result["responseMessage"] = "Server Error! #e1000";
            return response($result,200);
        }
    }





    


}