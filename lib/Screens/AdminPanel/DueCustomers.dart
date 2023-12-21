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
        // FirstTabDataLoad = "0";
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
        // FirstTabDataLoad = "0";
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
        // FirstTabDataLoad = "0";
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
        // FirstTabDataLoad = "0";
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
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("DueAmount", isNotEqualTo: 0).where("CustomerPhoneNo", isEqualTo: PhoneNumberSearchController.text.trim().toString());

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
       AllMedicinDueCustomerByPhone =
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
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("DueAmount", isNotEqualTo: 0).where("CustomerPhoneNo", isEqualTo: PhoneNumberSearchController.text.trim().toString());

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
        AllChickenDueCustomerByPhone =
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
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("DueAmount", isNotEqualTo: 0).where("CustomerPhoneNo", isEqualTo: PhoneNumberSearchController.text.trim().toString());

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
        AllFeedDueCustomerByPhone =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();

            getFeedKhuchraDueCustomerByPhone();
       
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
       Query _ThisMonthFeddSaleInfoRefQueryCount = _ThisMonthFeddSaleInfoRef.where("DueAmount", isNotEqualTo: 0).where("CustomerPhoneNo", isEqualTo: PhoneNumberSearchController.text.trim().toString());

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
        AllFeedKhuchraDueCustomerByPhone =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
       
      });


      for (var i = 0; i < AllFeedKhuchraDueCustomerByPhone.length; i++) {

        setState(() {
          AllFeedDueCustomer.insert(AllFeedDueCustomer.length, AllFeedKhuchraDueCustomerByPhone[i]);
        });
        
      }


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
        length: 3,
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

              // First Tab 
                SingleChildScrollView(
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
                                child: Text("মোট বকেয়াঃ ১২০ টাকা",    
                                     
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
                              onPressed: (){
                          
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
                          
                                  TextField(
                                                keyboardType: TextInputType.name,
                                                maxLength: 330,
                                                maxLines: 4,
                                                decoration: InputDecoration(
                                                   
                          
                            
                            border: OutlineInputBorder(),
                            labelText: 'বার্তা লিখুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                                 
                            hintText: 'বার্তা লিখুন',
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
                                                controller: MessageController,
                                              ),
                          
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
                              onPressed: (){
                          
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
                SingleChildScrollView(
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
                              onPressed: (){
                          
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
                          
                                  TextField(
                                                keyboardType: TextInputType.name,
                                                maxLength: 330,
                                                maxLines: 4,
                                                decoration: InputDecoration(
                                                   
                          
                            
                            border: OutlineInputBorder(),
                            labelText: 'বার্তা লিখুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                                 
                            hintText: 'বার্তা লিখুন',
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
                                                controller: MessageController,
                                              ),
                          
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
                              onPressed: (){
                          
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
                SingleChildScrollView(
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
                                child: Text("মোট বকেয়াঃ ১২০ টাকা",    
                                     
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
                              onPressed: (){
                          
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
                          
                                  TextField(
                                                keyboardType: TextInputType.name,
                                                maxLength: 330,
                                                maxLines: 4,
                                                decoration: InputDecoration(
                                                   
                          
                            
                            border: OutlineInputBorder(),
                            labelText: 'বার্তা লিখুন',
                            labelStyle: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   fontFamily: "Josefin Sans"),
                                                 
                            hintText: 'বার্তা লিখুন',
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
                                                controller: MessageController,
                                              ),
                          
                                ],
                              ),
                          
                             ),
                                         
                                         
                       ));});});
                          
                          
                          
                          
                          
                          
                            
                              }, icon: Icon(Icons.message), label: Text("Send")),
                                title: Text("নামঃ মাহাদী হাসান",    
                                       
                                       style: TextStyle(
                                              color: Colors.green.shade400,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              fontFamily: "Josefin Sans"),),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                            
                                  Text("ফোনঃ 01721915550",    
                                       
                                       style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),
                                
                                Text("ঠিকানাঃ জয়পুরহাট সদর, জয়পুরহাট",    
                                       
                                       style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: "Josefin Sans"),),
                                
                                Text("বকেয়াঃ ১২০ টাকা",    
                                       
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
                              onPressed: (){
                          
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