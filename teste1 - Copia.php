<?php
         $dbhost = 'localhost';
         $dbuser = 'root';
         $dbpass = '';
         $dbbanco = 'tarefas';
         //$conn = mysqli('localhost','root','','tarefas');


         $mysqli = new mysqli("$dbhost","$dbuser","$dbpass","$dbbanco");

         // Check connection
         if ($mysqli -> connect_errno) {
           echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
           exit();
         }else{
            echo 'Connected successfully';
         }
         
         mysqli_close($mysqli);
      ?>