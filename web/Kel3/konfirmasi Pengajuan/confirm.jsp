<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
    String id = request.getParameter("id");
    String status = request.getParameter("status");
    out.print(status);
    String komentar = request.getParameter("komentar")+" ";
    String nama = request.getParameter("nama");
    String nopengajuan = id + "-" + request.getParameter("nama");
    String id_notifikasi = null ;
    String host = "jdbc:mysql://localhost:3306/sikel_db";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        if (conn != null) {
            if (id != null) {
                if (status.equalsIgnoreCase("terima")) {
                    PreparedStatement pst = conn.prepareStatement("update form_pengajuan set status='terima' where id='" + id + "'");
                    PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi values(?,?,?,?,?)");
                    pst.executeUpdate();
                    status = "terima";
                    pst2.setString(1, id_notifikasi);
                    pst2.setString(2, id);
                    pst2.setString(3, nopengajuan);
                    pst2.setString(4,  status);
                    pst2.setString(5, komentar);
                    pst2.executeUpdate();
                    pst.close();
                    pst2.close();
                } else if (status.equalsIgnoreCase("tolak")) {
                    PreparedStatement pst = conn.prepareStatement("update form_pengajuan set status='tolak' where id='" + id + "'");
                    PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi values(?,?,?,?,?)");
                    pst.executeUpdate();
                    status = "tolak";
                    pst2.setString(1, id_notifikasi);
                    pst2.setString(2, id);
                    pst2.setString(3, nopengajuan+nama);
                    pst2.setString(4, status);
                    pst2.setString(5, komentar);
                    pst2.executeUpdate();
                    pst.close();
                    pst2.close();
                }
                response.sendRedirect("view_Konfirmasi.jsp");
            }
        } else {
            response.sendRedirect("view_Konfirmasi.jsp");
        }
    } catch (SQLException ex) {
        out.print("Gagal Koneksi"+ex);
    } catch (Exception ex) {
        out.println("gagal");
        out.print(ex.getMessage());
    }
%>