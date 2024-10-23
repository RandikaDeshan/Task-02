import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_app/src/views/splashpage.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            const Image(image: NetworkImage("https://s3-alpha-sig.figma.com/img/c12d/6b4c/e30595d05b3f5509eace87d2e161fa10?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iuzZAB~bdMYK~D7-sSMMj3L5xW6X8KUKQX654rRRAG5XW59LW6JSi71lZyC6c4csKLZVoGSTys1d5ands-vMMPEM6xOZ5w9he9tYpkh~k-yCiZOJD~A73~jBP-1EVGo8KYY2weKSAFJwF1NlQ6BlFeeVSgwwGa8Lv2pWJxwVfop9FVp0l8vfTFUOiN-s5UfPlhxrlZbJZo9NijdyZ1v~o6gW8di9gS73yOh6ey0x2KC1vYxrNzwEjiHhhAijMkyjXVA669p0R7guhN3Ict2wFP4~4XUop3WKPGTWaGOhF6uBZTI7TpKR22FttslY5dq11MLaZEYZzLW4~eQjNvD1wQ__"),fit: BoxFit.cover,),
            Positioned(
                top: 491.h,

                child: Text("Geeta.",style: TextStyle(fontSize: 104.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(255, 255, 255, 1)),)),
            Positioned(
                top: 696.h,
                child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(222.w, 54.h),
                      side: const BorderSide(color: Color.fromRGBO(255, 255, 255, 1))
                    ),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const SplashPage();
                    },));}, child: Text("Shop Now",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w900,color:const Color.fromRGBO(255, 255, 255, 1)))))
          ],
        ),
      ),
    );
  }
}
