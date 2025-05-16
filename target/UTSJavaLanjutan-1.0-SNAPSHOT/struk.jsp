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
<!DOCTYPE html>
<html>
<head>
    <title>Struk Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Bebas+Neue&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #051923;
            color: white;
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }
        .struk-card {
            background-color: #003554;
            border-radius: 12px;
            padding: 30px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.5);
        }
        h2 {
            font-family: 'Bebas Neue', cursive;
            text-align: center;
            color: #e7ecef;
            margin-bottom: 25px;
            font-size: 40px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            background-color: #c0c0c0;
            padding: 12px 20px;
            margin-bottom: 12px;
            border-radius: 6px;
            font-size: 16px;
            color: black;
        }
        h3 {
            text-align: center;
            color: #ccc;
            margin-top: 20px;
        }
        .btn-custom {
            background-color: #051923;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: bold;
            margin-top: 20px;
            color: white;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #8b8c89;
        }
    </style>
</head>
<body>
    <div class="struk-card">
        <h2>Struk Pemesanan</h2>
        <ul>
            <li><strong>Nama Pemesan:</strong> <%= nama %></li>
            <li><strong>Film:</strong> <%= judul %></li>
            <li><strong>Jam Tayang:</strong> <%= jam %></li>
            <li><strong>Jumlah Tiket:</strong> <%= jumlah %></li>
            <li><strong>Total Harga:</strong> Rp <%= total %></li>
        </ul>
        <h3>Selamat Menonton!</h3>
        <a href="index.jsp" class="btn btn-custom">Kembali ke Daftar Film</a>
    </div>
</body>
</html>
