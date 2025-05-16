<%@ page import="java.util.*, model.Film" %>
<%
    String judulDipilih = request.getParameter("judul");
    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");
    Film filmDipilih = null;
    for (Film f : daftarFilm) {
        if (f.getJudul().equals(judulDipilih)) {
            filmDipilih = f;
            break;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form Pesan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #051923;
            color: white;
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-card {
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
            font-size: 36px;
            color: #e7ecef;
            margin-bottom: 30px;
        }
        label {
            margin-top: 15px;
            font-weight: 500;
            font-size: 14px;
        }
        input, select {
            background-color: #c0c0c0;
            color: black;
            border: 1px solid white;
            border-radius: 6px;
            padding: 10px;
            width: 100%;
            margin-top: 5px;
        }
        .btn-pesan {
            background-color: #051923;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: bold;
            margin-top: 25px;
            color: white;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }
        .btn-pesan:hover {
            background-color: #8b8c89;
        }
    </style>
</head>
<body>

<div class="form-card">
    <h2>Form Pemesanan</h2>
    <form action="struk.jsp" method="post">
        <label for="nama">Nama Pemesan</label>
        <input type="text" name="nama" id="nama" placeholder="Masukkan nama Anda" required>

        <label for="jumlah">Jumlah Tiket</label>
        <input type="number" name="jumlah" id="jumlah" min="1" max="10" value="1" required>

        <label for="jam">Jam Tayang</label>
        <select name="jam" id="jam" required>
            <% for (String jam : filmDipilih.getJamTayang()) { %>
                <option value="<%= jam %>"><%= jam %></option>
            <% } %>
        </select>

        <input type="hidden" name="judul" value="<%= filmDipilih.getJudul() %>">
        <button type="submit" class="btn-pesan">Pesan Tiket</button>
    </form>
</div>

</body>
</html>
