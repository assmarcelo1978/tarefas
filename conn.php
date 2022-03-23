<?php
         $dbhost = 'localhost';
         $dbuser = 'root';
         $dbpass = '';
         $dbbanco = 'tarefas';
         

         $mysqli = new mysqli("$dbhost","$dbuser","$dbpass","$dbbanco");

         // Check connection
         if ($mysqli -> connect_errno) {
           echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
           exit();
         }else{
           // echo 'Connected successfully';
         }


         //Define tempo de sessão para (x) minutos
         $cache_expire = session_cache_expire(30);
         //echo "As sessões em cache irão expirar em $cache_expire minutos";
         //echo "<br> A Sessão está $status"
         
                  
         //Inicia a sessão
         session_start();
         
         //Fecha a sessão - ou deveria fechar
         mysqli_close($mysqli); // nao fecha a sessão???
         
         //Status da sessão
         $status = session_status();
         


      ?>