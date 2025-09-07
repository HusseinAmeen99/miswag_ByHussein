import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project2_fitch_sonic/product_item.dart';

import 'ModalBottomSheet.dart';
import 'model.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
List<String> items=[
  "assets/bannars/Slider 1.png",
  "assets/bannars/Slider 2.png",
  "assets/bannars/Slider 3.png",
];

List<CategoriesModel> categorymodel=[
  CategoriesModel(name:'Fruits ', image: 'assets/category/image 38.png'),
  CategoriesModel(name:'Milk & Egg', image: 'assets/category/image 39.png'),
  CategoriesModel(name:'Beverages', image: 'assets/category/image 37.png'),
  CategoriesModel(name:'Laundry', image: 'assets/category/image 41.png'),
  CategoriesModel(name:'Vegetables', image: 'assets/category/image 36.png'),
];

List<ProductModel>  productmodel=[
   ProductModel(name: 'Banana', image: 'assets/product/image 44.png', price: '3.99\$', rate: '4.8', ratecount: '287'),
   ProductModel(name: 'Pepper', image: 'assets/product/image 42.png', price: '2.99\$', rate: '4.8', ratecount: '287'),
   ProductModel(name: 'Orange', image: 'assets/product/orange.png', price: '4.99\$', rate: '4.8', ratecount: '287'),
   ProductModel(name: 'Lemone', image: 'assets/product/lemone.png', price: '4.99\$', rate: '4.8', ratecount: '287'),

 ];

List basketList=[];

void toggleSelection (ProductModel product){
  setState(() {
    if(basketList.contains(product)) {
      basketList.remove(product);
    }
    else{
      basketList.add(product);
    }
      }
  );
}
bool isSelected (ProductModel product) => basketList.contains(product);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.motorcycle_rounded),
            SizedBox(width: 10,),
            Text('Miswag'),
            SizedBox(width: 10,),
            //Icon(Icons.arrow_forward_ios),
            Spacer(),
            SvgPicture.asset('assets/icons/basket.svg'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              //the first part in page with animation
              CarouselSlider.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                   Image.asset(items[itemIndex]),
                options: CarouselOptions(
                  height: 222,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  //onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              //categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:List.generate(categorymodel.length, (index) {
                    return Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: Image.asset(categorymodel[index].image,width: 60,),
                        ),
                        SizedBox(height: 8,),
                        Text(categorymodel[index].name),
                      ],
                    ),
          
                    );
                  },)
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fruits',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: (){}, child: Text('See all',style: TextStyle(color: Colors.green),)),
          
                       ],
                     ),
                    ),
              //product
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:List.generate(productmodel.length, (index) {
                      return ProductItem(name: productmodel[index].name,
                        image: productmodel[index].image,
                        price: productmodel[index].price,
                        rate: productmodel[index].rate,
                        ratecount: productmodel[index].ratecount,
                        onTap: () {
                        toggleSelection(productmodel[index]);
                        },
                        icon: isSelected(productmodel[index]) ? Icon(Icons.remove) :Icon(Icons.add) ,);
                    },)
                ),
              ),
          
              //Spacer(),
              SizedBox(height: 30,),
              //cart widget
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 165,
                        child: ListView.builder(
                          itemCount: basketList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                              ),
                              child: Image.asset(basketList[index].image),
                            ),
                          );
                        },),
                      ),
          
                      Spacer(),
                      Container(
                        width: 2,
                        height: 40,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(context: context,
                             // isScrollControlled: true,
                              builder: (context) {
                            if(basketList.isEmpty)
                              {return  Center(child: Text('Empty'),);}
                            else
                                {return Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: basketList.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                                leading: Image.asset(basketList[index].image,width: 70,height: 70,),
                                                title: Text(basketList[index].name),
                                                subtitle: Text(basketList[index].price),
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
                                          ,),
                                    ),
                                    Container(
                                      child: Text('Go to the cart',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                      padding: EdgeInsets.only(left: 45,top: 12),
                                      width: 200,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(height: 15,),

                                  ],
                                );
                                }
                              },

                          );
                        },
                          child: Text('View Basket',style: TextStyle(color: Colors.white,fontSize: 16),)),
                      SizedBox(width: 5,),
                      Badge(
                          label: Text(basketList.length.toString()),
                          child: SvgPicture.asset('assets/icons/basket.svg',color: Colors.white,)),
                      SizedBox(width: 15,),
                    ],
                  ),
              ),
              ),
            ],
          ),
      ),
    );
  }
}
