<?php
namespace Util;
use Integration\DB;

/*Essential class on any page  when:  user is registeration, changing password,  profile update
 */

class Validate{
    private $_passed = false,
            $_errors = array(),
            $_db = null;
    //Called when validation class is instantiated to checking if instance of database connection already exists.
    public function __construct(){
        $this->_db = DB ::getInstance();
    }
    
    /*Passing in the data we want to loop through and check with an array of predefined rules against their provided sources
     * and add to the errors as we go
     */
    public function check($source, $items = array()){
        foreach($items as $item => $rules){
            foreach($rules as $rule => $rule_value){
                
                $value = trim($source[$item]);
                $item = escape($item);
                
                if($rule === 'required' && empty($value)){
                    $this->addError("{$item} is required");
                } else if(!empty($value)){
                    switch($rule){
                        case 'min':
                            if(strlen($value) < $rule_value){
                                $this->addError("{$item} must be a minimum of {$rule_value} characters.");
                            }
                            break;
                        case 'max':
                            if(strlen($value) > $rule_value){
                                $this->addError("{$item} must be a maximum of {$rule_value} characters.");
                            }
                            break;
                        case 'matches':
                            if($value != $source[$rule_value]){
                                $this->addError("{$rule_value} must match {$item}");
                            }
                            break;
                        case 'unique':
                            $check = $this ->_db ->get($rule_value, array($item, '=', $value));
                            if($check->count()){
                                $this->addError("{$item} already exists.");
                            }
                            break;
                            
                           case 'string':
                            if(!ctype_alnum($value)){
                               $this->addError("{$item} must only contain letters and/or numbers."); 
                            }
                            break;
                    }
                }
            }
        }
        if(empty($this->_errors)){
          $this->_passed = true;  
        }
        return $this;
    }
    private function addError($error){
       $this->_errors[] = $error;
    }
    public function errors() {
        return $this->_errors;
    }
    public function passed(){
        return $this->_passed;
    }
}



