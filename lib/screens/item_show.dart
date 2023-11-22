import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';
import 'package:game_sthar/screens/gamelist_form.dart';
import '../models/item.dart';


class ShopShowItem extends StatefulWidget {
  const ShopShowItem({super.key});

  @override
 State<ShopShowItem> createState() => _ShopShowItem();}

class _ShopShowItem extends State<ShopShowItem> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Data Game',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Game',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return GameItemCard(item: productList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameItemCard extends StatelessWidget {
  final ItemData item;

  GameItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: ListTile(
        title: Text(item.judul ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Harga: ${item.harga.toString()}'),
            Text('Deskripsi: ${item.deskripsi ?? ''}'),
            Text('Jumlah: ${item.jumlah.toString()}'),
            Text('Genre: ${item.genre ?? ''}'),
            Text('Platform: ${item.platform ?? ''}'),
          ],
        ),
      ),
    );
  }
}