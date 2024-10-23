import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:second_app/src/providers/cartprovider.dart';
import 'package:second_app/src/views/cardpage.dart';

import '../models/cartmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
double total = 0;

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Cart",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(24, 23, 37, 1)),)),
      ),
      body: Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider cartProvider, Widget? child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(itemCount: cartProvider.products.length,
                  itemBuilder: (context, index) {
                    final CartItem cartItem = cartProvider.products.values.toList()[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Card(
                        color: const Color.fromRGBO(241, 244, 251, 1),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                  cartProvider.removeProduct(cartItem.id);
                                }, icon: const Icon(Icons.close,size: 15,color: Color.fromRGBO(161, 161, 161, 1),)),
                              ],
                            ),
                            ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Image(image: NetworkImage(cartItem.image),width: 87.w,height: 77.h,),
                              ),
                              title: Text(cartItem.title,maxLines: 1,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(99, 66, 232, 1)),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Geeta Collection",style: TextStyle(fontSize: 9.sp,fontWeight: FontWeight.w700,color:const Color.fromRGBO(161, 161, 161, 1)),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              text: "\$${cartItem.price} ",
                                              style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w900),
                                              children: [
                                                TextSpan(
                                                  text: "USD",
                                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900)
                                                )
                                              ]
                                            )
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(onPressed: (){
                                                cartProvider.removeQuantity(cartItem.id);
                                              },iconSize: 20, icon:const Icon(Icons.remove)),
                                              Text(cartItem.quantity.toString(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w900),),
                                              IconButton(onPressed: (){
                                                cartProvider.addQuantity(cartItem.id);
                                              },iconSize: 20, icon:const Icon(Icons.add))
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              horizontalTitleGap: 0,
                              minVerticalPadding: 0,
                            )
                          ],
                        )
                      ),
                    );
                },),
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CardPage();
                },));
              },style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(99, 66, 232, 1),
                fixedSize: Size(354.w, 54.h),
              ), child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.exit_to_app,size: 18,color: Colors.white,),
                  SizedBox(width: 12.w,),
                  Text("Go to Checkout",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 11.sp,color: Colors.white),),
                  Padding(
                    padding:EdgeInsets.only(left: 50.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromRGBO(71, 44, 182, 1),
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("\S${cartProvider.total.toStringAsFixed(2)}",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Colors.white),),
                        )),
                  )
                ],
              )),
              SizedBox(height: 20.h,),
            ],
          );
        },

      ),
    );
  }
}
