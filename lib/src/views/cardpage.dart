import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/src/views/successpage.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Credit / Debit card",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(45, 12, 87, 1)),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/images/Card.png")),
            const Icon(Icons.camera_alt_outlined,size: 34,color: Color.fromRGBO(149, 134, 168, 1),),
            SizedBox(height: 35.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Name on card",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900),),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 1,color: Color.fromRGBO(210, 210, 210, 1))),
                      hintText: "Varat Singh Sharma",
                      hintStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color.fromRGBO(161, 161, 161, 1)),
                    ),
                  ),
                  SizedBox(height: 34.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Card number",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900),),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Image(image: const AssetImage("assets/images/mc_symbol 1.png"),height: 20.h,width: 32.35.w,),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 1,color: Color.fromRGBO(210, 210, 210, 1))),
                      hintText: "4747  4747  4747  4747",
                      hintStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color.fromRGBO(161, 161, 161, 1)),
                    ),
                  ),
                  SizedBox(height: 34.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expiry date",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900),),
                          SizedBox(height: 10.h,),
                          SizedBox(
                            height:48.h,
                            width: 166.w,
                            child: TextFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 1,color: Color.fromRGBO(210, 210, 210, 1))),
                                hintText: "07/21",
                                hintStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color.fromRGBO(161, 161, 161, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 22.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CVC",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900),),
                          SizedBox(height: 10.h,),
                          SizedBox(
                            height:48.h,
                            width: 166.w,
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: Image(image: const AssetImage("assets/images/Hint.png"),height: 20.h,width: 32.35.w,),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 1,color: Color.fromRGBO(210, 210, 210, 1))),
                                hintText: "474",
                                hintStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color.fromRGBO(161, 161, 161, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 25.h,),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SuccessPage();
              },));
            },style: TextButton.styleFrom(
              fixedSize: Size(354.w, 54.h),
              backgroundColor: const Color.fromRGBO(99, 66, 232, 1)
            ), child: Text("USE THIS CARD",style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w900,color: Colors.white),)),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}
