
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
   ProductItem({super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rate,
    required this.ratecount,
    required this.onTap,
     required this.icon,
  });
  final String name;
  final String image;
  final String price;
  final String rate;
  final String ratecount;
  void Function()? onTap;
  final Widget icon;
  final int count=1;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(5),
                    width: 170,
                    height: 170,
                    child: Image.asset(image),
                  ),
                ),
                Positioned(
                      bottom: 1,
                      right: 5,
                      child: GestureDetector(
                        onTap: onTap,
                        child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: icon,
                        ),
                      ),
                  ),
              ],
            ),
            SizedBox(height: 5,),
            Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/logo/star.png',width: 16,),
                SizedBox(width: 5,),
                Text(rate),
                Text(ratecount),
              ],
            ),
            Text('$price \$'),
          ],
        ),
      ),
    );
  }
}
