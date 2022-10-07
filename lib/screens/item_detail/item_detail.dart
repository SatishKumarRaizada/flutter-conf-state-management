import 'package:flutter/material.dart';
import 'package:my_shopping/config/model/container.dart';
import 'package:my_shopping/widgets/button.dart';

class ItemDetailScreen extends StatefulWidget {
  final ItemListModel itemDetail;
  const ItemDetailScreen({Key? key, required this.itemDetail})
      : super(key: key);
  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    final _width = _size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.itemDetail.name} Detail'),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: FlutterTextButton(
          buttonText: 'Add Item',
          buttonWidth: _width,
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  widget.itemDetail.image!,
                  width: _width * 0.6,
                ),
                SizedBox(height: _height * 0.02),
                _itemRow('Name:', widget.itemDetail.name!),
                SizedBox(height: _height * 0.02),
                _itemRow('Age:', widget.itemDetail.age!),
                SizedBox(height: _height * 0.02),
                _itemRow('Condition:', widget.itemDetail.condition!),
                SizedBox(height: _height * 0.02),
                _itemRow('Loadability:', widget.itemDetail.loadability!),
                SizedBox(height: _height * 0.02),
                _itemRow('Details:', widget.itemDetail.description!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemRow(String title, String value) {
    final _size = MediaQuery.of(context).size;
    final _width = _size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(width: _width * 0.02),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'MaerskBold',
            ),
          ),
        ),
      ],
    );
  }
}
