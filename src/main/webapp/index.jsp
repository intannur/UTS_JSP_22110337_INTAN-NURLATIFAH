<%@ page import="java.util.*, model.Film" %>
<%
    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("Mumu: Silent Love", "Drama", 120, 50000, new String[]{"13:00", "17:00", "20:00"}, "img/mumu.jpg"));
    daftarFilm.add(new Film("Along With The Gods", "Laga", 180, 45000, new String[]{"12:00", "16:00"},"img/along.jpg"));
    daftarFilm.add(new Film("Dark Nuns", "Horror", 120, 45000, new String[]{"18.00", "21.00"},"img/dark.jpg"));
    session.setAttribute("daftarFilm", daftarFilm);
%>

<html>
<head>
    <title>Bioskop Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #051923;
            color: #e7ecef;
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
        }
        h2 {
            font-family: 'Bebas Neue', cursive;
            font-size: 48px;
            text-align: center;
            margin: 40px 0;
            color: #e7ecef;
        }
        .film-card {
            background-color: #003554;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s;
            box-shadow: 0 4px 20px rgba(0,0,0,0.5);
        }
        .film-card:hover {
            transform: scale(1.05);
        }
        .film-img {
            height: 300px;
            background-size: cover;
            background-position: center;
        }
        .film-info {
            padding: 15px;
        }
        .film-title {
            font-size: 20px;
            font-weight: bold;
        }
        .film-meta {
            font-size: 14px;
            margin-top: 5px;
            color: #ccc;
        }
        .btn-custom {
            background-color: #051923;
            color: white;
            border: none;
            padding: 8px 16px;
            margin-top: 10px;
            font-weight: bold;
            transition: background 0.3s;
        }
        .btn-custom:hover {
            background-color: #8b8c89;
        }
    </style>
</head>
<body class="container">

    <h2>Daftar Film</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (Film film : daftarFilm) { %>
            <div class="col">
                <div class="film-card">
                    <div class="film-img" style="background-image: url('<%= film.getGambarURL() %>');"></div>
                        <div class="film-info">
                        <div class="film-title"><%= film.getJudul() %></div>
                        <div class="film-meta">
                            Genre: <%= film.getGenre() %><br>
                            Durasi: <%= film.getDurasi() %> menit<br>
                            Harga: Rp <%= film.getHarga() %><br>
                            Jam Tayang: <%= String.join(", ", film.getJamTayang()) %>
                        </div>
                        <a href="formpesan.jsp?judul=<%= film.getJudul() %>" class="btn btn-custom">Pesan</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

</body>
</html>
