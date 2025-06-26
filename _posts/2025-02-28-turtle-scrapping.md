---
title: Scraping Data Turtles with Frames & iFrames
date: 2025-02-28
categories: [Scraping]
tags: [Scraping, BeautifulSoup, Requests, iFrames]
permalink: "/daily/1"
layout: post
---

## 🐢 Web Scraping Turtles via iFrames

Pada tutorial ini, kita akan melakukan **web scraping** pada halaman:  
🔗 [Turtles All the Way Down: Frames & iFrames](https://www.scrapethissite.com/pages/frames/)

Situs ini merupakan latihan menarik untuk memahami bagaimana cara scraping konten yang dimuat melalui *frames* atau *iFrames*.

---

## 🎯 Tujuan Scraping

- Mendapatkan informasi tentang keluarga kura-kura dari iframe tersembunyi
- Menelusuri halaman detail setiap item
- Mengekstrak data:
  - `Family Name`
  - `Common Name`
  - `Year Discovered`
  - `Discoverer`

---

## 🛠️ Setup Environment

Sebelum mulai coding, pastikan sudah membuat environment menggunakan:

```bash
python -m venv myenv
```

Lalu mengaktifkan environment di Windows:
```bash
.\myenv\Scripts\activate
```
Install library yang dibutuhkan:
```bash
pip install requests
pip install beautifulsoup4
```


---

## 🔍 Memahami Struktur Situs
Halaman utama sebenarnya hanya memuat iframe, di mana konten aslinya disisipkan dari URL lain. Untuk mendapatkan data:

Kita harus ambil tag iframe dari halaman utama.

Ambil konten URL di dalam iframe (yang berisi daftar kura-kura).

Setiap kartu kura-kura memiliki tombol Learn More yang menuju ke halaman detail.

Dari halaman detail itulah kita bisa mengambil data tahun ditemukan dan penemunya dari paragraf seperti ini:
```html
<p class="lead">
    The <span class="family-name">Chelydridae</span> family of turtles — more commonly known as "<strong class="common-name">Snapping turtles</strong>" — were first discovered in 1831 by Gray.
</p>
```

---

## 💻 Kode Lengkap Python untuk Scraping
Berikut adalah kode Python untuk mengekstrak data kura-kura lengkap dengan parsing tahun dan penemunya:

- Import library yang sudah dijelaskan
```python
import requests
from bs4 import BeautifulSoup
import urllib.parse
import csv
import time
import re
```

📌 Fungsi:

- `requests` untuk mengambil data dari web.

- `BeautifulSoup` untuk memparsing HTML.

- `urllib.parse` untuk menggabungkan URL relatif dan absolut.

- `csv`untuk menyimpan data hasil scraping ke file.

- `time` untuk delay antar request (menghindari ban IP).

- `re` untuk mengambil informasi tahun dan penemu menggunakan regular expression

Inisialisasi URL dan Tempat Menyimpan Data
```python
parent_url = "https://www.scrapethissite.com/pages/frames/"
all_turtles_data = []
```

 Ambil dan Parse Halaman Induk
```python
parent_response = requests.get(parent_url)
parent_response.raise_for_status()
parent_soup = BeautifulSoup(parent_response.text, 'html.parser')
```
📌 Fungsi:
Mengambil HTML dari halaman utama dan parsing untuk mencari iframe.

- Ambil dan Parse Halaman iframe
```python
iframe_tag = parent_soup.find('iframe', {'id': 'iframe'})
iframe_src = iframe_tag['src']
iframe_url = urllib.parse.urljoin(parent_url, iframe_src)
iframe_response = requests.get(iframe_url)
iframe_soup = BeautifulSoup(iframe_response.text, 'html.parser')
```
📌 Fungsi:
Mendapatkan URL iframe dan parsing isinya yang berisi daftar kura-kura.

-  Temukan dan Iterasi Setiap Keluarga Kura-kura
```python
turtle_items = iframe_soup.find_all('div', class_='col-md-4')

for item in turtle_items:
    family_name = item.find('h3', class_='family-name').text.strip()
    detail_url = urllib.parse.urljoin(iframe_url, item.find('a')['href'])
```

📌 Fungsi:

Ambil Family Name dari tiap elemen dan siapkan URL menuju halaman detail masing-masing.

- Kunjungi Halaman Detail dan Ekstrak Informasi
```python
    detail_response = requests.get(detail_url)
    detail_soup = BeautifulSoup(detail_response.text, 'html.parser')

    description = detail_soup.find('p', class_='lead').text.strip()
    match = re.search(r'first discovered in (\d{4}) by ([\w\s.]+)', description)
    year = match.group(1) if match else ''
    discoverer = match.group(2).strip() if match else ''

    common_name = detail_soup.find('strong', class_='common-name').text.strip()
```

📌 Fungsi:

Menemukan paragraf deskripsi, menggunakan regex untuk menemukan tahun dan nama penemu, mengambil nama umum kura-kura.

- Simpan data ke list
```python
    all_turtles_data.append({
        'Family Name': family_name,
        'Common Name': common_name,
        'Year Discovered': year,
        'Discoverer': discoverer
    })
```

- Simpan hasil ke CSV
```python
csv_file_name = 'turtle_data.csv'
csv_headers = ['Family Name', 'Common Name', 'Year Discovered', 'Discoverer']

with open(csv_file_name, 'w', newline='', encoding='utf-8') as f:
    writer = csv.DictWriter(f, fieldnames=csv_headers)
    writer.writeheader()
    writer.writerows(all_turtles_data)
```

![Before](/assets/lib/images/Screenshot%202025-06-26%20172238.png)
Data yang ingin disrapping



![After](/assets/lib/images/Screenshot%202025-06-26%20172446.png)
Data setelah discrapping