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
    <meta charset="UTF-8" />
    <title>Form Pesan - Bioskop Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #283e55, #3c4d5f);
            color: white;
            min-height: 100vh;
            padding-top: 40px;
            font-family: "Roboto Mono", monospace;
        }
        .card {
            background-color: white;
            color: #34495e;
            border-radius: 1rem;
            box-shadow: 0 6px 15px rgba(0,0,0,0.25);
            padding: 30px;
            max-width: 480px;
            margin: auto;
        }
        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #26323d;
        }
        label {
            font-weight: 600;
            margin-top: 1rem;
        }
        .btn-pesan {
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
        .btn-pesan:hover {
            background-color: #2F539B;
        }
        input[type="text"], input[type="number"], select {
            border-radius: 6px;
            border: 1px solid #000080;
            padding: 8px 10px;
            width: 100%;
            font-size: 1rem;
            color: #34495e;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Form Pemesanan Tiket</h2>
        <form action="struk.jsp" method="post">
            <label for="nama">Nama Pemesan:</label>
            <input type="text" name="nama" id="nama" placeholder="Masukkan nama Anda" required>

            <label for="jumlah">Jumlah Tiket:</label>
            <input type="number" name="jumlah" id="jumlah" min="1" max="10" value="1" required>

            <label for="jam">Pilihan Jam:</label>
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
