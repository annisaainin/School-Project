<?php
  session_start();
  include "../../koneksi/koneksi.php";
  //error_reporting(0);
  $id_user = $_SESSION['id_user'];
  $sql = mysqli_query($koneksi, "SELECT * from tb_user where id_user='$id_user'");
  $qry = (mysqli_num_rows($sql));
  if($qry==0){
    ?>
    <script language="JavaScript">
        alert('Username atau Password tidak sesuai. Silahkan diulang kembali!');
        document.location='../../index.php';
      </script>
      <?php
  }

  if(empty($_SESSION)){
    echo "<script>alert('Anda Harus Login Terlebih Dahulu');
    document.location='../../index.php';
    </script>";
  }
?>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="../../../assets/img/favicon.ico" type="image/x-icon">


  <title>The Logistic - Data Barang</title>

  <!-- Custom fonts for this template-->
  <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/vendor/fontawesome/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/css/fonts-googleapis.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <?php include 'sidebar.php'; ?>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <?php include 'topbar.php'; ?>
        <!-- End of Topbar -->
      
        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- <ol class="breadcrumb">
        <li><a href="data-berita.php">
          <em class="fa fa-home"></em>
        </a></li>
        <li class="active">Data Berita</li>
        <li class="active">Data Semua Berita</li>
      </ol> -->
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Data Barang</h1>
          <p class="mb-4">Menu yang berisi berbagai data baranag. Menu ini juga tersedia fitur tambah barang, edit dan hapus. </p>

          <?php 
            $kode = 'BR';
            $query = mysqli_query($koneksi,"SELECT MAX(id_barang) as idnew FROM tb_barang");
            $row = mysqli_fetch_array($query);

            $max_id = $row['idnew'];
            $max_ids = (int) substr($max_id,5,5);
            $id_barang = $max_ids+1;
            $auto = $kode.sprintf("%05s", $id_barang);
          ?>
          <p><a href="form-tambah-barang.php?id=<?php echo $auto; ?>" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah Barang</a></p>          
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Keseluruhan Data Barang</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>NO</th>
                      <th>Gambar</th>
                      <th>Nama</th>
                      <th>Jenis</th>
                      <th>Stok</th>
                      <th>Lebar/Berat/Tinggi</th>
                      <th>Harga</th>
                      <th>Gudang</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    function rupiah($angka){
              				  $hasil_rupiah = "Rp " . number_format($angka,0,',','.');
              				  return $hasil_rupiah;
              			}
                    include "../../koneksi/koneksi.php";
                    $no = 1;
                    $sql = mysqli_query($koneksi,"SELECT * from tb_barang b inner join tb_jenis_barang j on b.id_jenis_barang=j.id_jenis_barang inner join tb_gudang g on b.id_gudang=g.id_gudang inner join tb_detail_gambar d on b.id_barang=d.id_lain group by b.id_barang order by b.id_barang desc");
                      while ($data = mysqli_fetch_array($sql)){
                    ?>
                    <tr>
                      <td><?php echo $no++ ?></td>
                      <td><img src="../assets/all/image/<?php echo $data['file_gambar']; ?>" width="150px"></td>
                      <td><?php echo $data['nama_barang']; ?></td>
                      <td><?php echo $data['nama_jenis_barang']; ?></td>
                      <td><?php echo $data['stok_barang']; ?></td>
                      <td><?php echo $data['berat_barang']; ?> Kg / <?php echo $data['lebar_barang']; ?> CM / <?php echo $data['tinggi_barang']; ?> CM</td>
                      <td><?php echo rupiah($data["harga_barang"]); ?></td>
                      <td><?php echo $data['nama_gudang']; ?></td>
                      <td>
                        <!-- <a href="javascript:void(0);" id='<?php echo $data['id_barang']; ?>' class='btn btn-success fa fa-eye open_modal'> Detail</a> -->
                        <!-- <a href="#" class='btn btn-success fa fa-eye'> Lihat</a> -->
                        <a href="form-edit-barang.php?id_barang=<?php echo $data['id_barang']; ?>" class='btn btn-warning fa fa-pencil'> Edit</a>
                        <a href="pro-hapus-barang.php?id_barang=<?php echo $data['id_barang']; ?>" onclick="return confirm('Data akan dihapus?');" class='btn btn-danger fa fa-trash-o'> Hapus</a>

                      </td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <?php include 'footer.php';  ?>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
  <div id="ModalDetail" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  </div>
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <?php include 'logout-modal.php'; ?>

  <!-- Bootstrap core JavaScript-->
  <script src="../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../assets/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../assets/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../assets/js/demo/datatables-demo.js"></script>
 </body>

</html>
