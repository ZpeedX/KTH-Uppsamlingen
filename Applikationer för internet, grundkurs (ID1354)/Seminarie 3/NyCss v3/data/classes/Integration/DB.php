<?php
namespace Integration;
use Integration\Config;


/* DB class working togther with user class and the database 
 * Using a main static;getInstance since its a singleton design pattern. 
 * Helps to get instance of  DB if already instantiated and thereby 
 * prevent persistent connection to the Database on each page
 */



/*helps to store an instance of the database and return it if it exists.
 * _pdo - represents instanciation of pdo object for re use.
 * _query- The last executed query
 * __error - cheching whether the query activated or not
 * __results - retuirning the results from the query
 * __count - counting the results
 */
class DB{
    private static $_instance = null;
    private $_pdo, 
            $_query,
            $_error = false,
            $_results,
            $_count = 0;
    
    
    /*Connecting to the Database
     * Runs each time this class is instantiated
     */
    private function __construct(){
        try{
            $this->_pdo = new \PDO('mysql:host=' . Config::get('mysql/host') . ';dbname=' . Config::get('mysql/db') , 
                                                                        Config::get('mysql/username'), Config::get('mysql/password'));
            } catch (PDOException $e) {
            die($e->getMessage());
        }
      
    }
    /*Checking if we've already instantoiated the object. 
     * Return instance if already instantiated otherwise instantiate.
     */
    public static function getInstance(){
        if(!isset(self::$_instance)){
            self::$_instance = new DB();
        }
        return self::$_instance;
    }
   
    /* Query the datatabase 
     * 
     */
    public function query($sql, $params = array()){
        $this->_error = false;
        if($this->_query = $this->_pdo->prepare($sql)){
            $x = 1;
            if(count($params)){
                foreach($params as $param){
                    $this->_query->bindValue($x, $param);
                    $x++;
                }
            }
            if($this->_query->execute())
            {
                $this->_results =$this->_query->fetchAll(\PDO::FETCH_OBJ);
                $this->_count = $this->_query->rowCount();
            } else {
               $this->_error = true; 
            }
        }
        return $this;
    }
    
    //Helping to speed up querries 
    public function action($action, $table, $where = array()){
       if(count($where) === 3){
           $operators = array ('=', '>', '<', '>=', '<=');
           
           $field    = $where[0];
           $operator = $where[1];
           $value    = $where[2];
           
           if(in_array($operator, $operators)){
               $sql = "{$action} FROM {$table} WHERE {$field} {$operator} ?"; 
               if(!$this->query($sql, array($value))->error()){
                   return $this;
               }
           }
       }
       return false;
    }
    
    //Fetching from the database with help from the action function above
    public function get($table, $where){
        return $this->action('SELECT *', $table, $where);
    }
    //Fetching from the database with help from the query function
        public function gets($table){
        return $this->_pdo->query('SELECT * FROM ' . $table);
    }
    
    public function delete($table, $where = array()){
        return $this->action('DELETE', $table, $where);
    }
    
    //Inserting new data into database 
    public function insert($table, $fields = array()){
          $keys = array_keys($fields);
          $values = '';
          $x = 1;       
          foreach($fields as $field){
              $values .= '?';
              if($x < count($fields)){
                  $values .= ', ';
              }
             $x++;
          }       
          $sql = "INSERT INTO {$table} (" . implode(', ', $keys) . ") VALUES ({$values})";
          
     
          if(!$this->query($sql, $fields)->error()){
              return true;
          }
       
        return false;
    }
    
    //Updating the database
    
    public function update($table, $id, $fields) {
        $set = '';
        $x = 1;
        
        foreach($fields as $name => $value){
            $set .= "{$name} = ?";
            if($x < count($fields)){
                $set .= ', ';
            }
            $x++;
        }
        
        $sql = "UPDATE {$table} SET {$set} WHERE id = {$id}";

  
         if(!$this->query($sql, $fields)->error()){
            return true;
          }
        return false;
    }
    
    //Retrieving query results
    public function results(){
        return $this->_results;
    }
    
    //Helps return first query results
    public function first(){
       return $this->results()[0];
    }  
    
    //Checking for query errors
    public function error(){
        return $this->_error;
    }
    
    public function count(){
        return $this->_count;
    }
}
