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
</deatils>