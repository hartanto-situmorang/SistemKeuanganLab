<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    String host = "jdbc:mysql://localhost:3306/sikel_db";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        String query = "select * from laporan";
        Statement stmt = conn.createStatement();
        ResultSet rs = null;
        rs = stmt.executeQuery(query);

        String query2 = "select * from kalab";
        Statement stmt2 = conn.createStatement();
%>    
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>validasi laporan</title>

        <!-- Custom fonts for this template -->
        <link href=" ../assest/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="../assest/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Custom styles for this page -->
        <link href=" ../assest/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link rel="icon" type="image/png" href="../assest/img/file.svg" />

    </head>


    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">SIKEL</div>
                </a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <hr class="sidebar-divider">
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="view_Konfirmasi.jsp">
                        <i class="fas fa-fw fa-list"></i>
                        <span>List Pengajuan</span></a>
                </li>

                <hr class="sidebar-divider">
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="view_laporan.jsp">
                        <i class="fas fa-fw fa-file-pdf"></i>
                        <span>LPJ</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">
                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>


                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>


                            <!-- Notifikasi-->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!-- Counter - Alerts -->
                                    <span class="badge badge-danger badge-counter">3+</span>
                                </a>
                                <!-- Dropdown - Alerts -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Notikasi Terbaru
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 12, 2019</div>
                                            <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 7, 2019</div>
                                            $290.29 has been deposited into your account!
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-warning">
                                                <i class="fas fa-exclamation-triangle text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 2, 2019</div>
                                            Spending Alert: We've noticed unusually high spending for your account.
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                </div>
                            </li>
                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Dwi Listiyanti, S.S.T</span>
                                    <img class="img-profile rounded-circle"
                                         src="../assest/img/file.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->

                    <div style="margin: 60px">
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800">Validasi Laporan Belanja</h1>

                            <!-- DataTales  -->
                            <div style="padding: 30px">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Daftar Pengajuan</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table" id="dataTable" width="100%" cellspacing="0" >
                                                <thead>
                                                    <tr style="background:linear-gradient(90deg, rgba(11,114,129,1) 0%, rgba(124,0,81,1) 100%) ; color: white">
                                                        <th style="width: 50px">No</th>
                                                        <th >Nama KaLab</th>
                                                        <th>Keterangan</th>
                                                        <th>View File</th>
                                                        <th>Aksi</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th style="width: 50px">No</th>
                                                        <th >Nama KaLab</th>
                                                        <th>Keterangan</th>
                                                        <th>View File</th>
                                                        <th>Aksi</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <% int i = 1;
                                                        while (rs.next()) {
                                                    %>
                                                    <tr style="background: <% if (rs.getString("baca").equalsIgnoreCase("0")) {
                                                        %>linear-gradient(332deg, rgba(232,232,232,1) 0%, rgba(174,173,180,1) 100%); color: black;<%
                                                            }
                                                        %>">
                                                        <td style="text-align: center"><%=i%><% i++;%></td>
                                                        <td>
                                                            <%
                                                                ResultSet rs2 = null;
                                                                rs2 = stmt2.executeQuery(query2);
                                                                while (rs2.next()) {
                                                                    if (rs.getString("id_kalab").equals(rs2.getString("id_kalab"))) {
                                                            %>
                                                            <%=rs2.getString("nama_kalab")%>
                                                            <%
                                                                    }
                                                                }
                                                            %>
                                                        </td>
                                                        <td>
                                                            <%
                                                                if (rs.getString("status").equals("1")) {
                                                                    out.println("<b>Disetujui<b>");
                                                                } else if (rs.getString("status").equals("2")) {
                                                                    out.println("Ditolak");
                                                                } else {
                                                                    out.println("<b>Tidak Ada Keterangan</b>");
                                                                }
                                                            %></td>
                                                        <td>
                                                            <a class="btn btn-primary" style=" padding: 0px 5px 0px 5px;text-decoration: none; color: white" href="lihat.jsp?fname=<%=rs.getString("nama_file")%>&ket=1&id=<%=rs.getString("id")%>" target="_blank">
                                                                <%=rs.getString("nama_file")%>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-primary" href="verifikasi.jsp?id=<%=rs.getString("id")%>&status=verified">Verified</a>
                                                            <a  style="margin-left: 10px"class="btn btn-danger" data-toggle="modal" data-target="#<%=rs.getString("id")%>">Test</a>
                                                            <a  style="margin-left: 10px"class="btn btn-danger" href="verifikasi.jsp?id=<%=rs.getString("id")%>&status=Unverified">Unverified</a>
                                                        </td>
                                                    </tr>
                                                <form action="verifikasi.jsp" method="POST" enctype="multipart/form-data">
                                                    <div class="modal fade" id="<%=rs.getString("id")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Komentar</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                                                                    <input type="hidden" name="status" value="Unverified">
                                                                    <textarea type="text" style="width: 100%; height: 150px" name="komentar"></textarea>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button value="submit" type="submit" class="btn btn-primary">Unverified</button>
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <%
                                                    }
                                                %>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Sistem Keuangan Lab | Kemlompok 3</span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bootstrap core JavaScript-->
            <script src=" ../assest/vendor/jquery/jquery.min.js"></script>
            <script src=" ../assest/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src=" ../assest/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src=" ../assest/vendor/datatables/jquery.dataTables.min.js"></script>
            <script src=" ../assest/vendor/datatables/dataTables.bootstrap4.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <!-- Page level custom scripts -->
            <script src="../assest/js/demo/datatables-demo.js"></script>
            <%
                    rs.close();
                    stmt.close();
//                    rs2.close();
//                    stmt2.close();
                    conn.close();
                } catch (SQLException ex) {
                    out.print("Gagal Koneksi");
                } catch (Exception ex) {
                    out.print(ex.getMessage());
                }
            %>
    </body>

</html>