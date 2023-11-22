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

<details>
  <summary> 
     WEEK 08 : Flutter Navigation, Layouts, Forms, and Input Elements
  </summary>

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

<b>Push</b></br>
Method push() menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.

<b>pushReplacement</b></br>
Method pushReplacement() menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.


Perbedaan keduanya adalah `push()` akan menambahkan route baru diatas route yang sudah ada pada atas stack, sedangkan `pushReplacement()` menggantikan route yang sudah ada pada atas stack dengan route baru tersebut.

penggunaan `push()` dan `pushReplacement()` tergantung dengan kebutuhan, jika kita ingin dapat menekan tombol back dan kembali ke route sebelumnya maka `push()` dapat dipilih, `push()` contohnya digunakan ketika kita ingin add suatu barang, keika dapat menekan back jika tidak jadi add suatu barang. Sedangkan jika kita tidak ingin kembali ke route sebelumnya dengan menekan back, maka `pushReplacement()` dapat dipilih, `pushReplacement()` contoh penggunaannya adalah ketika register.

## 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

<b>Single-child layout widgets</b></br>
Single child layout widget adalah suatu widget yang hanya dapat memiliki satu widget anak di dalam widget parentnya. Digunakan jika hanya membutuhkan satu widget anak saja

+ Align </br> 
  Ini adalah widget yang menyelaraskan widget anak di dalamnya dan mengukurnya berdasarkan ukuran anak. Ini memberikan kontrol lebih besar untuk menempatkan widget anak tepat di posisi yang diinginkan.
+ Center </br>
  Widget ini memungkinkan Anda memusatkan widget anak di dalamnya
+ ConstrainedBox</br> 
  Ini adalah widget yang memungkinkan Anda memaksakan batasan tambahan pada widget turunannya. Artinya Anda dapat memaksa widget anak memiliki batasan tertentu tanpa mengubah properti widget anak.
+ Container </br> 
  Widget praktis yang menggabungkan pengecatan umum, pemosisian, dan ukuran widget.
+ CustomSingleChildLayout </br> 
  Ini adalah widget, yang mengubah tata letak anak tunggal menjadi delegasi. Delegasi memutuskan untuk memposisikan widget anak dan juga digunakan untuk menentukan ukuran widget induk.
+ Expanded </br> 
  Memungkinkan untuk membuat turunan widget Baris dan Kolom menempati area semaksimal mungkin.
+ FittedBox </br>
  Ini menskalakan dan memposisikan widget anak sesuai dengan fit yang ditentukan.
+ FractionallySizedBox </br>
  widget untuk menentukan ukuran relatif dari kotaknya berdasarkan ukuran induk yang mengandungnya. User dapat mengatur lebar, tinggi, atau keduanya sebagai persentase dari ukuran induk.
+ IntrinsicHeight </br> 
  merupakan widget yang memungkinkan widget turunannya menentukan tinggi sendiri berdasarkan dimensi intrinsiknya. Digunakan jika ingin memastikan bawha widget di satu kolom memiliki tinggi yang sama.
+ IntrinsicWidth </br>
  merupakan widget yang memungkinkan widget turunannya menentukan lebar sendiri berdasarkan dimensi intrinsiknya. Digunakan jika ingin memastikan widget di satu baris memeiliki lebar yang sama.
+ LimitedBox </br> 
  Sebuah kotak yang membatasi ukurannya hanya jika tidak dibatasi.
+ Offstage </br>
  Jika kita ingin menyembunyikan atau menampilkan widget tertentu sesuai dengan tindakan pengguna.
+ OverflowBox </br>
+ Padding </br> 
  Merupakan widget yang digunakan untuk mengatur widget turunannya berdasarkan padding yang diberikan.
+ SizedBox </br>
  Kotak sederhana dengan ukuran tertentu
+ SizedOverflowBox </br>
  Widget dengan ukuran tertentu namun meneruskan batasan aslinya ke turunannya, yang kemudian dapat overflow
+ Transform </br> 
  Menerapkan transformasi ke anaknya.
  

<b>Multi-child layout widgets</b></br>
Multi child layout adalah widget yang dapat menampung lebih dari satu widget anak. Digunakan ketika membutuhkan banyak widget anak dalam satu widget parent.

+ Column</br>
  Widget yang menampilkan turunannya dalam array vertikal
+ CustomMultiChildLayout </br>
+ Flow </br>
  Widget yang memosisikan children elemen berdasarkan FlowDelegate
+ GridView </br>
  Menampilkan item dalam array 2D (baris dan kolom dua dimensi).
+ IndexedStack </br>
  Stack yang menampilkan satu anak dari daftar anak.
+ LayoutBuilder </br> 
  Membangun pohon widget yang dapat bergantung pada ukuran widget induk.
+ ListBody </br>
  Widget tata letak yang menyusun turunannya secara berurutan sepanjang sumbu tertentu, dengan default pada sumbu vertikal.
+ ListView </br>
  widget scroll yang paling umum digunakan. Ini menampilkan anak-anaknya satu demi satu dalam arah scroll.
+ Row </br> 
  Tata letak daftar widget anak dalam arah horizontal.
+ Stack </br>
  Untuk stack beberapa anak dengan cara yang sederhana.
+ Table </br>
  Menampilkan widget anak dalam baris dan kolom.
+ Wrap </br>
  Menampilkan turunannya dalam horizontal atau vertikal.

<b>Sliver widgets</b></br>
Sliver widgets adalah widgets yang berhubungan dengan scroll. Digunakan jika ingin membuat elemen antarmuka pengguna yang dapat di scroll

+ CupertinoSliverNavigationBar </br>
  Bilah navigasi bergaya IOS.
+ CustomScrollView </br>
  ScrollView yang membuat efek scroll khusus.
+ SliverAppBar </br>
  Bilah aplikasi desain material yang terintegrasi dengan CustomScrollView.
+ SliverChildBuilderDelegate </br>
  Menyuplai anak-anak untuk sliver menggunakan callback builder
+ SliverChildListDelegate </br> 
  Memasok anak-anak untuk sliver menggunakan daftar eksplisit
+ SliverFixedExtentList </br>
  Sliver yang menempatkan beberapa turunan kotak dengan luas sumbu utama yang sama dalam array linier.
+ SliverGrid  </br>
  Sebuah sliver yang menempatkan beberapa box anak dalam susunan dua dimensi.



## 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

1. Form : wadah untuk mengelompokkan beberapa bagian(input) formulir, di sini kita bisa meletekkan TextFormField untuk meminta jawaban dari user.
   
2. TextFormField : digunakan di dalam form tempat user dapat menginput jawaban 

## 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

Dengan mengelompokkan kode kedalam suatu folder berdasarkan kegunaannya.
1. model -> berisi definisi kelas atau objek yang mewakili struktur data atau konsep bisnis dalam aplikasi.
2. screens --> berisi tampilan atau layar-layar dalam aplikasi flutter
3. widgets --> komponen-komponen UI atau widget yang dapat digunakan kembali di berbagai bagian aplikasi


## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
+ [x] Membuat minimal satu halaman baru pada aplikasi.
  +  pada folder `lib` buat folder baru yang bernama `screens` untuk menyimpan file yang berhubungan dengan tampilan, kemudian buat suatu file baru agar kita dapat membuat form.
  + Tambahkan kode berikut pada form agar dapat mempunyai input sesuai keinginan dan mempunyai tombol save
    ```
    import 'package:flutter/material.dart';
    import 'package:game_sthar/widgets/left_drawer.dart';
    import '../model/item.dart';

    class ShopFormPage extends StatefulWidget {
      const ShopFormPage({super.key});

      @override
      State<ShopFormPage> createState() => _ShopFormPageState();
    }

    List<ItemData> productList = [];


    class _ShopFormPageState extends State<ShopFormPage> {
      final _formKey = GlobalKey<FormState>();
      String _name = "";
      int _price = 0;
      int _amount = 0;
      String _description = "";
      String _platform = "";
      String _genre = "";


      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Form Tambah Produk',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          drawer: LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Judul",
                      labelText: "Judul",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Judul tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Genre",
                      labelText: "Genre",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _genre = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Genre tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Platform",
                      labelText: "Paltform",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _platform = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Platform tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Stock",
                      labelText: "Stock",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Stock tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Stock harus berupa angka!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Harga",
                      labelText: "Harga",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _price = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Harga harus berupa angka!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Deskripsi",
                      labelText: "Deskripsi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Deskripsi tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Create a new ItemData object
                          ItemData newItem = ItemData(
                            id:  UniqueKey().toString(),
                            judul: _name,
                            harga: _price,
                            jumlah: _amount,
                            deskripsi: _description,
                            platform: _platform,
                            genre: _genre,
                          );

                          // Add the new item to the list
                          productList.add(newItem);
                        }
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Produk berhasil tersimpan'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Nama: $_name'),
                                      Text('Genre: $_genre'),
                                      Text('Platform: $_platform'),
                                      Text('Jumlah: $_amount'),
                                      Text('Price: $_price'),
                                      Text('Description: $_description')
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          _formKey.currentState!.reset();
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      }
    }

    ```
+ [x] Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
  + pada `menu.dart` tamabahkan kode berikut pada `ontap()` agar ketika button ditekan dia melakukan perintah yang sesuai
    ```
      if (item.name == "Tambah Item") {
              Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => const ShopFormPage()));
            }
    ```
+ [x] Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
  + pada `gamelist_form.dart` tambahkan kode berikut pada onchange() jika belum ada.
    ```
     if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Produk berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama: $_name'),
                                  Text('Genre: $_genre'),
                                  Text('Platform: $_platform'),
                                  Text('Jumlah: $_amount'),
                                  Text('Price: $_price'),
                                  Text('Description: $_description')
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        },
                      ),
                      _formKey.currentState!.reset();
                    }
    ```
+ [x] Membuat sebuah drawer pada aplikasi.
  
  - Buat folder `widgets` pada lib dan buat file `left_drawer.dart` di dalamnya
  - tambakan kode berikut di `left_drawer.dart`
      ```
      ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Halaman Utama'),
          // Bagian redirection ke MyHomePage
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart),
          title: const Text('Tambah Produk'),
          // Bagian redirection ke ShopFormPage
          onTap: () {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
            ));
          },
        ),
      ```
  - Tambahkan `drawer: LeftDrawer()` pada `menu.dart`
  - Tambahkan `drawer: LeftDrawer()` pada `gamelist_form.dart`
</details>

<details>

<summary>
Week 09 : Integrasi Layanan Web Django dengan Aplikasi Flutter
</summary>

## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya kita langsung melakukan parsing data dari JSON dan menyimpannya ke struktur data yang ada seperti array.

Pemilihan antara menggunakan model atau langsung parse dari JSON sesuai dengan kebutuhan developer.

<b>Keuntungan menggunakan model</b>

+ <b>Validasi input</b>, dengan model kita bisa mengspecify data yang akan disimpan, misalnya hanya khusus int saja atau hanya boleh string dengan max panjang n.
+ <b>Clean</b>, dengan menggunakan model, maka struktur data kita jauh lebih jelas dan akan mudah untuk didokumentasi.
+ <b> Kemudahan penggunaan </b>, model yang terstruktur membuat penggunaan data lebih mudah. Developer dapat menggunakan library atau tools yang mendukung model tersebut, seperti ORM.

<b>Keuntungan langsung parse dari JSON</b>

+ <b>Kecepatan development</b>, jika model yang ada pada web developer sangat banyak dan kompleks, mungkin dengan parse langsung dari JSON bisa jauh lebih cepat karena tidak perlu membuat model terlebih dahulu.
+ <b>Fleksibelitas</b>, jika data kita sangat dinamis, maka dengan parse langsung dari JSON akan mempermudah karena jika kita menggunakan model, maka ada aturan-aturan yang harus kita ikuti, seperti jenis data yang boleh diinput.


## 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest digunakan untuk mengelola permintaan HTTP yang melibatkan penggunaan cookie. CookiRequest digunakan untuk keperluan authentikasi, dan menyimpan rekam jejak user, CookieRequest perlu dibagikan ke semua komponen di flutter dikarenakan agar komponen aplikasi tersebut dapat authentikasi dengan memanfaatkan data yang disimpan di dalam Cookie, dan juga bisa memakai rekam jejak user jika diperlukan, serta agar isi cookie dari tiap komponen aplikasi konsisten.


## 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Buka endpoint JSON pada aplikasi django, kemudian salin JSON yang didapatkan ke situ quicktype, kemudian source type kita atur menjadi JSON, dan language menjadi dart, kemudian tempel JSON ke quicktype dan pilih copy code. Terus bikin file dalam lib/models dengan nama product.dart dan salin hasil dari copy code tadi.

<b>Pada list_product.dart</b>
Data diambil dari url yang fungsinya ada di Django, nantinya respons dari url tersebut akan di decode menjadi json dan disimpan di suatu variabel, kemudian data yang sudah ada di variabel tadi akan dipindahkan kedalam suatu list. kemudian untuk mengambil data, kita akan memanfaatkan FutureBuilder, FutureBuilder memiliki kemampuan untuk menangani proses asinkronus. Data tersebut kemudian akan ditampilkan dengan memanfaatkan ListView.builder. 

## 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

<b>Pada Flutter</b>
+ User akan menginput data kedalam form yang sudah disediakan di flutter.
+ Flutter akan mengirimkan request login melalui url yang dihubungkan dengan method login di django.
+ Jika input yang diberikan sudah benar, maka JsonResponse akan mengembalikan status True sehingga user akan akan diarahkan ke homepage.
+ Jika input salah maka JsonResponse akan mengembalikan status False sehingga akan keluar pesan bahwa login gagal.

<b>Pada Django</b>
+ request login yang dikirim oleh user di flutter tadi akan diambil oleh django.
+ kemudian django akan menyimpan username dan password yang diinput user pada flutter tadi.
+ Kemudian akan di cek kebenaran dari input user tadi dengan authenticate().
+ Jika valid, maka akan melakukan auth_login() dan django akan mengembalikan JsonResponse dengan status True.
+ Jika tidak valid, maka django hanya akan mengembalikan JsonResponse dengan status False.


## 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

+ Scaffold </br>
  Scaffold adalah widget yang digunakan untuk membuat kerangka antarmuka umum yang mengikuti pedoman desain Material Design.

+ Appbar </br>
  AppBar adalah widget yang berfungsi untuk membuat dan mengatur app bar dalam aplikasi, serta melakukan kustomisai app bar

+ FutureBuilder </br>
  FutureBuilder berguna untuk membantu developer dalam mengelola asinkronus 
  
+ ListView.builder </br
 ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.
  
+ Column </br>
  Column membuat Widget akan mengarah secara vertikal atau dari atas kebawah, widget ini juga menggunakan property children artinya widget ini bisa diisi oleh banyak widget.

+ Container </br >
  Container merupakan widget yang fungsinya untuk membungkus widget lain sehingga dapat diberikan nilai seperti margin, padding, warna background, atau dekorasi.

+ Center </br>
  Center berfungsi agar posisi widget yang kita buat berada ditengah.

+ Text </br>
  Text berfungsi untuk menampilkan sebuah teks biasa, atau bisa kita berikan style dengan menambahkan property style.

+ Navigator </br>
  Widget Navigator menampilkan halaman-halaman yang ada kepada layar seakan sebagai sebuah tumpukan (stack).

+ ElevetadButton </br>
  The main characteristic these buttons hold is the slight elevation in their surface towards the screen on getting tapped by the user. 
  
+ SnackBar </br>
  Widget yang menampilkan notifikasi atau pesan singkat saat suatu tindakan terjadi.

## 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! 

[x] Membuat halaman login pada proyek tugas flutter.

  + pada folder `Screens` buat file `login.dart` dan isi dengan kode berikut
    ```
    import 'package:game_sthar/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:game_sthar/screens/register.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
                appBar: AppBar(
                    title: const Text('Login'),
                ),
                body: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                    labelText: 'Username',
                                ),
                            ),
                            const SizedBox(height: 12.0),
                            TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                ),
                                obscureText: true,
                            ),
                            const SizedBox(height: 24.0),
                            ElevatedButton(
                                onPressed: () async {
                                    String username = _usernameController.text;
                                    String password = _passwordController.text;

                                    // Cek kredensial
                                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                    // gunakan URL http://10.0.2.2/
                                    final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                    'username': username,
                                    'password': password,
                                    });
                        
                                    if (request.loggedIn) {
                                        String message = response['message'];
                                        String uname = response['username'];
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                        );
                                        ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(
                                                SnackBar(content: Text("$message Selamat datang, $uname.")));
                                        } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                title: const Text('Login Gagal'),
                                                content:
                                                    Text(response['message']),
                                                actions: [
                                                    TextButton(
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                            Navigator.pop(context);
                                                        },
                                                    ),
                                                ],
                                            ),
                                        );
                                    }
                                },
                                child: const Text('Login'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to Register Page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterPage()),
                                );
                              },
                              child: const Text('Register'),
                            )
                        ],
                    ),
                ),
            );
        }
    }
    ```

    + pada file `main.dart` ubah `home: MyHomePage()` menjadi `home: LoginPage()`

[x] Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
   + buat `django-app` bernama `authentication` dan tambahkan ke `settings.py`
   + Install `django-cord-headers`
   + Tambah `corsheaders` dan `corsheaders.middleware.CorsMiddleware` ke `settings.py`
   + Tambahkan kode berikut ke `settings.py`
       ```
        CORS_ALLOW_ALL_ORIGINS = True
        CORS_ALLOW_CREDENTIALS = True
        CSRF_COOKIE_SECURE = True
        SESSION_COOKIE_SECURE = True
        CSRF_COOKIE_SAMESITE = 'None'
        SESSION_COOKIE_SAMESITE = 'None'
       ```
    + buat method login di `authentication/views.py`
      ```
      from django.shortcuts import render
      from django.contrib.auth import authenticate, login as auth_login
      from django.http import JsonResponse
      from django.views.decorators.csrf import csrf_exempt

      @csrf_exempt
      def login(request):
          username = request.POST['username']
          password = request.POST['password']
          user = authenticate(username=username, password=password)
          if user is not None:
              if user.is_active:
                  auth_login(request, user)
                  # Status login sukses.
                  return JsonResponse({
                      "username": user.username,
                      "status": True,
                      "message": "Login sukses!"
                      # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                  }, status=200)
              else:
                  return JsonResponse({
                      "status": False,
                      "message": "Login gagal, akun dinonaktifkan."
                  }, status=401)

          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login gagal, periksa kembali email atau kata sandi."
              }, status=401)
      ```
  + buat urls untuk routing dengan fungsi login
  + buat routing authentication di shopping_list
  + Pada flutter lakukan command berikut di terminal `flutter pub add provider ` dan `flutter pub add pbp_django_auth`
  + Tambahkan kode berikut di `main.dart` untuk menyediakan `CookieRequest` ke semua child widgets dengan `provider`
    ```
    return Provider(
              create: (_) {
                  CookieRequest request = CookieRequest();
                  return request;
              },
              ...
    )
    ```
[x] Membuat model kostum sesuai dengan proyek aplikasi Django

  + Buka endpoint JSON pada django
  + Salin data JSON ke situs Quicktype
  + Ubah Source type `JSON` dan languange `Dart`
  + Tempel JSON ke tempat yang disediakan dan pilih copy code
  + Buat file `product.dart` dalam folder `lib/models` dan salin copy code tadi ke dalam file yang baru kita buat.
   
[x] Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django
  + Buat file `list_product.dart` di `lib/screens` kemudian tambahkan kode berikut di dalamnya
    ```
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:game_sthar/models/product.dart';
    import 'package:game_sthar/widgets/left_drawer.dart';
    import 'package:game_sthar/screens/detaild_game.dart';

    class ProductPage extends StatefulWidget {
        const ProductPage({Key? key}) : super(key: key);

        @override
        _ProductPageState createState() => _ProductPageState();
    }

    class _ProductPageState extends State<ProductPage> {
    Future<List<Product>> fetchProduct() async {
        var url = Uri.parse(
            'http://127.0.0.1:8000/json/');
        var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Product
        List<Product> list_product = [];
        for (var d in data) {
            if (d != null) {
                list_product.add(Product.fromJson(d));
            }
        }
        return list_product;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text('Product'),
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchProduct(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                        return const Column(
                            children: [
                            Text(
                                "Tidak ada data produk.",
                                style:
                                    TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                            ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => InkWell(
                              onTap: (){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => DetailGame(product: snapshot.data![index]),
                                ),
                                );
                              },
                            child:Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                        "${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.amount}"),
                                        const SizedBox(height: 10),
                                        Text(
                                            "${snapshot.data![index].fields.description}")
                                    ],
                                    ),
                                )
                              )
                                );
                        }
                    }
                }));
        }
    }

    ```
  + Lakukan `flutter pub add http` di terminal dan pada `android/app/src/main/AndroidManifest.xml` tambahkan `<uses-permission android:name="android.permission.INTERNET" />`
  + Tambahkan `list_product.dart` ke `widgets/left_drawer.dart`
    ```
    ListTile(
      leading: const Icon(Icons.shopping_basket),
      title: const Text('Daftar Produk'),
      onTap: () {
          // Route menu ke halaman produk
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductPage()),
          );
      },
    ),
    ```
  + Pada `menu.dart` tambahkan kode berikut
    ```
    else if (item.name == "Lihat Item") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductPage()));
            }
    ```


[x] Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar item
  + Buat file `detail_game.dart` pada `lib/screens` dan tambahkan kode berikut
    ```
    import 'package:flutter/material.dart';
    import 'package:game_sthar/models/product.dart';

    class DetailGame extends StatelessWidget {
      final Product product;

      DetailGame({required this.product});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Game Details'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Judul: ${product.fields.name}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Category: ${product.fields.category}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Platform: ${product.fields.platform}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Deskripsi: ${product.fields.description}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Jumlah: ${product.fields.amount}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Harga: ${product.fields.price}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                // Display other details similarly...
              ],
            ),
          ),
        );
      }
    }

    ```
  + Tambahkan kode berikut di `list_product.dart`
    ```
    itemBuilder: (_, index) => InkWell(
                          onTap: (){
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => DetailGame(product: snapshot.data![index]),
                            ),
                            );
                          },
                          ...
    )
    ```
</details>