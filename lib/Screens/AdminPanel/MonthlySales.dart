import 'package:bijoy_helper/bijoy_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feed/DeveloperAccess/DeveloperAccess.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MonthlySales extends StatefulWidget {
  const MonthlySales({super.key});

  @override
  State<MonthlySales> createState() => _MonthlySalesState();
}

class _MonthlySalesState extends State<MonthlySales> {


  Map<String, double> dataMap = {
    "ক্রয়": 0,
    "বিক্রয়": 0,
    "লাভ": 0,
  };

  Map<String, double> ChickenSaleBuyData = {
    "ক্রয়": 0,
    "বিক্রয়": 0,
    "লাভ": 0,
  };


    Map<String, double> MedicinSaleBuyData = {
    "ক্রয়": 0,
    "বিক্রয়": 0,
    "লাভ": 0,
  };

  Map<String, double> KhuchraSaleBuyData = {
    "ক্রয়": 0,
    "বিক্রয়": 0,
    "লাভ": 0,
  };

  Map<String, double> bagAndkhuchraChartData = {
    "বস্তা": 0,
    "খুচরা": 0,
  };

    // এখানে Date দিয়ে Data fetch করতে হবে। 

  bool loading = false;

  var VisiblePaymentMonth = "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}";
  


     void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      // TODO: implement your code here

      setState(() {
        loading = true;
      });

          if (args.value is PickerDateRange) {

            try {
          final DateTime rangeStartDate = args.value.startDate;
          var adminSetDay = rangeStartDate.day;
          var adminSetMonth = rangeStartDate.month;
          var adminSetYear = rangeStartDate.year;

          var paymentMonth = "${adminSetMonth}/${adminSetYear}";

          VisiblePaymentMonth = paymentMonth;

          print("${adminSetDay}/${adminSetMonth}/${adminSetYear}");


          getChickenBuySaleLavData(paymentMonth);
          getMedicinBuySaleLavData(paymentMonth);
          getFeedBuySaleLavData(paymentMonth);
          getFeedKhuchraBuySaleLavData(paymentMonth);






          final DateTime rangeEndDate = args.value.endDate;
              
            } catch (e) {
              
            }
         
        } else if (args.value is DateTime) {
          final DateTime selectedDate = args.value;
          print(selectedDate);
        } else if (args.value is List<DateTime>) {
          final List<DateTime> selectedDates = args.value;
          print(selectedDates);
        } else {
          final List<PickerDateRange> selectedRanges = args.value;
          print(selectedRanges);
        }




      
      
    }



 var PaymentMonth = "${DateTime.now().month.toString()}/${DateTime.now().year.toString()}";


   var DataLoad = ""; 
  // Firebase All Customer Data Load
  double ThisMonthSaleBagNumber = 0;
  double ThisMonthKhuchraKg = 0;

  List AllFeedBuySaleLavData = [];

  Future<void> getFeedBuySaleLavData(String SaleMonth) async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('FeedSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("month", isEqualTo: SaleMonth);

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
        dataMap = {
                "ক্রয়": BuyingPrice,
                "বিক্রয়": SaleAmount,
                "লাভ": profit,
              };

          getFeedKhuchraBuySaleLavData(SaleMonth);
      });


print("____From_____DataMap_______${dataMap}");
    }

    
  }











  List AllFeedKhuchraBuySaleLavData = [];

  Future<void> getFeedKhuchraBuySaleLavData(String SaleMonth) async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('FeedKhuchraSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("month", isEqualTo: SaleMonth);

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
        KhuchraSaleBuyData = {
                "ক্রয়": BuyingPrice,
                "বিক্রয়": SaleAmount,
                "লাভ": profit,
              };
        
        bagAndkhuchraChartData = {
                "বস্তা": ThisMonthSaleBagNumber,
                "খুচরা": ThisMonthKhuchraKg,
              };
      });


print("____From_____DataMap_______${KhuchraSaleBuyData}");
    }

    
  }











List AllChickenBuySaleLavData = [];

  Future<void> getChickenBuySaleLavData(String SaleMonth) async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthChickenSaleInfoRef =
        FirebaseFirestore.instance.collection('ChickenSaleInfo');

    // // all Due Query Count
       Query _ThisMonthChickenSaleInfoRefQueryCount = _ThisMonthChickenSaleInfoRef.where("month", isEqualTo: SaleMonth);

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
      ChickenSaleBuyData = {
                "ক্রয়": BuyingPrice,
                "বিক্রয়": SaleAmount,
                "লাভ": profit,
              };

      });


print("____From_____DataMap_______${dataMap}");
    }

    
  }












List AllMedicinBuySaleLavData = [];

  Future<void> getMedicinBuySaleLavData(String SaleMonth) async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthChickenSaleInfoRef =
        FirebaseFirestore.instance.collection('MedicinSaleInfo');

    // // all Due Query Count
       Query _ThisMonthChickenSaleInfoRefQueryCount = _ThisMonthChickenSaleInfoRef.where("month", isEqualTo: SaleMonth);

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
      MedicinSaleBuyData = {
                "ক্রয়": BuyingPrice,
                "বিক্রয়": SaleAmount,
                "লাভ": profit,
              };

      });


print("____From_____DataMap_______${dataMap}");
    }

    
  }




 Future refresh() async{


    setState(() {
      
        //  getData(PaymentMonth);
         

    });

  }











  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed App',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
          "${VisiblePaymentMonth} বিক্রয় করা তথ্য"
              .toBijoy,
              style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: "SiyamRupali"),
              ),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'মুরগীর খাদ্য', icon: Image.asset("lib/Images/chicken_feed.png", width: 40, height: 40,)),
                Tab(text: 'মুরগীর বাচ্চা', icon: Image.asset("lib/Images/chicken_baby.png", width: 40, height: 40,)),
                Tab(text: 'মেডিসিন', icon: Image.asset("lib/Images/drugs.png", width: 40, height: 40,)),
              ],
            ),
          ),
          body: TabBarView(
            children: [


              
    loading? Center(
        child: CircularProgressIndicator(color: ColorName().appColor,)
      ):DataLoad == "0"? Center(child: Text("No Data Available")): RefreshIndicator(
        onRefresh: refresh,
        child: InkWell(
          onTap: ()async{

  
  
   showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            
            color:ColorName().appColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${VisiblePaymentMonth} বিক্রয় ${dataMap["বিক্রয়"]} টাকা লাভ ${dataMap["লাভ"]} টাকা ",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),
            ),),


            SizedBox(height: 10,),


          Container(
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  todayHighlightColor: ColorName().appColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
          
        
        ],
      );
    });
          },
          child: ListView.separated(
                itemCount: AllFeedBuySaleLavData.length,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
                itemBuilder: (BuildContext context, int index) {
              
                      //  DateTime paymentDateTime = (AllData[index]["PaymentDateTime"] as Timestamp).toDate();
              
              
                  return   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                         
                   decoration: BoxDecoration(
                    color: Colors.white,
              
                    border: Border.all(
                              width: 2,
                              color: ColorName().appColor
                            ),
                    borderRadius: BorderRadius.circular(10)      
                   ),
              
                      
                      child: Material(
                        elevation: 14,
                        child: ListTile(
                          
                          
                                           
                            
                                  title: Text("১২০ টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                             
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                          
                                     Text("ক্রেতার নামঃ মাহাদী হাসান",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                              
                                      Text("ক্রেতার ফোনঃ 01767298388",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("ক্রেতার ঠিকানাঃ জয়পুরহাট সদর, জয়পুরহাট",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                      Text("বস্তার সংখ্যাঃ 9",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("বস্তার ধরণঃ ২৫ কেজি",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       Text("বিক্রয় মূল্যঃ 9 টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       
                                       Text("ক্রয় মূল্যঃ 9 টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                      Text("বকেয়াঃ 9 টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                          
                                      Text("তারিখঃ ৯/১০/২০২৩",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                    ],
                                  ),
                            
                            
                            
                                ),
                      ),
                    ),
                  );
                },
              ),
        ),),




                








      // 2nd Tab 
         loading? Center(
        child: CircularProgressIndicator(color: ColorName().appColor,)
      ):DataLoad == "0"? Center(child: Text("No Data Available")): RefreshIndicator(
        onRefresh: refresh,
        child: InkWell(
          onTap: ()async{

  
  
   showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            
            color:ColorName().appColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${VisiblePaymentMonth} বিক্রয় ${ChickenSaleBuyData["বিক্রয়"]} টাকা লাভ ${ChickenSaleBuyData["লাভ"]} টাকা ",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),
            ),),


            SizedBox(height: 10,),


          Container(
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  todayHighlightColor: ColorName().appColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
          
        
        ],
      );
    });
          },
          child: ListView.separated(
                itemCount: AllChickenBuySaleLavData.length,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
                itemBuilder: (BuildContext context, int index) {
              
                      //  DateTime paymentDateTime = (AllData[index]["PaymentDateTime"] as Timestamp).toDate();
              
              
                  return   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                         
                   decoration: BoxDecoration(
                    color: Colors.white,
              
                    border: Border.all(
                              width: 2,
                              color: ColorName().appColor
                            ),
                    borderRadius: BorderRadius.circular(10)      
                   ),
              
                      
                      child: Material(
                        elevation: 14,
                        child: ListTile(
                          
                          
                                           
                            
                                  title: Text("১২০ টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                             
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                          
                                     Text("ক্রেতার নামঃ মাহাদী হাসান",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                              
                                      Text("ক্রেতার ফোনঃ 01767298388",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("ক্রেতার ঠিকানাঃ জয়পুরহাট সদর, জয়পুরহাট",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                      Text("বস্তার সংখ্যাঃ 9",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("বস্তার ধরণঃ ২৫ কেজি",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       Text("বিক্রয় মূল্যঃ 9 টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       
                                       Text("ক্রয় মূল্যঃ 9 টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                      Text("বকেয়াঃ 9 টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                          
                                      Text("তারিখঃ ৯/১০/২০২৩",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                    ],
                                  ),
                            
                            
                            
                                ),
                      ),
                    ),
                  );
                },
              ),
        ),),











// 3rd Tab 

 loading? Center(
        child: CircularProgressIndicator(color: ColorName().appColor,)
      ):DataLoad == "0"? Center(child: Text("No Data Available")): RefreshIndicator(
        onRefresh: refresh,
        child: InkWell(
          onTap: ()async{

  
  
   showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            
            color:ColorName().appColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${VisiblePaymentMonth} বিক্রয় ${MedicinSaleBuyData["বিক্রয়"]} টাকা লাভ ${MedicinSaleBuyData["লাভ"]} টাকা ",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),
            ),),


            SizedBox(height: 10,),


          Container(
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  todayHighlightColor: ColorName().appColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
          
        
        ],
      );
    });
          },
          child: ListView.separated(
                itemCount: AllMedicinBuySaleLavData.length,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
                itemBuilder: (BuildContext context, int index) {
              
                      //  DateTime paymentDateTime = (AllData[index]["PaymentDateTime"] as Timestamp).toDate();
              
              
                  return   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                         
                   decoration: BoxDecoration(
                    color: Colors.white,
              
                    border: Border.all(
                              width: 2,
                              color: ColorName().appColor
                            ),
                    borderRadius: BorderRadius.circular(10)      
                   ),
              
                      
                      child: Material(
                        elevation: 14,
                        child: ListTile(
                          
                          
                                           
                            
                                  title: Text("${AllMedicinBuySaleLavData[index]["SaleAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                             
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                          
                                     Text("ক্রেতার নামঃ ${AllMedicinBuySaleLavData[index]["CustomerName"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                              
                                      Text("ক্রেতার ফোনঃ ${AllMedicinBuySaleLavData[index]["CustomerPhoneNo"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("ক্রেতার ঠিকানাঃ ${AllMedicinBuySaleLavData[index]["CustomerAddress"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                      Text("মেডিসিনের সংখ্যাঃ ${AllMedicinBuySaleLavData[index]["MedicinNumber"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("মেডিসিনের ধরণঃ ${AllMedicinBuySaleLavData[index]["MedicinType"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       Text("প্রতি মেডিসিনের বিক্রয় মূল্যঃ ${AllMedicinBuySaleLavData[index]["MedicinSalePrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       
                                       Text("প্রতি মেডিসিন ক্রয় মূল্যঃ ${AllMedicinBuySaleLavData[index]["MedicinBuyingPrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),

                                      
                                      Text("লাভঃ ${AllMedicinBuySaleLavData[index]["Profit"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                      Text("বকেয়াঃ ${AllMedicinBuySaleLavData[index]["DueAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                          
                                      Text("তারিখঃ ${AllMedicinBuySaleLavData[index]["DateTime"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                    ],
                                  ),
                            
                            
                            
                                ),
                      ),
                    ),
                  );
                },
              ),
        ),),


            ],
          ),
        ),
      ),
    );
  }
}