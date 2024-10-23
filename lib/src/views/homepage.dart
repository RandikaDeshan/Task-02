import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:second_app/src/providers/cartprovider.dart';
import 'package:second_app/src/views/tabviews/menspage.dart';
import 'package:second_app/src/views/tabviews/popularpage.dart';
import 'package:second_app/src/views/tabviews/salepage.dart';
import 'package:second_app/src/views/tabviews/womenspage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:Text("Geeta.",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w900,color: const Color.fromRGBO(0, 0, 0, 1)),),
          actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.search))],
          bottom: TabBar(tabs: [
            Tab(child: Text("Popular",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 17.sp,),),),
            Tab(child: Text("Mens",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 17.sp,),)),
            Tab(child: Text("Womens",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 17.sp,),)),
            Tab(child: Text("Sale",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 17.sp,),)),
          ],dividerHeight: 0,indicatorColor: const Color.fromRGBO(99, 66, 232, 1),unselectedLabelColor:const Color.fromRGBO(161, 161, 161, 1),),
        ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 28.w),
            child: const TabBarView(children: [
              PopularPage(),
              MensPage(),
              WomensPage(),
              SalePage()
            ]),
          ),




      ),
    );
  }
}
