# PBP A

## GameSthar
### Nama : Shaquille Athar Adista
### NPM  : 2206081875
---
## Tugas

<details>
  <summary> 
     WEEK 07 : Elemen Dasar Flutter
  </summary>

## 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

**Stateless widget**
<br/>
- Stateless widget merupakan widget yang tidak memeiliki keadaan state yang dapat berubah
- Stateless widget tidak dapat memperbarui atau merender ulang diri mereka sendiri
- stateless widget berguna jika ingin memiliki bagian antarmuka yang tidak akan berubah dan tidak memerlukan pembaruan berdasarkan input
Contoh : ikon, gambar

**Stateful widget**
<br/>
- Stateful widget merupakan widget yang memiliki keadaan state yang dapat berubah selama siklus hidupnya
- Stateful widget dapat merender diri mereka sendiri ketika terjadi perubahan dalam statenya
- Stateful widget berguna jika ingin mengubah tampilan widget berdasarkan input atau perubahan keadaan
Contoh : chatbox, textfield


## 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

1. Widget yang ada di main.dart
   - MyApp 
  
        Widget utama yang digunakan sebagai entry point dari aplikasi ini. MyApp adalah turunan dari StatelessWidget.

   - MaterialApp

        MaterialApp adalah widget yang digunakan sebagai root dari seluruh antarmuka aplikasi Flutter. Ini adalah widget yang pertama kali dibangun dalam pohon widget, dan mengatur banyak konfigurasi yang mempengaruhi seluruh aplikasi. 

   - MyHomePage

        Widget yang menjadi halaman utama dari aplikasi ini.

2. Widget yang ada di menu.dart
    - MyHomePage

        Widget utama yang mewakili halaman utama aplikasi. turunan dari StatelessWidget. Widget ini memuat tata letak utama aplikasi.
    
    - Scaffold 

        Scaffold adalah widget yang digunakan untuk membuat kerangka antarmuka umum yang mengikuti pedoman desain Material Design.
    
    - AppBar

        AppBar adalah widget yang berfungsi untuk membuat dan mengatur app bar dalam aplikasi, serta melakukan kustomisai app bar 

    - Text
  
        Text berfungsi untuk menampilkan sebuah teks biasa, atau bisa kita berikan style dengan menambahkan property style.
        
    - Padding 

        Padding digunakan untuk menambahkan padding ke kontennya.

    - Colummn

        Column membuat Widget akan mengarah secara vertikal atau dari atas kebawah, widget ini juga menggunakan property children artinya widget ini bisa diisi oleh banyak widget.

    - GridView.count

        Widget yang digunakan untuk membuat tampilan berbentuk grid dengan jumlah kolom yang ditentukan

    - Container

        Container merupakan widget yang fungsinya untuk membungkus widget lain sehingga dapat diberikan nilai seperti margin, padding, warna background, atau dekorasi.

    - Center

        Center berfungsi agar posisi widget yang kita buat berada ditengah.

    - Icon

        Widget ini untuk menggunakan icon yang telah disediakan
    
    - InkWell

        Inkwell berguna untuk menambahkan action pada widget
    
    - SingleChildScrollView

        Widget wrapper yang berfungsi agar halaman dapat di scroll

    - SnackBar

        Widget yang menampilkan notifikasi atau pesan singkat saat suatu tindakan terjadi.
    
    - Material

       Material mencakup gaya, tata letak, komponen, dan pedoman desain yang digunakan untuk membangun aplikasi
    
    - ShopCard

        Extend statelesswidget.

    - ScaffoldMessenger
       
       Untuk mengontrol pesan dari Snackbar.
       

## 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).

- Buat proyek flutter di direktori yang diinginkan dengan command
  ```
    flutter create game_sthar
    cd game_sthar
  ```
- Buat file baru dengan nama `menu.dart` pada folder `game_sthar/lib`, kemudian tambahkan `import 'package:flutter/material.dart';`
- Pada file `main.dart` pindahkan kode yang berisi `class MyHomePage` dan hapus kode yang berisi `class _MyHomePageState`
- Tambahkan kode ini `import 'package:shopping_list/menu.dart';` di `main.dart`
- Buka file `main.dart` dan ubah bagian `colorSceheme` menjadi `colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),`
- Pada file `main.dart` ubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`
- Pada file `menu.dart` ubah `MyHomePage` menjadi StatelessWidget dan terapkan kode berikut ini  dan hapus fungsi state yang ada dibawah.
    ```
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            );
        }
    }
    ```
- Tambahkan teks card dengan cara define tipe pada list,
  ```
    class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
    }
  ```

- Lalu dibawah kode `MyHomePage({Key? key}) : super(key: key);` tambahkan barang-barang yang mau dijual
    ```
    final List<ShopItem> items = [
        ShopItem("Lihat Produk", Icons.checklist),
        ShopItem("Tambah Produk", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];
    ```

- Tambahkan kode dibawah di dalam widget build
    ```
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    ```

- Buat widget stateless baru yang berfungsi untuk menampilkan card
  ```
  class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: Colors.indigo,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
    }
    }
  ```
  

  </details>