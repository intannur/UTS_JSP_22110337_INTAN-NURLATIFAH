package model;

public class Film {
    private String judul, genre;
    private int durasi, harga;
    private String[] jamTayang;
    private String gambarURL;

    public Film(String judul, String genre, int durasi, int harga, String[] jamTayang, String gambarURL) {
        this.judul = judul;
        this.genre = genre;
        this.durasi = durasi;
        this.harga = harga;
        this.jamTayang = jamTayang;
        this.gambarURL = gambarURL;
    }

    public String getJudul() { 
        return judul; 
    }
    public String getGenre() { 
        return genre; 
    }
    public int getDurasi() { 
        return durasi; 
    }
    public int getHarga() { 
        return harga; 
    }
    public String[] getJamTayang() { 
        return jamTayang; 
    }
    public String getGambarURL() {
        return gambarURL;
    }
}
