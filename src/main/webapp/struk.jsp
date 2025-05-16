<%@ page import="java.util.*, model.Film" %>
<%
    String nama = request.getParameter("nama");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    String jam = request.getParameter("jam");
    String judul = request.getParameter("judul");

    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");
    int harga = 0;
    for (Film f : daftarFilm) {
        if (f.getJudul().equals(judul)) {
            harga = f.getHarga();
            break;
        }
    }
    int total = jumlah * harga;
%>
<html>
<head>
    <head>
    <title>Struk Transaksi</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
    
    <style>
        body.container {
            max-width: 600px;
            margin: 30px auto;
            padding: 25px 30px;
            background-color: #f7f9fc;
            border-radius: 10px;
            font-family: "Roboto Mono", monospace;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            color: #333;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 2em;
            letter-spacing: 1px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            background: #e1ecf7;
            margin-bottom: 15px;
            padding: 15px 20px;
            border-radius: 6px;
            font-size: 1.1em;
            box-shadow: inset 0 1px 3px rgba(255,255,255,0.6);
        }

        ul li:nth-child(odd) {
            background: #d0dff3;
        }
        .btn-custom {
            background-color: #000080;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: 600;
            margin-top: 1.5rem;
            color: white;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #2F539B;
        }
        h3{
            text-align: center;
        }
    </style>
</head>

<body class="container">
    <h2>Struk Pemesanan</h2>
    <ul>
        <li>Nama Pemesan: <%= nama %></li>
        <li>Film: <%= judul %></li>
        <li>Jam Tayang: <%= jam %></li>
        <li>Jumlah Tiket: <%= jumlah %></li>
        <li>Total Harga: Rp <%= total %></li>
    </ul>
    <h3>Selamat Menonton!</h3>
    <a href="index.jsp" class="btn btn-custom btn-lg mt-3">Daftar Film</a>
</body>
</html>
