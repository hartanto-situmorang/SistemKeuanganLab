<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
    String id = request.getParameter("id");
    String status = request.getParameter("status");
    String komentar = request.getParameter("komentar");
    String id_notifikasi = "0";
    String host = "jdbc:mysql://localhost:3306/sikel_db";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        if (conn != null) {
            if (id != null) {
                if (status.equalsIgnoreCase("verified")) {
                    PreparedStatement pst = conn.prepareStatement("update laporan set status=1 where id='" + id + "'");
                    PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi_laporan values(?,?,?,?)");
                    pst.executeUpdate();
                    status = "verified";
                    pst2.setString(1, id_notifikasi);
                    pst2.setString(2, status);
                    pst2.setString(3, komentar);
                    pst2.setString(4, id);
                    pst2.executeUpdate();
                    pst.close();
                    pst2.close();
                } else if (status.equalsIgnoreCase("unverified")) {
                    PreparedStatement pst = conn.prepareStatement("update laporan set status=2 where id='" + id + "'");
                    PreparedStatement pst2 = conn.prepareStatement("INSERT INTO notifikasi_laporan values(?,?,?,?)");
                    pst.executeUpdate();
                    status = "Unverified";
                    pst2.setString(1, id_notifikasi);
                    pst2.setString(2, status);
                    pst2.setString(3, komentar);
                    pst2.setString(4, id);
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
        out.print("Gagal Koneksi");
    } catch (Exception ex) {
        out.println("gagal");
        out.print(ex.getMessage());
    }
%>