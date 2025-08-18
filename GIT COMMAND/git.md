# Panduan Menggunakan Git

## Tool
- git bash : [text](https://git-scm.com/downloads)

## Panduan
1. Buat Akun GitHub
- akses link github : [text](https://github.com/)
- Jika belum memiliki akun, silakan daftar terlebih dahulu
- Jika sudah punya akun, silakan login

2. Konfigurasi Git di Komputer
Setelah install Git, buka Git Bash lalu jalankan:
```bash
git config --global user.name "Yasir Muin"
git config --global user.email "yassiermuin@gmail.com"
 ```
Gunakan email yang sama dengan akun GitHub agar commit sinkron dengan akunmu.

Cek konfigurasi:
```bash
git config --list
 ```

3. Generate SSH Key
Untuk koneksi aman ke GitHub tanpa login tiap kali push/pull.
```bash
ssh-keygen -t rsa -b 4096 -C "yassirmuin@gmail.com"
```
- Tekan `Enter` sampai selesai
- SSH Key tersimpan di:
```makefile
C:\Users\<username>\.ssh\id_rsa.pub
```
- Tambahkan ke ssh-agent:
```bash
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
```

4. Tambahkan SSH Key ke GitHub
1. Copy isi file id_rsa.pub:
```bash
cat ~/.ssh/id_rsa.pub
```
2. Login ke GitHub → Settings → SSH and GPG Keys → New SSH key.
cek koneksi:
```bash
 ssh -T git@github.com
 ```

 5. Membuat Repository
- Masuk ke GitHub → klik tombol New Repository.
- Isi nama repo (misalnya myproject) → klik Create repository.

6. Inisialisasi Project di Lokal
Masuk ke folder project kamu di laptop, lalu jalankan:
```bash 
git init 
```
7. Menambahkan File dan Commit
Tambahkan semua file ke Git:
```bash
git add .
```
Buat commit dengan pesan:
```bash
git commit -m "Upload Pertama Project"
```
8 Buat Branch  (Options)
default kita suda memilki brnach main yang secara default aktif pada branch tersebut, jika anda memiliki lebih dari satu branch dan ingin ubah branc anda bisa menjalankan perintah:
```bash
git branch -M main
```
9 Tambahkan remote git ke github
```bash
git remote add origin git@github.com:username/nama-repo.git
```
10 Push Project ke GitHub
```bash
git push -u origin main
```