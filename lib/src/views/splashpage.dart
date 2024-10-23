import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/src/views/homepage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:const BoxDecoration(image: DecorationImage(image: NetworkImage("https://s3-alpha-sig.figma.com/img/a215/f454/f0f02e1481620de7743e7df186bd0b9a?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cOi8cnkdSZZLyO~Gv9QS0t4ZeBHNivOKRAPl2aWBmEgts2EkRP9J9e0BPfbuOvPKSYsWuNeSOBkcOU-oWXo9jlV9omQn89M8N66cPT~SfyCvFI4HxPdnv0NX7IjfNCjfAP42ds1t493EmrBtncnaRsqIroSdIZVvVjIjoXrcluTq~kAllyRO4FzW3-~D6zriTAlpATRMvYMhLLgzt01ArpYkLzbC2t1tf01Ld8vUmjY4Aezv7~9c6rjUhiB97SvYhJ~5LbTl7aG4bcj-UarxFtVps8aW2wpG52GZ4ZtkB-2ijG6gZ46a6eb6Q2wkN3rMgQex~aHDYKqdjpKBuQ0Reg__"),fit: BoxFit.cover,opacity: 0.1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h,),
            Text("Geeta.",style: TextStyle(fontSize: 44.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(0, 0, 0, 1)),),
            Padding(
              padding:  EdgeInsets.only(top: 147.h,left: 99.w,right: 99.w),
              child: Text("Create your fashion in your own way",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w,right: 50.w,top: 32.h),
              child: Text("Each men and women has their own style, Geeta help you to create your unique style.",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color:const Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 49.h,),
            TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(222.w, 54.h),
                  side: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1))
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  },));
                }, child: Text("LOG IN",style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(0, 0, 0, 1)),)),
            SizedBox(height: 13.h),
            Text("- or -",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color:const Color.fromRGBO(0, 0, 0, 1))),
            SizedBox(height: 13.h),
            TextButton(
                style: TextButton.styleFrom(
                    fixedSize: Size(222.w, 54.h),backgroundColor:const Color.fromRGBO(99, 66, 232, 1)
                ),
                onPressed: (){}, child: Text("Register",style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(255, 255, 255, 1)))),
          ],
        ),
      ),
    );
  }
}
