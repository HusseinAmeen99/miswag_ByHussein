import 'package:flutter/material.dart';
class Modalbottomsheet extends StatelessWidget {
  const Modalbottomsheet({super.key, required this.image, required this.nameOfProduct, required this.price, });

  final String image;
  final String nameOfProduct;
  final String price;
  //final int count;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image,width: 70,height: 70,),
      title: Text(nameOfProduct),
      subtitle: Text('\$$price'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.remove),
          SizedBox(width: 3,),
          Text('1',style: TextStyle(fontSize: 18),),
          SizedBox(width: 3,),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
