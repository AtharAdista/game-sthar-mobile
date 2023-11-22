class ItemData {
  String? id;
  String? judul;
  String? deskripsi;
  String? genre;
  String? platform;
  int? jumlah;
  int? harga;

  ItemData({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.genre,
    required this.platform,
    required this.jumlah,
    required this.harga,
  });

  static List<ItemData> itemList() {
    return [
      ItemData(
          id: '01',
          judul: 'Zelda',
          deskripsi: 'Just enjoy',
          genre: 'Adventure',
          platform: 'Nitendo Switch',
          jumlah: 5,
          harga: 500000),
    ];
  }
}
