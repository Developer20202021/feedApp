import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bijoy_helper/bijoy_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feed/DeveloperAccess/DeveloperAccess.dart';
import 'package:flutter/material.dart';

class DueCustomer extends StatefulWidget {
  const DueCustomer({super.key});

  @override
  State<DueCustomer> createState() => _DueCustomerState();
}

class _DueCustomerState extends State<DueCustomer> {

  TextEditingController PhoneNumberSearchController = TextEditingController();
  TextEditingController MessageController = TextEditingController();
  TextEditingController ReceiveAmountController = TextEditingController();


bool loading = false;



String FourthTabDataLoad ="";

double TabDueAmount =0.0;

List AllFeedKhuchraDueCustomer = [];

  Future<void> getFeedKhuchraDueCustomer() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('FeedKhuchraSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("DueAmount", isNotEqualTo: 0);

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        FourthTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllFeedKhuchraDueCustomer =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });




      for (var i = 0; i < AllFeedKhuchraDueCustomer.length; i++) {

        TabDueAmount= TabDueAmount + double.parse(AllFeedKhuchraDueCustomer[i]["DueAmount"].toString());


        
      }


      setState(() {
        loading = false;
  
        
      
      });

    }

    
  }





String FirstTabDataLoad = "";

double FirstTabDueAmount =0.0;

List AllFeedDueCustomer = [];

  Future<void> getFeedDueCustomer() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('FeedSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("DueAmount", isNotEqualTo: 0);

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        FirstTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllFeedDueCustomer =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });




      for (var i = 0; i < AllFeedDueCustomer.length; i++) {

        FirstTabDueAmount = FirstTabDueAmount + double.parse(AllFeedDueCustomer[i]["DueAmount"].toString());


        
      }


      setState(() {
        loading = false;
  
        
      
      });

    }

    
  }




String SecondTabDataLoad ="";

double SecondTabDueAmount=0.0;

List AllChickenDueCustomer = [];

  Future<void> getChickenDueCustomer() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('ChickenSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("DueAmount", isNotEqualTo: 0);

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        SecondTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllChickenDueCustomer =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });




      for (var i = 0; i < AllChickenDueCustomer.length; i++) {

        SecondTabDueAmount= SecondTabDueAmount+ double.parse(AllChickenDueCustomer[i]["DueAmount"].toString());


        
      }


      setState(() {
        loading = false;
  
        
      
      });

    }

    
  }





String ThirdTabDataLoad = "";

double ThirdTabDueAmount=0.0;

List AllMedicinDueCustomer = [];

  Future<void> getMedicinDueCustomer() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('MedicinSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("DueAmount", isNotEqualTo: 0);

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        ThirdTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllMedicinDueCustomer =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });




      for (var i = 0; i < AllMedicinDueCustomer.length; i++) {

        ThirdTabDueAmount= ThirdTabDueAmount+ double.parse(AllMedicinDueCustomer[i]["DueAmount"].toString());


        
      }


      setState(() {
        loading = false;
  
        
      
      });

    }

    
  }









List AllMedicinDueCustomerByPhone = [];

  Future<void> getMedicinDueCustomerByPhone() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('MedicinSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("CustomerPhoneNo", isEqualTo: "${PhoneNumberSearchController.text.trim().toString()}").where("DueAmount", isNotEqualTo: 0);

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        ThirdTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
       AllMedicinDueCustomer =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });


      setState(() {
        loading = false;
  
        
      
      });

    }

    
  }







List AllChickenDueCustomerByPhone = [];

  Future<void> getChickenDueCustomerByPhone() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('ChickenSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("CustomerPhoneNo", isEqualTo: "${PhoneNumberSearchController.text.trim().toString()}").where("DueAmount", isNotEqualTo: 0);

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        SecondTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllChickenDueCustomer =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });


      setState(() {
        loading = false;
  
        
      
      });

    }

    
  }






List AllFeedDueCustomerByPhone = [];

  Future<void> getFeedDueCustomerByPhone() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('FeedSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("CustomerPhoneNo", isEqualTo: "${PhoneNumberSearchController.text.trim().toString()}").where("DueAmount", isNotEqualTo: 0);

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        FirstTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllFeedDueCustomer =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();

            
       
      });


      setState(() {
        loading = false;
  
        
      
      });

    }

    
  }





List AllFeedKhuchraDueCustomerByPhone = [];

  Future<void> getFeedKhuchraDueCustomerByPhone() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _ThisMonthFeddSaleInfoRef =
        FirebaseFirestore.instance.collection('FeedKhuchraSaleInfo');

    // // all Due Query Count
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("CustomerPhoneNo", isEqualTo: "${PhoneNumberSearchController.text.trim().toString()}").where("DueAmount", isNotEqualTo: 0);

    QuerySnapshot queryDueSnapshot =
        await _ThisMonthFeddSaleInfoRefQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        FourthTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllFeedKhuchraDueCustomer =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });





      setState(() {
        loading = false;
  
        
      
      });

    }

    
  }





  @override
  void initState() {


    getFeedDueCustomer();
    getChickenDueCustomer();
    getMedicinDueCustomer();
    




    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed App',
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          
          appBar: AppBar(
            title: Text(
          "বাকেয়া কাস্টমার দেখুন"
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
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'মুরগীর খাদ্য', icon: Image.asset("lib/Images/chicken_feed.png", width: 40, height: 40,)),

                
                Tab(text: 'মুরগীর বাচ্চা', icon: Image.asset("lib/Images/chicken_baby.png", width: 40, height: 40,)),

                Tab(text: 'মেডিসিন', icon: Image.asset("lib/Images/drugs.png", width: 40, height: 40,)),

                Tab(text: 'খুচরা মুরগীর খাদ্য', icon: Image.asset("lib/Images/chicken_feed.png", width: 40, height: 40,)),
              ],
            ),
          ),
          body: TabBarView(
            children: [

              // First Tab 
              loading?Center(child: CircularProgressIndicator(),):  
              
             FirstTabDataLoad=="0"?Center(child: Text("No Data Available"),): SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: 20,),

                      Material(
                        elevation: 14,
                        child: ListTile(

                        title: TextField(
                        keyboardType: TextInputType.phone,
                     
                        decoration: InputDecoration(
                           suffixIcon: ElevatedButton.icon(
                            style: ButtonStyle(
                                      elevation:MaterialStatePropertyAll(15),
                                      backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                    
                                    ),
                            onPressed: () async{

                              getFeedDueCustomerByPhone();




                        }, icon: Icon(Icons.search), label: Text("Search")),
                            border: OutlineInputBorder(),
                            labelText: 'ফোন নাম্বার দিয়ে খুজুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                         
                            hintText: 'ফোন নাম্বার দিয়ে খুজুন',
                            hintStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                  
                            //  enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                            //     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                     ),
                                     errorBorder: const OutlineInputBorder(
                                       borderSide: BorderSide(
                                           width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                     ),
                            
                            
                            ),
                        controller: PhoneNumberSearchController,
                                          ),),
                      ),


                      SizedBox(height: 50,),

                      for(int i=0; i<AllFeedDueCustomer.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                

                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("মোট বকেয়া দেখুন", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 100,
                          
                             child:SingleChildScrollView(
                              child: Center(

                                // এটা ফোন নাম্বার দিয়ে কল করতে হবে।
                                child: Text("বকেয়াঃ ${AllFeedDueCustomer[i]["DueAmount"].toString()} টাকা",    
                                     
                                     style: TextStyle(
                                            color: Colors.red.shade400,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: "Josefin Sans"),),
                              ),
                          
                             ),
                                         
                                         
                       ));});});
                            },
                            child: Material(
                              elevation: 14,
                              child: ListTile(
                                trailing: ElevatedButton.icon(
                                  style: ButtonStyle(
                                            elevation:MaterialStatePropertyAll(15),
                                            backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                                
                                          ),
                                  onPressed: (){
                          
                          
                                    showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                
                                  actions: [
                          
                                    ElevatedButton.icon(
                              style: ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                              
                                      ),
                              onPressed: ()async{




                        setState(() {
                              loading = true;
                            });

                          String DueCustomerMsg ="আপনার বকেয়া ${AllFeedDueCustomer[i]["DueAmount"].toString()}. পরিশোধ করুন। Thank you";


                          Future SendSMSToCustomer() async {



                            try {

                              
                            final response = await http
                                .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=100651104321696050272e74e099c1bc81798bc3aa4ed57a8d030&to=${AllFeedDueCustomer[i]["CustomerPhoneNo"]}&message=${DueCustomerMsg}'));

                                    Navigator.pop(context);

                            if (response.statusCode == 200) {
                              // If the server did return a 200 OK response,
                              // then parse the JSON.
                              print(jsonDecode(response.body));
                              setState(() {
                               
                                loading = false;
                              });



                                final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Send Successfull',
                                                                                                        message: 'Send Successfull',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.success,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                            
                            } else {

                               setState(() {
                                
                                loading = false;
                              });



                                final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Something wrong!! Try again later',
                                                                                                        message: 'Something wrong!! Try again later',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.failure,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                              // If the server did not return a 200 OK response,
                              // then throw an exception.
                              throw Exception('Failed to load album');
                            }
                              
                            } catch (e) {
                              
                            }




                          }


                          SendSMSToCustomer();












                          
                                                  }, icon: Icon(Icons.message, color: Colors.white,), label: const Text("Send",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                          
                                  ],
                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("বকেয়া পরিশোধের জন্য বার্তা পাঠান", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 200,
                          
                             child:SingleChildScrollView(
                              child: Column(
                                children: [
                          
                             
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                                                ));});});
                          
                          
                          
                          
                          
                          
                            
                              }, icon: Icon(Icons.message), label: Text("Send")),
                                title: Text("ক্রেতার নামঃ ${AllFeedDueCustomer[i]["CustomerName"].toString()}",    
                                       
                                       style: TextStyle(
                                              color: Colors.green.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              fontFamily: "Josefin Sans"),),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                            
                                  Text("ক্রেতার নামঃ ${AllFeedDueCustomer[i]["CustomerName"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                              
                                      Text("ক্রেতার ফোনঃ ${AllFeedDueCustomer[i]["CustomerPhoneNo"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("ক্রেতার ঠিকানাঃ ${AllFeedDueCustomer[i]["CustomerAddress"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                      Text("বস্তার সংখ্যাঃ ${AllFeedDueCustomer[i]["SaleFeedBagNumber"].toString()}",    
                                         
                                         style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("বস্তার ধরণঃ ${AllFeedDueCustomer[i]["SaleFeedBagType"].toString()}",    
                                         
                                         style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("জমাঃ ${AllFeedDueCustomer[i]["JomaAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       Text("প্রতি বস্তার বিক্রয় মূল্যঃ ${AllFeedDueCustomer[i]["PerBagSalePrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       
                                       Text("প্রতি বস্তার ক্রয় মূল্যঃ ${AllFeedDueCustomer[i]["PerBagBuyingPrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),

                                      
                                      Text("লাভঃ ${AllFeedDueCustomer[i]["Profit"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                      Text("বকেয়াঃ ${AllFeedDueCustomer[i]["DueAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                          
                                      Text("তারিখঃ ${AllFeedDueCustomer[i]["Date"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                
                          
                                                  
                            ElevatedButton.icon(
                              style: const ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(Colors.pinkAccent),
                                              
                                      ),
                              onPressed: (){
                          
                          
                                                showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                
                                  actions: [
                          
                                                 ElevatedButton.icon(
                              style: ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                              
                                      ),
                              onPressed: ()async{

                          
                     setState((){
                      loading = true;
                     })   ;
                                                                                        Future updateData() async {
                                                                                          final docUser = FirebaseFirestore.instance.collection("FeedSaleInfo").doc(AllFeedDueCustomer[i]["SaleID"]);

                                                                                          final UpadateData = {
                                                                                            "JomaAmount":(double.parse(AllFeedDueCustomer[i]["JomaAmount"].toString())+double.parse(ReceiveAmountController.text.trim().toString())).toString(),
                                                                                            "DueAmount":(double.parse(AllFeedDueCustomer[i]["DueAmount"].toString())-double.parse(ReceiveAmountController.text.trim().toString()))
                                                                                          };

                                                                                          // user Data Update and show snackbar

                                                                                          docUser
                                                                                              .update(UpadateData)
                                                                                              .then((value) => setState(() {
                                                                                                    setState(() {
                                                                                                      loading = false;
                                                                                                    });

                                                                                                    print("Done");

              getFeedDueCustomer();
                                                                                                     Navigator.pop(context);

                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Payment Successfull',
                                                                                                        message: 'Payment Successfull',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.success,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                                                                                                  }))
                                                                                              .onError((error, stackTrace) => setState(() {
                                                                                                    loading = false;


        Navigator.pop(context);
                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Something Wrong!! Try again Later',
                                                                                                        message: 'Something Wrong!! Try again Later',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.failure,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);

                                                                                                    print(error);
                                                                                                  }));
                                                                                        }

                                                                                        updateData();





                          
                                                  }, icon: const Icon(Icons.add, color: Colors.white,), label: const Text("Receive",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                          
                                  ],
                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("বকেয়া টাকা নিন", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 200,
                          
                             child:SingleChildScrollView(
                              child: Column(
                                children: [
                          
                                  TextField(
                                                keyboardType: TextInputType.name,
                                                maxLength: 30,
                                              
                                                decoration: InputDecoration(
                                                   
                          
                            
                            border: OutlineInputBorder(),
                            labelText: 'টাকার পরিমান লিখুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                                 
                            hintText: 'টাকার পরিমান লিখুন',
                            hintStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                      
                            //  enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                            //     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                     ),
                                     errorBorder: const OutlineInputBorder(
                                       borderSide: BorderSide(
                                           width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                     ),
                            
                            
                            ),
                                                controller: ReceiveAmountController,
                                              ),
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                                                ));});});
                          
                          
                          
                          
                          
                                                  }, icon: Icon(Icons.money), label: Text("টাকা নিন",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                            
                            
                            
                                ],
                              ),
                            
                            
                              ),
                            ),
                          ),
                        ),
                        





                    ],
                  ),
                ),








                 // 2nd Tab 
              loading?Center(child: CircularProgressIndicator(),):   SecondTabDataLoad=="0"?Center(child: Text("No Data Available"),): SingleChildScrollView(
                  child:loading?Center(child: CircularProgressIndicator(),):Column(
                    children: [

                      SizedBox(height: 20,),

                      Material(
                        elevation: 14,
                        child: ListTile(

                        title: TextField(
                        keyboardType: TextInputType.phone,
                     
                        decoration: InputDecoration(
                           suffixIcon: ElevatedButton.icon(
                            style: ButtonStyle(
                                      elevation:MaterialStatePropertyAll(15),
                                      backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                    
                                    ),
                            onPressed: () async{

                              getChickenDueCustomerByPhone();

                        }, icon: Icon(Icons.search), label: Text("Search")),
                            border: OutlineInputBorder(),
                            labelText: 'ফোন নাম্বার দিয়ে খুজুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                         
                            hintText: 'ফোন নাম্বার দিয়ে খুজুন',
                            hintStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                  
                            //  enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                            //     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                     ),
                                     errorBorder: const OutlineInputBorder(
                                       borderSide: BorderSide(
                                           width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                     ),
                            
                            
                            ),
                        controller: PhoneNumberSearchController,
                                          ),),
                      ),


                      SizedBox(height: 50,),

                      for(int i=0; i<AllChickenDueCustomer.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(

                            onTap: () {
                              showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                

                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("মোট বকেয়া দেখুন", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 100,
                          
                             child:SingleChildScrollView(
                              child: Center(

                                // এটা ফোন নাম্বার দিয়ে কল করতে হবে।
                                child: Text("বকেয়াঃ ${AllChickenDueCustomer[i]["DueAmount"].toString()} টাকা",    
                                     
                                     style: TextStyle(
                                            color: Colors.red.shade400,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: "Josefin Sans"),),
                              ),
                          
                             ),
                                         
                                         
                       ));});});
                            },


                            child: Material(
                              elevation: 14,
                              child: ListTile(
                                trailing: ElevatedButton.icon(
                                  style: ButtonStyle(
                                            elevation:MaterialStatePropertyAll(15),
                                            backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                                
                                          ),
                                  onPressed: (){
                          
                          
                                    showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                
                                  actions: [
                          
                                    ElevatedButton.icon(
                              style: ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                              
                                      ),
                              onPressed: () async{



                      setState(() {
                              loading = true;
                            });

                          String DueCustomerMsg ="আপনার বকেয়া ${AllFeedDueCustomer[i]["DueAmount"].toString()}. পরিশোধ করুন। Thank you";


                          Future SendSMSToCustomer() async {



                            try {

                              
                            final response = await http
                                .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=100651104321696050272e74e099c1bc81798bc3aa4ed57a8d030&to=${AllChickenDueCustomer[i]["CustomerPhoneNo"]}&message=${DueCustomerMsg}'));

                                    Navigator.pop(context);

                            if (response.statusCode == 200) {
                              // If the server did return a 200 OK response,
                              // then parse the JSON.
                              print(jsonDecode(response.body));
                              setState(() {
                               
                                loading = false;
                              });




                                   final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Send Successfull',
                                                                                                        message: 'Send Successfull',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.success,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                            
                            } else {

                               setState(() {
                                
                                loading = false;
                              });







                                   final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Something Wrong!! Try again later',
                                                                                                        message: 'Something Wrong!! Try again later',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.failure,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                              // If the server did not return a 200 OK response,
                              // then throw an exception.
                              throw Exception('Failed to load album');
                            }
                              
                            } catch (e) {
                              
                            }




                          }


                          SendSMSToCustomer();








                          
                                                  }, icon: Icon(Icons.message, color: Colors.white,), label: const Text("Send",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                          
                                  ],
                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("বকেয়া পরিশোধের জন্য বার্তা পাঠান", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 200,
                          
                             child:SingleChildScrollView(
                              child: Column(
                                children: [
                          
                        
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                                                ));});});
                          
                          
                          
                          
                          
                          
                            
                              }, icon: Icon(Icons.message), label: Text("Send")),
                                title: Text("ক্রেতার নামঃ ${AllChickenDueCustomer[i]["CustomerName"].toString()}",    
                                       
                                       style: TextStyle(
                                              color: Colors.green.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              fontFamily: "Josefin Sans"),),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                            
                                Text("ক্রেতার নামঃ ${AllChickenDueCustomer[i]["CustomerName"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                              
                                      Text("ক্রেতার ফোনঃ ${AllChickenDueCustomer[i]["CustomerPhoneNo"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("ক্রেতার ঠিকানাঃ ${AllChickenDueCustomer[i]["CustomerAddress"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                      Text("বাচ্চার সংখ্যাঃ ${AllChickenDueCustomer[i]["SaleChickenNumber"].toString()}",    
                                         
                                         style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("বাচ্চার ধরণঃ ${AllChickenDueCustomer[i]["ChickenType"].toString()}",    
                                         
                                         style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("জমাঃ ${AllChickenDueCustomer[i]["JomaAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       Text("প্রতি বাচ্চার বিক্রয় মূল্যঃ ${AllChickenDueCustomer[i]["ChickenSalePrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       
                                       Text("প্রতি বাচ্চার ক্রয় মূল্যঃ ${AllChickenDueCustomer[i]["ChickenBuyingPrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),

                                      
                                      Text("লাভঃ ${AllChickenDueCustomer[i]["Profit"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                      Text("বকেয়াঃ ${AllChickenDueCustomer[i]["DueAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                          
                                      Text("তারিখঃ ${AllChickenDueCustomer[i]["Date"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                          
                                                  
                            ElevatedButton.icon(
                              style: const ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(Colors.pinkAccent),
                                              
                                      ),
                              onPressed: (){
                          
                          
                                                showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                
                                  actions: [
                          
                                                 ElevatedButton.icon(
                              style: ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                              
                                      ),
                              onPressed: ()async{





                     setState((){
                      loading = true;
                     })   ;
                                                                                        Future updateData() async {
                                                                                          final docUser = FirebaseFirestore.instance.collection("ChickenSaleInfo").doc(AllChickenDueCustomer[i]["SaleID"]);

                                                                                          final UpadateData = {
                                                                                            "JomaAmount":(double.parse(AllChickenDueCustomer[i]["JomaAmount"].toString())+double.parse(ReceiveAmountController.text.trim().toString())).toString(),
                                                                                            "DueAmount":(double.parse(AllChickenDueCustomer[i]["DueAmount"].toString())-double.parse(ReceiveAmountController.text.trim().toString()))
                                                                                          };

                                                                                          // user Data Update and show snackbar

                                                                                          docUser
                                                                                              .update(UpadateData)
                                                                                              .then((value) => setState(() {
                                                                                                    setState(() {
                                                                                                      loading = false;
                                                                                                    });

                                                                                                    print("Done");


                getChickenDueCustomer();
                Navigator.pop(context);
                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Payment Successfull',
                                                                                                        message: 'Payment Successfull',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.success,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                                                                                                  }))
                                                                                              .onError((error, stackTrace) => setState(() {
                                                                                                    loading = false;
                                                                                                    Navigator.pop(context);
                                                                                           final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Something Wrong!! Try again Later',
                                                                                                        message: 'Something Wrong!! Try again Later',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.failure,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);

                                                                                                    print(error);
                                                                                                  }));
                                                                                        }

                                                                                        updateData();










                          
                                                  }, icon: const Icon(Icons.add, color: Colors.white,), label: const Text("Receive",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                          
                                  ],
                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("বকেয়া টাকা নিন", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 200,
                          
                             child:SingleChildScrollView(
                              child: Column(
                                children: [
                          
                                  TextField(
                                                keyboardType: TextInputType.name,
                                                maxLength: 30,
                                              
                                                decoration: InputDecoration(
                                                   
                          
                            
                            border: OutlineInputBorder(),
                            labelText: 'টাকার পরিমান লিখুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                                 
                            hintText: 'টাকার পরিমান লিখুন',
                            hintStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                      
                            //  enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                            //     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                     ),
                                     errorBorder: const OutlineInputBorder(
                                       borderSide: BorderSide(
                                           width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                     ),
                            
                            
                            ),
                                                controller: ReceiveAmountController,
                                              ),
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                                                ));});});
                          
                          
                          
                          
                          
                                                  }, icon: Icon(Icons.money), label: Text("টাকা নিন",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                            
                            
                            
                                ],
                              ),
                            
                            
                              ),
                            ),
                          ),
                        ),
                        





                    ],
                  ),
                ),



                
            // 3rd Tab 
               loading?Center(child: CircularProgressIndicator(),):  ThirdTabDataLoad=="0"?Center(child: Text("No Data Available"),): SingleChildScrollView(
                  child:loading?Center(child: CircularProgressIndicator(),):Column(
                    children: [

                      SizedBox(height: 20,),

                      Material(
                        elevation: 14,
                        child: ListTile(

                        title: TextField(
                        keyboardType: TextInputType.phone,
                     
                        decoration: InputDecoration(
                           suffixIcon: ElevatedButton.icon(
                            style: ButtonStyle(
                                      elevation:MaterialStatePropertyAll(15),
                                      backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                    
                                    ),
                            onPressed: ()async{


                              getMedicinDueCustomerByPhone();

                        }, icon: Icon(Icons.search), label: Text("Search")),
                            border: OutlineInputBorder(),
                            labelText: 'ফোন নাম্বার দিয়ে খুজুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                         
                            hintText: 'ফোন নাম্বার দিয়ে খুজুন',
                            hintStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                  
                            //  enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                            //     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                     ),
                                     errorBorder: const OutlineInputBorder(
                                       borderSide: BorderSide(
                                           width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                     ),
                            
                            
                            ),
                        controller: PhoneNumberSearchController,
                                          ),),
                      ),


                      SizedBox(height: 50,),

                      for(int i=0; i<AllMedicinDueCustomer.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(

                            onTap: () async{



                              showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                

                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("মোট বকেয়া দেখুন", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 100,
                          
                             child:SingleChildScrollView(
                              child: Center(

                                // এটা ফোন নাম্বার দিয়ে কল করতে হবে।
                                child: Text("বকেয়াঃ ${AllMedicinDueCustomer[i]["DueAmount"].toString()} টাকা",    
                                     
                                     style: TextStyle(
                                            color: Colors.red.shade400,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: "Josefin Sans"),),
                              ),
                          
                             ),
                                         
                                         
                       ));});});


                              
                              
                            },



                            child: Material(
                              elevation: 14,
                              child: ListTile(
                                trailing: ElevatedButton.icon(
                                  style: ButtonStyle(
                                            elevation:MaterialStatePropertyAll(15),
                                            backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                                
                                          ),
                                  onPressed: (){
                          
                          
                                    showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                
                                  actions: [
                          
                                    ElevatedButton.icon(
                              style: ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                              
                                      ),
                              onPressed: () async{








                      setState(() {
                              loading = true;
                            });

                          String DueCustomerMsg ="আপনার বকেয়া ${AllFeedDueCustomer[i]["DueAmount"].toString()}. পরিশোধ করুন। Thank you";


                          Future SendSMSToCustomer() async {



                            try {

                              
                            final response = await http
                                .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=100651104321696050272e74e099c1bc81798bc3aa4ed57a8d030&to=${AllMedicinDueCustomer[i]["CustomerPhoneNo"]}&message=${DueCustomerMsg}'));

                                    Navigator.pop(context);

                            if (response.statusCode == 200) {
                              // If the server did return a 200 OK response,
                              // then parse the JSON.
                              print(jsonDecode(response.body));
                              setState(() {
                               
                                loading = false;
                              });




                                   final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Send Successfull',
                                                                                                        message: 'Send Successfull',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.success,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                            
                            } else {

                               setState(() {
                                
                                loading = false;
                              });







                                   final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Something Wrong!! Try again later',
                                                                                                        message: 'Something Wrong!! Try again later',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.failure,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                              // If the server did not return a 200 OK response,
                              // then throw an exception.
                              throw Exception('Failed to load album');
                            }
                              
                            } catch (e) {
                              
                            }




                          }


                          SendSMSToCustomer();













                          
                                                  }, icon: Icon(Icons.message, color: Colors.white,), label: const Text("Send",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                          
                                  ],
                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("বকেয়া পরিশোধের জন্য বার্তা পাঠান", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 200,
                          
                             child:SingleChildScrollView(
                              child: Column(
                                children: [
                          
                             
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                       ));});});
                          
                          
                          
                          
                          
                          
                            
                              }, icon: Icon(Icons.message), label: Text("Send")),
                                title: Text("ক্রেতার নামঃ ${AllMedicinDueCustomer[i]["CustomerName"].toString()}",    
                                       
                                       style: TextStyle(
                                              color: Colors.green.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              fontFamily: "Josefin Sans"),),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                            
                                  Text("ক্রেতার নামঃ ${AllMedicinDueCustomer[i]["CustomerName"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                              
                                      Text("ক্রেতার ফোনঃ ${AllMedicinDueCustomer[i]["CustomerPhoneNo"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("ক্রেতার ঠিকানাঃ ${AllMedicinDueCustomer[i]["CustomerAddress"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                      Text("মেডিসিনের সংখ্যাঃ ${AllMedicinDueCustomer[i]["MedicinNumber"].toString()}",    
                                         
                                         style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("মেডিসিনের ধরণঃ ${AllMedicinDueCustomer[i]["MedicinType"].toString()}",    
                                         
                                         style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("জমাঃ ${AllMedicinDueCustomer[i]["JomaAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       Text("প্রতি মেডিসিনের বিক্রয় মূল্যঃ ${AllMedicinDueCustomer[i]["MedicinSaleprice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       
                                       Text("প্রতি মেডিসিন ক্রয় মূল্যঃ ${AllMedicinDueCustomer[i]["MedicinBuyingPrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),

                                      
                                      Text("লাভঃ ${AllMedicinDueCustomer[i]["Profit"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                      Text("বকেয়াঃ ${AllMedicinDueCustomer[i]["DueAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                          
                                      Text("তারিখঃ ${AllMedicinDueCustomer[i]["Date"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                
                          
                                                  
                            ElevatedButton.icon(
                              style: const ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(Colors.pinkAccent),
                                              
                                      ),
                              onPressed: (){
                          
                          
                                                showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                
                                  actions: [
                          
                                                 ElevatedButton.icon(
                              style: ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                              
                                      ),
                              onPressed: () async{


                                
                     setState((){
                      loading = true;
                     })   ;
                                                                                        Future updateData() async {
                                                                                          final docUser = FirebaseFirestore.instance.collection("MedicinSaleInfo").doc(AllMedicinDueCustomer[i]["SaleID"]);

                                                                                          final UpadateData = {
                                                                                            "JomaAmount":(double.parse(AllMedicinDueCustomer[i]["JomaAmount"].toString())+double.parse(ReceiveAmountController.text.trim().toString())).toString(),
                                                                                            "DueAmount":(double.parse(AllMedicinDueCustomer[i]["DueAmount"].toString())-double.parse(ReceiveAmountController.text.trim().toString()))
                                                                                          };

                                                                                          // user Data Update and show snackbar

                                                                                          docUser
                                                                                              .update(UpadateData)
                                                                                              .then((value) => setState(() {
                                                                                                    setState(() {
                                                                                                      loading = false;
                                                                                                    });

                                                                                                    print("Done");

                                                                                                    getMedicinDueCustomer();

                                                                                                    Navigator.pop(context);

                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Payment Successfull',
                                                                                                        message: 'Payment Successfull',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.success,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                                                                                                  }))
                                                                                              .onError((error, stackTrace) => setState(() {
                                                                                                    loading = false;

                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Something Wrong!! Try again Later',
                                                                                                        message: 'Something Wrong!! Try again Later',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.failure,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);

                                                                                                    print(error);
                                                                                                  }));
                                                                                        }

                                                                                        updateData();













                          
                                                  }, icon: const Icon(Icons.add, color: Colors.white,), label: const Text("Receive",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                          
                                  ],
                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("বকেয়া টাকা নিন", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 200,
                          
                             child:SingleChildScrollView(
                              child: Column(
                                children: [
                          
                                  TextField(
                                                keyboardType: TextInputType.name,
                                                maxLength: 30,
                                              
                                                decoration: InputDecoration(
                                                   
                          
                            
                            border: OutlineInputBorder(),
                            labelText: 'টাকার পরিমান লিখুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                                 
                            hintText: 'টাকার পরিমান লিখুন',
                            hintStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                      
                            //  enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                            //     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                     ),
                                     errorBorder: const OutlineInputBorder(
                                       borderSide: BorderSide(
                                           width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                     ),
                            
                            
                            ),
                                                controller: ReceiveAmountController,
                                              ),
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                                                ));});});
                          
                          
                          
                          
                          
                                                  }, icon: Icon(Icons.money), label: Text("টাকা নিন",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                            
                            
                            
                                ],
                              ),
                            
                            
                              ),
                            ),
                          ),
                        ),
                        





                    ],
                  ),
                ),

















                // 4th Tab 
             loading?Center(child: CircularProgressIndicator(),):    FourthTabDataLoad=="0"?Center(child: Text("No Data Available"),): SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: 20,),

                      Material(
                        elevation: 14,
                        child: ListTile(

                        title: TextField(
                        keyboardType: TextInputType.phone,
                     
                        decoration: InputDecoration(
                           suffixIcon: ElevatedButton.icon(
                            style: ButtonStyle(
                                      elevation:MaterialStatePropertyAll(15),
                                      backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                    
                                    ),
                            onPressed: () async{

                              getFeedKhuchraDueCustomerByPhone();




                        }, icon: Icon(Icons.search), label: Text("Search")),
                            border: OutlineInputBorder(),
                            labelText: 'ফোন নাম্বার দিয়ে খুজুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                         
                            hintText: 'ফোন নাম্বার দিয়ে খুজুন',
                            hintStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                  
                            //  enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                            //     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                     ),
                                     errorBorder: const OutlineInputBorder(
                                       borderSide: BorderSide(
                                           width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                     ),
                            
                            
                            ),
                        controller: PhoneNumberSearchController,
                                          ),),
                      ),


                      SizedBox(height: 50,),

                      for(int i=0; i<AllFeedKhuchraDueCustomer.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                

                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("মোট বকেয়া দেখুন", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 100,
                          
                             child:SingleChildScrollView(
                              child: Center(

                                // এটা ফোন নাম্বার দিয়ে কল করতে হবে।
                                child: Text("বকেয়াঃ ${AllFeedKhuchraDueCustomer[i]["DueAmount"].toString()} টাকা",    
                                     
                                     style: TextStyle(
                                            color: Colors.red.shade400,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: "Josefin Sans"),),
                              ),
                          
                             ),
                                         
                                         
                       ));});});
                            },
                            child: Material(
                              elevation: 14,
                              child: ListTile(
                                trailing: ElevatedButton.icon(
                                  style: ButtonStyle(
                                            elevation:MaterialStatePropertyAll(15),
                                            backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                                
                                          ),
                                  onPressed: (){
                          
                          
                                    showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                
                                  actions: [
                          
                                    ElevatedButton.icon(
                              style: ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                              
                                      ),
                              onPressed: ()async{




                        setState(() {
                              loading = true;
                            });

                          String DueCustomerMsg ="আপনার বকেয়া ${AllFeedKhuchraDueCustomer[i]["DueAmount"].toString()}. পরিশোধ করুন। Thank you";


                          Future SendSMSToCustomer() async {



                            try {

                              
                            final response = await http
                                .get(Uri.parse('https://api.greenweb.com.bd/api.php?token=100651104321696050272e74e099c1bc81798bc3aa4ed57a8d030&to=${AllFeedKhuchraDueCustomer[i]["CustomerPhoneNo"]}&message=${DueCustomerMsg}'));

                                    Navigator.pop(context);

                            if (response.statusCode == 200) {
                              // If the server did return a 200 OK response,
                              // then parse the JSON.
                              print(jsonDecode(response.body));
                              setState(() {
                               
                                loading = false;
                              });



                                final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Send Successfull',
                                                                                                        message: 'Send Successfull',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.success,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                            
                            } else {

                               setState(() {
                                
                                loading = false;
                              });



                                final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Something wrong!! Try again later',
                                                                                                        message: 'Something wrong!! Try again later',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.failure,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                              // If the server did not return a 200 OK response,
                              // then throw an exception.
                              throw Exception('Failed to load album');
                            }
                              
                            } catch (e) {
                              
                            }




                          }


                          SendSMSToCustomer();












                          
                                                  }, icon: Icon(Icons.message, color: Colors.white,), label: const Text("Send",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                          
                                  ],
                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("বকেয়া পরিশোধের জন্য বার্তা পাঠান", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 200,
                          
                             child:SingleChildScrollView(
                              child: Column(
                                children: [
                          
                             
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                                                ));});});
                          
                          
                          
                          
                          
                          
                            
                              }, icon: Icon(Icons.message), label: Text("Send")),
                                title: Text("ক্রেতার নামঃ ${AllFeedKhuchraDueCustomer[i]["CustomerName"].toString()}",    
                                       
                                       style: TextStyle(
                                              color: Colors.green.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              fontFamily: "Josefin Sans"),),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                            
                                  Text("ক্রেতার নামঃ ${AllFeedKhuchraDueCustomer[i]["CustomerName"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                              
                                      Text("ক্রেতার ফোনঃ ${AllFeedKhuchraDueCustomer[i]["CustomerPhoneNo"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("ক্রেতার ঠিকানাঃ ${AllFeedKhuchraDueCustomer[i]["CustomerAddress"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                      Text("পরিমাণঃ ${AllFeedKhuchraDueCustomer[i]["SaleFeedKgNumber"].toString()}",    
                                         
                                         style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("বস্তার ধরণঃ ${AllFeedKhuchraDueCustomer[i]["SaleFeedBagType"].toString()}",    
                                         
                                         style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                      
                                      Text("জমাঃ ${AllFeedKhuchraDueCustomer[i]["JomaAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       Text("প্রতি বস্তার বিক্রয় মূল্যঃ ${AllFeedKhuchraDueCustomer[i]["PerBagSalePrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                              
                                       
                                       Text("প্রতি বস্তার ক্রয় মূল্যঃ ${AllFeedKhuchraDueCustomer[i]["PerBagBuyingPrice"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),

                                      
                                      Text("লাভঃ ${AllFeedKhuchraDueCustomer[i]["Profit"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.green.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                      Text("বকেয়াঃ ${AllFeedKhuchraDueCustomer[i]["DueAmount"].toString()} টাকা",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                      
                                      
                                          
                                      Text("তারিখঃ ${AllFeedKhuchraDueCustomer[i]["Date"].toString()}",    
                                         
                                         style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),),
                                
                          
                                                  
                            ElevatedButton.icon(
                              style: const ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(Colors.pinkAccent),
                                              
                                      ),
                              onPressed: (){
                          
                          
                                                showDialog(
                            context: context,
                            builder: (context) {
                          
                              return StatefulBuilder(builder:(context, setState) {
                                           
                                return AlertDialog(
                                
                                  actions: [
                          
                                                 ElevatedButton.icon(
                              style: ButtonStyle(
                                        elevation:MaterialStatePropertyAll(15),
                                        backgroundColor: MaterialStatePropertyAll(ColorName().appColor),
                                              
                                      ),
                              onPressed: ()async{

                          
                     setState((){
                      loading = true;
                     })   ;
                                                                                        Future updateData() async {
                                                                                          final docUser = FirebaseFirestore.instance.collection("FeedKhuchraSaleInfo").doc(AllFeedKhuchraDueCustomer[i]["SaleID"]);

                                                                                          final UpadateData = {
                                                                                            "JomaAmount":(double.parse(AllFeedKhuchraDueCustomer[i]["JomaAmount"].toString())+double.parse(ReceiveAmountController.text.trim().toString())).toString(),
                                                                                            "DueAmount":(double.parse(AllFeedKhuchraDueCustomer[i]["DueAmount"].toString())-double.parse(ReceiveAmountController.text.trim().toString()))
                                                                                          };

                                                                                          // user Data Update and show snackbar

                                                                                          docUser
                                                                                              .update(UpadateData)
                                                                                              .then((value) => setState(() {
                                                                                                    setState(() {
                                                                                                      loading = false;
                                                                                                    });

                                                                                                    print("Done");

              getFeedKhuchraDueCustomer();
                                                                                                     Navigator.pop(context);

                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Payment Successfull',
                                                                                                        message: 'Payment Successfull',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.success,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);
                                                                                                  }))
                                                                                              .onError((error, stackTrace) => setState(() {
                                                                                                    loading = false;


        Navigator.pop(context);
                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Something Wrong!! Try again Later',
                                                                                                        message: 'Something Wrong!! Try again Later',

                                                                                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                                        contentType: ContentType.failure,
                                                                                                      ),
                                                                                                    );

                                                                                                    ScaffoldMessenger.of(context)
                                                                                                      ..hideCurrentSnackBar()
                                                                                                      ..showSnackBar(snackBar);

                                                                                                    print(error);
                                                                                                  }));
                                                                                        }

                                                                                        updateData();





                          
                                                  }, icon: const Icon(Icons.add, color: Colors.white,), label: const Text("Receive",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                          
                                  ],
                                  elevation: 50.0,
                                  title: const Center(
                                    child: Text("বকেয়া টাকা নিন", style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.visible,
                                            fontFamily: "Josefin Sans"),),
                                  ),
                                  content: Container(
                                  height: 200,
                          
                             child:SingleChildScrollView(
                              child: Column(
                                children: [
                          
                                  TextField(
                                                keyboardType: TextInputType.name,
                                                maxLength: 30,
                                              
                                                decoration: InputDecoration(
                                                   
                          
                            
                            border: OutlineInputBorder(),
                            labelText: 'টাকার পরিমান লিখুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                                 
                            hintText: 'টাকার পরিমান লিখুন',
                            hintStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                      
                            //  enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                            //     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                     ),
                                     errorBorder: const OutlineInputBorder(
                                       borderSide: BorderSide(
                                           width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                     ),
                            
                            
                            ),
                                                controller: ReceiveAmountController,
                                              ),
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                                                ));});});
                          
                          
                          
                          
                          
                                                  }, icon: Icon(Icons.money), label: Text("টাকা নিন",    
                                       
                                       style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),),
                            
                            
                            
                                ],
                              ),
                            
                            
                              ),
                            ),
                          ),
                        ),
                        





                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}