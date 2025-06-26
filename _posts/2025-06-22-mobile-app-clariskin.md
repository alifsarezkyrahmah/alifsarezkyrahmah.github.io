---
title: Clariskin - Mobile App
date: 2025-06-23
categories: [Mobile App]
tags: [Java, Android Studio, SQLite, Mobile App]
permalink: "/daily/5"
layout: post
---

## 💆‍♀️ Clariskin – Teman Kulit Sehatmu di Genggaman

**Android** | **Java** | **SQLite** | **API Integration** | **RecyclerView** | **Navigation Component**

> **“Ketika Kecantikan Bertemu Teknologi”**

**Clariskin** adalah aplikasi Android berbasis Java yang dirancang untuk membantu pengguna memahami kandungan skincare secara cepat dan akurat. Tidak hanya menyajikan informasi bahan, Clariskin juga memberikan rekomendasi produk berdasarkan profil kulit masing-masing pengguna.

---


## 🎯 Tentang Proyek

Clariskin dibuat untuk menjawab kebutuhan generasi muda yang semakin peduli dengan kesehatan kulit dan kandungan skincare yang digunakan.

### Masalah yang Diselesaikan
- Kurangnya pemahaman bahan skincare di kalangan pengguna baru  
- Sulitnya mencari informasi terpercaya tentang efek samping bahan  
- Tidak semua rekomendasi produk sesuai dengan kondisi kulit pengguna  
- Tidak adanya aplikasi yang secara eksplisit menampilkan kombinasi bahan yang harus dihindari/dianjurkan  

### Solusi
Aplikasi Clariskin menyediakan:
- Pencarian bahan dan produk skincare dengan informasi lengkap  
- Penjelasan fungsi & efek samping dari setiap bahan  
- Rekomendasi produk berdasarkan **profil kulit**, bukan rating umum  
- Fitur kombinasi bahan berbahaya & aman  
- Fitur simpan bahan dan produk favorit  

---

## ✨ Fitur Utama

| 🔧 Fitur | 📌 Deskripsi |
|--------|-------------|
| 🔍 Pencarian Kandungan | Telusuri bahan berdasarkan nama dan kategori |
| 📖 Detail Bahan | Tampilkan fungsi, efek samping, dan penjelasan ilmiah |
| 💡 Rekomendasi Produk | Rekomendasi skincare berdasarkan profil kulit pengguna |
| ❤️ Simpan Favorit | Simpan bahan dan produk yang disukai secara offline |
| 🚨 Deteksi Kombinasi | Menampilkan kombinasi bahan yang **tidak disarankan** |
| 📋 Navigasi Fragment | Navigasi antar tab: Home, Favorites, SkinProfile, Settings |

---

## 📱 Tampilan Aplikasi

> Letakkan gambar di folder `screenshot/` dan pastikan namanya sesuai

!![Splash Activity](/assets/images/mobile1.jpeg)
!![Home](/assets/images/mobile2.jpeg)
!![Detail Product](/assets/images/mobile3.jpeg)
!![Detail Ingredient](/assets/images/mobile4.jpeg)
!![Fav Product](/assets/images/mobile5.jpeg)
!![Set Skin profile](/assets/images/mobile6.jpeg)
!![Recommendation product](/assets/images/mobile7.jpeg)
---

## 🛠️ Implementasi Teknis

Aplikasi dikembangkan di Android Studio menggunakan pendekatan modular dan clean architecture.

### 📋 RecyclerView
- Menampilkan daftar produk dan bahan  
- Adapter mendukung filter dan dynamic binding  

### 📂 Fragment & Navigation
- Fragment: Home, Favorites, Profile, Settings  
- Navigasi menggunakan `BottomNavigationView` dan `NavigationComponent`

### 🔎 Pencarian & Filter
- Pencarian manual berdasarkan nama bahan  
- Filter berdasarkan kategori, fungsi, dan efek  

### 🧠 Rekomendasi Cerdas
- Berdasarkan profil kulit pengguna (berminyak, kering, sensitif, dsb)  


### 💾 Local Storage
- **SQLite** untuk menyimpan data favorit  
- **SharedPreferences** untuk pengaturan profil kulit 

---

## 🧱 Teknologi yang Digunakan

| Teknologi | Fungsi |
|----------|--------|
| Java | Bahasa utama pengembangan |
| Android Studio | Lingkungan pengembangan aplikasi |
| RecyclerView | Menampilkan list produk & bahan |
| SQLite | Menyimpan data favorit lokal |
| SharedPreferences | Menyimpan preferensi pengguna |
| BottomNavigationView | Navigasi antarmuka pengguna |

---

## 📚 Cara Memulai

### Prasyarat
- Android Studio terbaru  
- JDK 8  
- Emulator / Perangkat Android  
- Koneksi internet (opsional untuk API)

### Instalasi

```bash
git clone https://github.com/alifsarezkyrahmah/Clariskin.git
```
