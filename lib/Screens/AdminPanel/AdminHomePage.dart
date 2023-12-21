import 'package:bijoy_helper/bijoy_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feed/DeveloperAccess/DeveloperAccess.dart';
import 'package:feed/Screens/AdminPanel/DailySales.dart';
import 'package:feed/Screens/AdminPanel/DueCustomers.dart';
import 'package:feed/Screens/AdminPanel/MonthlySales.dart';
import 'package:feed/Screens/AdminPanel/YearlySales.dart';
import 'package:feed/Screens/StockManagement.dart';
import 'package:feed/Screens/StockUpload.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

class AdminHomePage extends StatefulWidget {


 const AdminHomePage({ super.key,});

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

List Header =["এই মাসের মুরগীর খাদ্যের বস্তার বিক্রয়ের হিসাব", "এই মাসের মুরগীর খাদ্যের খুচরা বিক্রয়ের হিসাব", "এই মাসের মুরগীর বাচ্চার বিক্রয়ের হিসাব", "এই মাসের মেডিসিন বিক্রির হিসাব"];
List AllChartData =[{
    "ক্রয়": 0.0,
    "বিক্রয়": 0.0,
    "লাভ": 0.0,
  },

  {
    "ক্রয়": 0.0,
    "বিক্রয়": 0.0,
    "লাভ": 0.0,
  },

  {
    "ক্রয়": 0.0,
    "বিক্রয়": 0.0,
    "লাভ": 0.0,
  },

  {
    "ক্রয়": 0.0,
    "বিক্রয়": 0.0,
    "লাভ": 0.0,
  }
  
  ];

bool loading = false;

double ThisMonthSaleBagNumber = 0;
  double ThisMonthKhuchraKg = 0;

  List AllFeedBuySaleLavData = [];

  Future<void> getFeedBuySaleLavData() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('FeedSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("month", isEqualTo: "${DateTime.now().month}/${DateTime.now().year}");

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        // FirstTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllFeedBuySaleLavData =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });

      double SaleAmount =0.0;
      double profit = 0.0;
      double BuyingPrice = 0.0;


      for (var i = 0; i < AllFeedBuySaleLavData.length; i++) {

        SaleAmount = SaleAmount + double.parse(AllFeedBuySaleLavData[i]["SaleAmount"].toString());

        profit = profit + double.parse(AllFeedBuySaleLavData[i]["Profit"].toString());

        BuyingPrice = BuyingPrice + (double.parse(AllFeedBuySaleLavData[i]["PerBagBuyingPrice"].toString())*double.parse(AllFeedBuySaleLavData[i]["SaleFeedBagNumber"].toString()));

        setState(() {
          ThisMonthSaleBagNumber = ThisMonthSaleBagNumber + int.parse(AllFeedBuySaleLavData[i]["SaleFeedBagNumber"].toString());

        });
        
      }


      setState(() {
        loading = false;
        
        AllChartData.insert(0,  {
                "ক্রয়": BuyingPrice,
                "বিক্রয়": SaleAmount,
                "লাভ": profit,
              });

         getFeedKhuchraBuySaleLavData();
      });



    }

    
  }







 List AllFeedKhuchraBuySaleLavData = [];

  Future<void> getFeedKhuchraBuySaleLavData() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('FeedKhuchraSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("month", isEqualTo: "${DateTime.now().month}/${DateTime.now().year}");

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        // FirstTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllFeedKhuchraBuySaleLavData =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });

      double SaleAmount =0.0;
      double profit = 0.0;
      double BuyingPrice = 0.0;


      for (var i = 0; i < AllFeedKhuchraBuySaleLavData.length; i++) {

        SaleAmount = SaleAmount + double.parse(AllFeedKhuchraBuySaleLavData[i]["SaleAmount"].toString());

        profit = profit + double.parse(AllFeedKhuchraBuySaleLavData[i]["Profit"].toString());

        BuyingPrice = BuyingPrice + (double.parse(AllFeedKhuchraBuySaleLavData[i]["PerKgBuyingPrice"].toString())*double.parse(AllFeedKhuchraBuySaleLavData[i]["SaleFeedKgNumber"].toString()));
        setState(() {
          
          ThisMonthKhuchraKg = ThisMonthKhuchraKg + int.parse(AllFeedKhuchraBuySaleLavData[i]["SaleFeedKgNumber"].toString());
        });
        
      }


      setState(() {
        loading = false;

        AllChartData.insert(1,  {
                "ক্রয়": BuyingPrice,
                "বিক্রয়": SaleAmount,
                "লাভ": profit,
              });
        
         getChickenBuySaleLavData();

      });


    }

    
  }





List AllChickenBuySaleLavData = [];

  Future<void> getChickenBuySaleLavData() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthChickenSaleInfoRef =
        FirebaseFirestore.instance.collection('ChickenSaleInfo');

    // // all Due Query Count
       Query _ThisMonthChickenSaleInfoRefQueryCount = _ThisMonthChickenSaleInfoRef.where("month", isEqualTo: "${DateTime.now().month}/${DateTime.now().year}");

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthChickenSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        // FirstTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllChickenBuySaleLavData =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });

      double SaleAmount =0.0;
      double profit = 0.0;
      double BuyingPrice = 0.0;


      for (var i = 0; i < AllChickenBuySaleLavData.length; i++) {

        SaleAmount = SaleAmount + double.parse(AllChickenBuySaleLavData[i]["SaleAmount"].toString());

        profit = profit + double.parse(AllChickenBuySaleLavData[i]["Profit"].toString());

        BuyingPrice = BuyingPrice + (double.parse(AllChickenBuySaleLavData[i]["ChickenBuyingPrice"].toString())*double.parse(AllChickenBuySaleLavData[i]["SaleChickenNumber"].toString()));

        
      }


      setState(() {
        loading = false;


        AllChartData.insert(2,  {
                "ক্রয়": BuyingPrice,
                "বিক্রয়": SaleAmount,
                "লাভ": profit,
              });

        
        getMedicinBuySaleLavData();
    

      });



    }

    
  }





List AllMedicinBuySaleLavData = [];

  Future<void> getMedicinBuySaleLavData() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthChickenSaleInfoRef =
        FirebaseFirestore.instance.collection('MedicinSaleInfo');

    // // all Due Query Count
       Query _ThisMonthChickenSaleInfoRefQueryCount = _ThisMonthChickenSaleInfoRef.where("month", isEqualTo: "${DateTime.now().month}/${DateTime.now().year}");

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthChickenSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        // FirstTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllMedicinBuySaleLavData =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });

      double SaleAmount =0.0;
      double profit = 0.0;
      double BuyingPrice = 0.0;


      for (var i = 0; i < AllMedicinBuySaleLavData.length; i++) {

        SaleAmount = SaleAmount + double.parse(AllMedicinBuySaleLavData[i]["SaleAmount"].toString());

        profit = profit + double.parse(AllMedicinBuySaleLavData[i]["Profit"].toString());

        BuyingPrice = BuyingPrice + (double.parse(AllMedicinBuySaleLavData[i]["MedicinBuyingPrice"].toString())*double.parse(AllMedicinBuySaleLavData[i]["MedicinNumber"].toString()));

        
      }


      setState(() {
        loading = false;

        AllChartData.insert(3,  {
                "ক্রয়": BuyingPrice,
                "বিক্রয়": SaleAmount,
                "লাভ": profit,
              });


      });



    }

    
  }






@override
  void initState() {


    getFeedBuySaleLavData();
    // getFeedKhuchraBuySaleLavData();
    // getChickenBuySaleLavData();
    // getMedicinBuySaleLavData();
   




    super.initState();
  }















  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
        body:  CustomScrollView(
    slivers: <Widget>[
      //2
      SliverAppBar(
        
        elevation: 15,
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
          "বিক্রয় করা তথ্য"
              ,
              style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: "Josefin Sans"),
              ),
          background: Lottie.asset('lib/Images/header_chicken.json',
          width: 100,
          height: 60,
         ),
        ),
      ),
      //3
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                         
                   decoration: BoxDecoration(
                    color: Colors.white,
              
                    border: Border.all(
                              width: 2,
                              color: Colors.white
                            ),
                    borderRadius: BorderRadius.circular(10)      
                   ),
              
                      
                      child: Material(
                        elevation: 14,
                        child: loading?Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),):  Column(
                          children: [


                            Text(
                                "${Header[index]}"
                                    ,
                                    style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: "Josefin Sans"),
                                    ),



                            Container(
                                                      height: 200,
                                                      child: Center(
                                                          child: PieChart(
                                                        dataMap: AllChartData[index],
                                                        animationDuration: Duration(
                                                            milliseconds: 800),
                                                        chartLegendSpacing: 22,

                                                        chartRadius:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width,

                                                        initialAngleInDegree: 0,
                                                        chartType: ChartType.disc,
                                                        ringStrokeWidth: 22,
                                                        centerText: "",
                                                        centerTextStyle:
                                                            const TextStyle(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                fontSize: 13,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontFamily:
                                                                    "Josefin Sans"),
                                                        legendOptions:
                                                            const LegendOptions(
                                                          showLegendsInRow: false,
                                                          legendPosition:
                                                              LegendPosition.right,
                                                          showLegends: true,
                                                          legendTextStyle:
                                                              TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        chartValuesOptions:
                                                            const ChartValuesOptions(
                                                          showChartValueBackground:
                                                              true,
                                                          showChartValues: true,
                                                          showChartValuesInPercentage:
                                                              false,
                                                          showChartValuesOutside:
                                                              false,
                                                          decimalPlaces: 1,
                                                        ),
                                                        // gradientList: ---To add gradient colors---
                                                        // emptyColorGradient: ---Empty Color gradient---
                                                      )),
                                                    ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          childCount: 4,
        ),
      ),
    ],
  ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 126, 62, 237),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
            
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                      
                      radius: 50,
                      child:Image.network("https://icons.veryicon.com/png/o/internet--web/prejudice/user-128.png", fit: BoxFit.cover,) //Text
                    ),
            
                    Positioned(left: 70,bottom: 1,child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 10,
                      child:Container() //Text
                    ))
            
            
                    ],
                  ), //CircleAvatar
                ), 
                
                
                
                
                    Center(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                              Text("নামঃ Mahadi Hasan",    
                                           
                                           style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  fontFamily: "Josefin Sans"),),
                  
                  
                  
                   Text("ইমেইলঃ inansoft@gmail.com",    
                                            
                                            style: TextStyle(
                                                   color: Colors.white,
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 14,
                                                   fontFamily: "Josefin Sans"),),
                  
                  
                  
                  Text("ফোনঃ 01283856836",    
                                           
                                           style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  fontFamily: "Josefin Sans"),),
                    
                    
                    
                  Text("ঠিকানাঃ জয়পুরহাট সদর, জয়পুরহাট",    
                                           
                                           style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  fontFamily: "Josefin Sans"),),
              ],
                      ),
                    )
                
                      
                
            
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Material(
              elevation: 15,
              child: ListTile(
                trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/stock.png", width: 40, height: 40,),
                title: Text("স্টক দেখুন",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 0,
                onTap: () => selectDestination(0),
              ),
            ),

            SizedBox(height: 10,),


           Material(
            elevation: 15,
             child: ListTile(
              trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/balance.png", width: 40, height: 40,),
                title: Text("স্টক যুক্ত করুন",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(1),
              ),
           ),


            SizedBox(height: 10,),



            Material(
              elevation: 15,
              child: ListTile(
                trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/cash-on-delivery.png", width: 40, height: 40,),
                title: Text("বিক্রয় করুন",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2),
              ),
            ),

            SizedBox(height: 10,),
         
        
            Material(
              elevation: 15,
              child: ListTile(
                trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/money.png", width: 40, height: 40,),
                title: Text("মাসিক হিসাব",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
              ),
            ),


            SizedBox(height: 10,),



            Material(
              elevation: 15,
              child: ListTile(
                trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/money.png", width: 40, height: 40,),
                title: Text("দৈনিক হিসাব",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 4,
                onTap: () => selectDestination(4),
              ),
            ),

            SizedBox(height: 10,),


            Material(
              elevation: 15,
              child: ListTile(
                trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/money.png", width: 40, height: 40,),
                title: Text("বাৎসরিক হিসাব",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 5,
                onTap: () => selectDestination(5),
              ),
            ),


            SizedBox(height: 10,),



            Material(
              elevation: 15,
              child: ListTile(
                trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/due.png", width: 40, height: 40,),
                title: Text("বকেয়া কাস্টমার",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 6,
                onTap: () => selectDestination(6),
              ),
            ),


            Divider(
              height: 1,
              thickness: 1,
            ),


            Padding(padding: EdgeInsets.all(6), child: Text("Settings"),),


            Material(
              elevation: 15,
              child: ListTile(
                trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/reload.png", width: 40, height: 40,),
                title: Text("Change Password",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 4,
                onTap: () => selectDestination(4),
              ),
            ),


            SizedBox(height: 10,),


            Material(
              elevation: 15,
              child: ListTile(
                trailing: Icon(Icons.arrow_circle_right_outlined),
                leading: Image.asset("lib/Images/log-out.png", width: 40, height: 40,),
                title: Text("Log Out",    
                                             
                                             style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    fontFamily: "Josefin Sans"),),
                selected: _selectedDestination == 4,
                onTap: () => selectDestination(4),
              ),
            ),



            




          ],
        ),
      ),
    
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });

    if (index == 0) {

       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StockShow()));
      
    } else if (index == 1) {

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StockUpload()));
      
    }
    else if (index == 2) {

       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StockShow()));
      
    }

    else if (index == 3) {

       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MonthlySales()));
      
    }

    else if (index == 4) {

       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DailySales()));
      
    }

    else if (index == 5) {

       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const YearlySales()));
      
    }

    else if (index == 6) {

       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DueCustomer()));
      
    }




  }
}