<?php
namespace Model;
use Integration\DB;
use Integration\Config;
use Util\Session;
use Util\Cookie;
use Util\Hash;

/* User class for login,register, update details, check if user exists.
 * Begin by outlying the user class
 */
class User{
    private $_db,
            $_data,
            $_sessionName,
            $_cookieName,
            $_isLoggedIn = false;
    
    /* Constructor function to connect to database.
     * Private method __construct is run each time the class is instantiated
     */
     public function __construct($user = null){ //defining if we want to pass in a used value or not
        $this->_db = DB::getInstance(); // So we can make use of the database
        
        $this->_sessionName = Config::get('session/session_name');
        $this->_cookieName  = Config::get('remember/cookie_name');
        
        if(!$user){
            if(Session::exists($this->_sessionName)){
                $user = Session::get($this->_sessionName);
                
                if($this->find($user)){
                    $this->_isLoggedIn = true;
                } 
            }
        } else {
            $this -> find($user);
        }
    }
    
   //Calling the update methods on the database  objects 
    
    public function update($fields = array(), $id = null){
        
        if(!$id && $this->isLoggedIn()) {
            $id = $this->data()->id;
        }

        if(!$this->_db->update('comments', $id, $fields)){
            throw new Exception('There was a problem updating.');
        }
    }
    
    
    //The ability to create a user
    public function create($fields = array()){
        if(!$this->_db->insert('users', $fields)){
            throw new Exception('There was a problem creating an account.');
        }
    }
    
    //This will help find user by ID as well instead of just username
    public function find($user = null){
        if($user){
            $field = (is_numeric($user)) ? 'id' : 'username';
            $data = $this->_db->get('users', array($field, '=', $user));
            
            if($data->count()){
                $this->_data = $data->first();
                return true;
            }
        }
        return false;
    }
        public function available($user = null){
        if($user){
            $data = $this->_db->get('users', array('username', '=', $user));
            
            if($data->count()){
                $this->_data = $data->first();
                return true;
            }
        }
        return false;
    }
    
    //Login the user in
    public function login($username = null, $password = null, $remember = false){ //checking if username and password are set

        if(!$username && !$password && $this->exists()){
         Session::put($this->_sessionName, $this->data()->id);
         $this->_isLoggedIn = true;
        }else{
        $user = $this->find($username);
        
        if($user){
            if($this->data()->password === Hash::make($password, $this->data()->salt)){
                Session::put($this->_sessionName, $this->data()->id); 
                
                if($remember){
                    $hash = Hash::unique();
                    $hashCheck = $this->_db->get('users_session', array('user_id', '=', $this->data()->id));
                
                  if(!$hashCheck->count()){
                      $this->_db->insert('users_session', array(
                          'user_id' => $this->data()->id,
                          'hash' => $hash     
                      ));
                  } else {
                      $hash = $hashCheck->first()->hash;
                  }
                  
                  Cookie::put($this->_cookieName, $hash, Config::get('remember/cookie_expiry'));
                  
                }
                
                return true;
            }
          }
        }
        return false;
    }
    
   /* public function hasPremission($key){
        $group = $this->_db->get('groups', array('id', '=', $this->data()->groups));
        
        if($group->count()){
            $premissions = json_decode($group->first()->premissions, true);
            
            if($premissions[$key] == true){
                return true;
            }
        }
        return false;
    }*/
    
    public function exists(){
        return (!empty($this->_data)) ? true : false;
    }

    public function logout(){
        if(Session::exists($this->_sessionName)){
        $this->_db->delete('users_session', array('user_id', '=', $this->data()->id));
        Session::delete($this->_sessionName);
        Cookie::delete($this->_cookieName);
        }
    }
    // Basically to avoid referencing _data above all the time
    public function data(){
        return $this->_data;
    }
    
    //Checking if user is logged in
    public function isLoggedIn(){
        return $this->_isLoggedIn;
    }
}
