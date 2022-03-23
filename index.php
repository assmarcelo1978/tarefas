<?php
         //definição de variáveis para conexão com DB
         $dbhost = 'localhost';
         $dbuser = 'root';
         $dbpass = '';
         $dbbanco = 'tarefas';
         //$conn = mysqli('localhost','root','','tarefas');

         //Executa conexão com DB
         $mysqli = new mysqli("$dbhost","$dbuser","$dbpass","$dbbanco");

         // Checa conexão
         if ($mysqli -> connect_errno) {
           echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
           exit();
         }else{
            echo 'Connectado com sucesso <br>';
         }
         
// Define o limitador de cache para 'private'
//session_cache_limiter('private');
$cache_limiter = session_cache_limiter();

// Define o limite de tempo do cache em 30 minutos 
session_cache_expire(30);
$cache_expire = session_cache_expire();

//session_destroy();

// Inicia a sessão
session_start();
echo "O limitador de cache esta definido agora como $cache_limiter<br />";
echo "As sessões em cache irão expirar em $cache_expire minutos";
$status = session_status();
echo "<br> A Sessão está $status"
//mysqli_close($mysqli);
      ?>