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


          getData(paymentMonth);





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

List  AllData = [{},{},{},{},{}];
    int moneyAdd = 0;

  CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('CourseFeePayHistory');

Future<void> getData(String paymentDate) async {
    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();


    Query query = _collectionRef.where("month", isEqualTo: paymentDate);
    QuerySnapshot querySnapshot = await query.get();

    // Get data from docs and convert map to List
     AllData = querySnapshot.docs.map((doc) => doc.data()).toList();


     moneyAdd = 0;




     if (AllData.length == 0) {
       setState(() {
      
        DataLoad = "0";
        loading = false;
      });
       
     } else {

      setState(() {
        DataLoad = "";
        
      });

      for (var i = 0; i < AllData.length; i++) {

       var money = AllData[i]["pay"];
      int moneyInt = int.parse(money);

      

      setState(() {
        moneyAdd = moneyAdd + moneyInt;
        AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
        loading = false;
      });
       
     }

     print(moneyAdd);
       
     }









    //  for (var i = 0; i < AllData.length; i++) {

    //    var money = AllData[i]["SalePrice"];
    //   int moneyInt = int.parse(money);

      

    //   setState(() {
    //     moneyAdd = moneyAdd + moneyInt;
    //   });
       
    //  }

    //  print(moneyAdd);

    //  setState(() {
    //    AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //  });

    print(AllData);
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
          "${VisiblePaymentMonth} বিক্রিয় করা তথ্য"
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
              child: Text("আজকের বিক্রয় ১১০ টাকা লাভ ১১০ টাকা ",    
                                       
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
                itemCount: AllData.length,
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
              child: Text("আজকের বিক্রয় ১১০ টাকা লাভ ১১০ টাকা ",    
                                       
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
                itemCount: AllData.length,
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
              child: Text("আজকের বিক্রয় ১১০ টাকা লাভ ১১০ টাকা ",    
                                       
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
                itemCount: AllData.length,
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


            ],
          ),
        ),
      ),
    );
  }
}