<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
    String id = request.getParameter("id");
    String status = request.getParameter("ket");
    String host = "jdbc:mysql://localhost:3306/sikel_db";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        if (conn != null) {
            if (id != null) {
                PreparedStatement pst = conn.prepareStatement("update laporan set baca=1 where id='" + id + "'");
                pst.executeUpdate();
            }
        }
    } catch (SQLException ex) {
        out.print("Gagal Koneksi");
    } catch (Exception ex) {
        out.print(ex.getMessage());
    }
    String nama = request.getParameter("fname");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Laporan <%=nama%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="../assest/img/pdf.svg" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div style="margin: 20px 30px 20px 30px" class="container-lg">
            <div style="text-align: right; margin: 30px">
                <a class="btn btn-primary" href="verifikasi.jsp?id=<%=id%>&status=verified">Verified</a>
                <a  style="margin-left: 10px"class="btn btn-danger" href="verifikasi.jsp?id=<%=id%>&status=Unverified">Unverified</a>
            </div>
            <div>
                <embed src="<%=nama%>" type="application/pdf" width="100%" height="1000px">
            </div>            
        </div>
    </body>
</html>
