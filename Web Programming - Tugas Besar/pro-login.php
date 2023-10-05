<?php
session_start();

include "koneksi/koneksi.php";
$username = ($_POST['in_username']);
$password = ($_POST['in_password']);


$sql = mysqli_query($koneksi,"SELECT * FROM tb_user WHERE username_user='$username' AND password_user='$password'");
$qry = (mysqli_num_rows($sql));

$time = time();                 
$check = isset($_POST['setcookie'])?$_POST['setcookie']:'';

if($qry==0){
	?>
	<script language="JavaScript">
    	alert('Username atau Password tidak sesuai. Silahkan diulang kembali!');
    	document.location='index.php';
    </script>
    <?php
}else{
	$qry = mysqli_fetch_array($sql);
	if($qry['id_hak_akses']=="HK00001"){
		$_SESSION["id_user"]=$qry['id_user'];
		$_SESSION["nama_user"]=$qry['nama_user'];

		if($check) {        
	    	setcookie("cookielogin[user]",$username , $time + 3600);        
	    	setcookie("cookielogin[pass]", $password, $time + 3600);    
	    }
		header('Location:aplikasi/admin/');
	}else if($qry['id_hak_akses']=="HK00002"){
		$_SESSION["id_user"]=$qry['id_user'];
		$_SESSION["nama_user"]=$qry['nama_user'];

		if($check) {        
	    	setcookie("cookielogin[user]",$username , $time + 3600);        
	    	setcookie("cookielogin[pass]", $password, $time + 3600);    
	    }
		header('Location:aplikasi/pelanggan/');
	}else{
		?>
		<script language="JavaScript">
	    	alert('Username atau Password tidak sesuai. Silahkan diulang kembali!');
	    	document.location='index.php';
	    </script>
	    <?php
	}
}	

?>















