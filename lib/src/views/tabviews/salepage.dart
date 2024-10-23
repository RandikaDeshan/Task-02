import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/productmodel.dart';
import '../../services/apiservice.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

bool viewmode = true;

class _SalePageState extends State<SalePage> {

  final ApiService apiService =ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(future: apiService.fetchAllData(), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if(!snapshot.hasData || snapshot.data!.isEmpty){
          return const Center(child: Text("No data"));
        }
        else if(snapshot.hasError){
          return Center(child: Text("Error : ${snapshot.error}"));
        }
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 49.h,bottom: 33.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter & Sort",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900),),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          viewmode = true;
                        });
                      },iconSize: 18, icon:Icon(Icons.grid_view,color: !viewmode? Colors.black: const Color.fromRGBO(99, 66, 232, 1),),),
                      IconButton(onPressed: (){
                        setState(() {
                          viewmode = false;
                        });
                      },iconSize: 18, icon:Icon(Icons.square,color: viewmode? Colors.black: const Color.fromRGBO(99, 66, 232, 1))),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: viewmode?2:1,childAspectRatio:viewmode? 0.46:1),scrollDirection: Axis.vertical,itemCount: snapshot.data!.length, itemBuilder: (context, index) {
                Product product = snapshot.data![index];
                if(product.category == "electronics"){
                return Container(
                    color: Color.fromRGBO(241, 244, 251, 1),
                    height: 276.h,
                    width: 170.w,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.favorite_border,size: 24,)
                          ],
                        ),
                        Image(image: NetworkImage(product.image),height: 131.h,),
                        SizedBox(height: 47.h,),
                        Text(product.title,textAlign:TextAlign.center,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900),),
                        Text("\$${product.price.toString()} usd",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(161, 161, 161, 1)),),
                      ],
                    ),

                );
              }},),
            )
          ],
        );
      },),
    );
  }
}
