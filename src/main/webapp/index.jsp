<%@ page import="java.util.*, model.Film" %>
<%
    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("Mumu: Silent Love", "Drama", 120, 50000, new String[]{"13:00", "17:00", "20:00"}));
    daftarFilm.add(new Film("Along With The Gods", "Laga", 180, 45000, new String[]{"12:00", "16:00"}));
    daftarFilm.add(new Film("Dark Nuns", "Horror", 120, 45000, new String[]{"18.00", "21.00"}));
    // Simpan ke session
    session.setAttribute("daftarFilm", daftarFilm);
%>

<html>
<head>
    <title>Bioskop Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #2c3e50, #3498db);
            color: white;
            min-height: 100vh;
            font-family: "Roboto Mono", monospace;
        }
        h2 {
            color: #E5E4E2;
            margin-bottom: 30px;
            text-align: center;
        }
        table {
            background-color: rgba(44, 62, 80, 0.85);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }
        th, td {
            vertical-align: middle !important;
        }
        th {
            background-color: #34495e;
            font-weight: 900;
            font-size: 16pt;
        }
        td {
            font-size: 14pt;
        }
        .btn-custom {
            background-color: #e67e22;
            border: none;
            font-size: 14pt;
            color: white;
            padding: 8px 20px;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #d35400;
            color: white;
        }
    </style>
</head>
<body class="container py-5">
    <h2>Daftar Film</h2>
    <table class="table table-bordered text-center align-middle">
    <tr>
        <th>Judul</th><th>Genre</th><th>Durasi</th><th>Harga</th><th>Jam Tayang</th><th>Aksi</th>
    </tr>
    <% for (Film film : daftarFilm) { %>
        <tr>
            <td><%= film.getJudul() %></td>
            <td><%= film.getGenre() %></td>
            <td><%= film.getDurasi() %> menit</td>
            <td>Rp <%= film.getHarga() %></td>
            <td><%= String.join(", ", film.getJamTayang()) %></td>
            <td><a href="formpesan.jsp?judul=<%= film.getJudul() %>" class="btn btn-custom btn-lg mt-3">Pesan</a></td>
        </tr>
    <% } %>
</table>

</body>
</html>
