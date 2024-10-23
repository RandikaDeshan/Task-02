import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/src/views/homepage.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 47.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/images/Screenshot.png")),
              Text("Congrats! Your Order has been placed",textAlign: TextAlign.center,style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(24, 23, 37, 1)),),
              Padding(
                padding: EdgeInsets.only(left: 47.w,right: 47.w,top: 33.h),
                child: Text("Your items has been placcd and is on it’s way to being processed",textAlign: TextAlign.center,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color:const Color.fromRGBO(161, 161, 161, 1)),),
              ),
              SizedBox(height: 62.h,),
              TextButton(onPressed: (){},style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(99, 66, 232, 1),
                fixedSize: Size(316.w, 54.h)
              ), child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image:const AssetImage("assets/images/Cart icon.png"),height: 24.h,width: 24.w,),
                  SizedBox(width: 20.w,),
                  Text("Track Order",style: TextStyle(fontWeight: FontWeight.w900 ,fontSize:11.sp,color: Colors.white),)
                ],
              )),
              SizedBox(height: 16.h,),
              TextButton(onPressed: (){},style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(99, 66, 232, 1),
                  fixedSize: Size(316.w, 54.h)
              ), child: Text("Track Order",style: TextStyle(fontWeight: FontWeight.w900 ,fontSize:11.sp,color: Colors.white),)),
              SizedBox(height: 19.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back,size: 12,),
                  SizedBox(width: 9.w,),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    },));
                  },child: Text("Back to home",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w900),)),

                ],
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
