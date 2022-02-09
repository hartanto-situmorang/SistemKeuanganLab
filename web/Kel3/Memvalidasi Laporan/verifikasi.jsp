<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
    String id = request.getParameter("id");
    String status = request.getParameter("status");
    String komentar = request.getParameter("komentar")+" ";
    String id_notifikasi = null;
    String host = "jdbc:mysql://localhost:3306/sikel_db";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        if (conn != null) {
            if (id != null) {
                if (status.equalsIgnoreCase("terima")) {
                    PreparedStatement pst = conn.prepareStatement("update laporan set status='terima' where id='" + id + "'");
                    PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi_laporan values(?,?,?,?)");
                    pst.executeUpdate();
                    status = "terima";
                    pst2.setString(1, id);
                    pst2.setString(2, id_notifikasi);
                    pst2.setString(3, "'"+status+"'");
                    pst2.setString(4, komentar);
                    pst2.executeUpdate();
                    pst.close();
                    pst2.close();
                } else if (status.equalsIgnoreCase("tolak")) {
                    PreparedStatement pst = conn.prepareStatement("update laporan set status='tolak' where id='" + id + "'");
                    PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi_laporan values(?,?,?,?)");
                    pst.executeUpdate();
                    status = "tolak";
                    pst2.setString(1, id);
                    pst2.setString(2, id_notifikasi);
                    pst2.setString(3, "'"+status+"'");
                    pst2.setString(4, komentar);
                    pst2.executeUpdate();
                    pst.close();
                    pst2.close();
                }
                response.sendRedirect("view_laporan.jsp");
            }
        } else {
            response.sendRedirect("view_laporan.jsp");
        }
    } catch (SQLException ex) {
        out.print("Gagal Koneksi"+ex);
    } catch (Exception ex) {
        out.println("gagal");
        out.print(ex.getMessage());
    }
%>