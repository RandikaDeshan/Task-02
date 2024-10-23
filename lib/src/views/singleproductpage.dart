import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import 'package:second_app/src/models/productmodel.dart';
import 'package:second_app/src/services/apiservice.dart';
import 'package:second_app/src/views/cartpage.dart';
import '../providers/cartprovider.dart';

class SingleProductPage extends StatefulWidget {
  final int id;
  const SingleProductPage({super.key, required this.id});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

int number = 1;

class _SingleProductPageState extends State<SingleProductPage> {

  final ApiService apiService =ApiService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 244, 251, 1),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: const Icon(Icons.favorite_border),
          )
        ],
        
      ),
      body: FutureBuilder<Product>(future: apiService.fetchSingleData(widget.id), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if(!snapshot.hasData){
          return const Center(child: Text("No data"));
        }
        else if(snapshot.hasError){
          return Center(child: Text("Error : ${snapshot.error}"));
        }else{

          Product product = snapshot.data!;
          return SingleChildScrollView(
            child: Container(
              color: const Color.fromRGBO(241, 244, 251, 1),
              child: Column(
                children: [
                  Container(
                    color: const Color.fromRGBO(241, 244, 251, 1),
                    height: 344.h,
                    width: double.infinity,
                    child: Center(child: Image(image: NetworkImage(product.image),height: 225.h,))),
                  Container(
                    decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h,),
                          Text(product.category == "men's clothing"?"Geeta Mens":product.category =="jewelery"?"Geeta Jewelery":product.category == "electronics" ? "Geeta Electronics":"Geeta Women",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text(product.title,maxLines: 1,style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w900),)),
                              Text.rich(TextSpan(
                                  style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w900),
                                  text: "\$${product.price.toString()} ",
                                  children: [
                                    TextSpan(
                                        text: "USD",
                                        style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900)
                                    )
                                  ]
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              RatingBar.builder(allowHalfRating: true,ignoreGestures: true,itemSize: 14,initialRating: product.rating['rate'],itemBuilder: (context, index) {
                                return const Icon(Icons.star,color: Color.fromRGBO(252, 221, 141, 1),);
                              }, onRatingUpdate: (value) {
                                print(value);
                              },),
                              Text(product.rating['rate'].toString(),style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w400,color: const Color.fromRGBO(196, 196, 196, 1)),),
                            ],
                          ),
                          SizedBox(height: 29.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){
                                        if(number>1){
                                        setState(() {
                                          number --;
                                        });}
                                      },iconSize: 18, icon: const Icon(Icons.remove,)),
                                      Text("$number",style:TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w900),),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          number ++;
                                        });
                                      },iconSize: 18, icon:const Icon(Icons.add,)),
                                    ],
                                  )
                                ],
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.file_upload_outlined))
                            ],
                          ),
                          SizedBox(height: 26.h,),
                          Text("DESCRIPTION",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w800),),
                          Text(product.description,textAlign: TextAlign.justify,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                          SizedBox(height: 30.h,),
                          Text("SELECT SIZE",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w800),),
                          SizedBox(height: 5.h,),
                          GroupButton(options: GroupButtonOptions(unselectedColor: Color.fromRGBO(241, 244, 251, 1),
                              borderRadius: BorderRadius.circular(6),buttonHeight: 48.h,
                            buttonWidth: 48.w,selectedColor:const Color.fromRGBO(99, 66, 232, 1),
                          ),onSelected: (value, index, isSelected) {
                            print("$value,$index");
                          },
                            buttons: const [
                            "S",
                            "M",
                            "L",
                            "XL",
                            "XXL"
                          ],isRadio: true,),
                          SizedBox(height: 65.h,),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 20.h),
                            child: Consumer<CartProvider>(
                              builder: (BuildContext context, CartProvider cartProvider, Widget? child) {
                                return TextButton(onPressed: () {
                                  cartProvider.addToCart(product.id.toString(), product.title, product.image, product.price,number);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return const CartPage();
                                      },));
                                }, style: TextButton.styleFrom(
                                  fixedSize: Size(354.w, 54.h),
                                  backgroundColor: const Color.fromRGBO(
                                      99, 66, 232, 1),
                                ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.shopping_bag_outlined, size: 24,
                                        color: Color.fromRGBO(255, 255, 255, 1),),
                                      SizedBox(width: 20.w,),
                                      Text("ADD TO CART", style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w900,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1)),)
                                    ],
                                  ),);
                              })
                          )
                        ],
                      ),
                    ),
                  )
                   ],
                      ),
            ),
          );
      }},),
    );
  }
}
