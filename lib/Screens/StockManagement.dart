import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bijoy_helper/bijoy_helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:feed/DeveloperAccess/DeveloperAccess.dart';
import 'package:flutter/material.dart';

class StockShow extends StatefulWidget {
  const StockShow({super.key});

  @override
  State<StockShow> createState() => _StockShowState();
}

class _StockShowState extends State<StockShow> {







  final List<String> Bags = [
  '২৫ কেজি ',
  '৫০ কেজি ',
];
String? selectedValue;



final List<String> Chickens= [
  'সোনালী বাচ্চা',
  'ব্রয়লার বাচ্চা',
];
String? ChickenTypeValue;



final List<String> Medicins =[
  'ভিটামিন',
  'ভ্যাকসিন',
  'তরল বোতল',
  'ট্যাবলেট পাতা',
  'টিকা',
];
String?  MedicinsTypeValue;



int BagAmount = 0;











  @override
  Widget build(BuildContext context) {

    
double width = MediaQuery. of(context). size. width ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed App',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
          "স্টক দেখুন"
              .toBijoy,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: "SiyamRupali"),
        ),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            bottom:  TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'মুরগীর খাদ্য', icon: Image.asset("lib/Images/chicken_feed.png", width: 40, height: 40,)),
                Tab(text: 'মুরগীর বাচ্চা', icon: Image.asset("lib/Images/chicken_baby.png", width: 40, height: 40,)),
                Tab(text: 'মেডিসিন', icon: Image.asset("lib/Images/drugs.png", width: 40, height: 40,)),
              ],
            ),
          ),
          body:   TabBarView(
            children: [

              
              // first tab 


              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Card(
                        elevation: 8.0,
                        child: Column(
                          children: [

                            BagAmount<=0?Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                            Container(
                              height: 70.0,
                              child: Image.asset("lib/Images/sold_out.png", fit: BoxFit.cover,),
                            ),

                              ],
                            ):Text(""),


                            ListTile(
                              title: const Text("খাদ্যের নাম", style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: "Josefin Sans"),),
                              subtitle:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Text("মোট বস্তার সংখ্যাঃ 7 টি", style: TextStyle(
                                          color: Colors.green.shade400,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: "Josefin Sans"),),

                               const SizedBox(height: 2,),    

                                const Text("বস্তার ধরণঃ ২৫ কেজি", style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: "Josefin Sans"),),


                                const SizedBox(height: 2,),    

                                
                                 const Text("প্রতি বস্তার বিক্রয় মূল্যঃ ১০ টাকা",    
                                 
                                 style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: "Josefin Sans"),),
                                              
                                              
                                              
                               const SizedBox(height: 2,),
                              Text("প্রতি কেজি বিক্রয় মূল্যঃ ৭ টাকা", 
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Josefin Sans"),),
                                              
                                              
                                              
                               const SizedBox(height: 2,),
                               Text("প্রতি বস্তার ক্রয় মূল্যঃ ৮ টাকা", 
                                 style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: "Josefin Sans"),),
                                                  
                                              
                                const SizedBox(height: 2,),
                                Text("প্রতি কেজি ক্রয় মূল্যঃ ২০ টাকা", 
                                style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: "Josefin Sans"),),

                                 const SizedBox(height: 2,),
                                 Text("গত মাসে বিক্রিত বস্তার সংখ্যাঃ 7 টি", style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: "Josefin Sans"),),

                             const SizedBox(height: 2,),    

                               Text("গত মাসে বিক্রিত খুচরা পরিমানঃ ১০ কেজি ", style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: "Josefin Sans"),),


                              const SizedBox(height: 2,),    

                              
                             Text("অবশিষ্ট খুচরা পরিমানঃ ১০ কেজি",    
                               
                               style: TextStyle(
                                      color: Colors.green.shade400,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: "Josefin Sans"),),
                                            
                                            
                                            
                          
                                              
                                ],
                              ),
                              trailing: 
                                      PopupMenuButton(
                                        onSelected: (value) {
                                          // your logic
                                        },
                                        itemBuilder: (BuildContext bc) {
                                          return const [
                                            PopupMenuItem(
                                              child: Text("Edit"),
                                              value: '/hello',
                                            ),
                                            PopupMenuItem(
                                              child: Text("Previous Sale"),
                                              value: '/about',
                                            ),
                                            PopupMenuItem(
                                              child: Text("Due"),
                                              value: '/contact',
                                            )
                                          ];
                                        },
                                      ),
                            ),
                            // Container(
                            //   height: 100.0,
                            //   child: Image.asset("lib/Images/chicken_feed.png", fit: BoxFit.cover,),
                            // ),
                    
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(ColorName().appColor),

                                  ),
                                  child: const Text("বস্তা বিক্রয় করুন", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: "Josefin Sans"),),
                                  onPressed: () {

                                  },
                                ),
                                ElevatedButton(
                                   style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(ColorName().appColor),

                                  ),
                                  child: const Text("খুচরা বিক্রয় করুন", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: "Josefin Sans"),),
                                  onPressed: () {/* ... */},
                                )
                              ],
                            )
                          ],
                        ))

                  ],
                ),
              ),




            // second Tab
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Card(
                        elevation: 8.0,
                        child: Column(
                          children: [

                            BagAmount<=0?Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                            Container(
                              height: 70.0,
                              child: Image.asset("lib/Images/sold_out.png", fit: BoxFit.cover,),
                            ),

                              ],
                            ):Text(""),


                            ListTile(
                              title: const Text("বাচ্চার ধরণঃ সোনালী বাচ্চা", style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: "Josefin Sans"),),
                              subtitle:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Text("বাচ্চার সংখ্যাঃ ১০ টি", style:  TextStyle(
                                                        color: Colors.green.shade400,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                        fontFamily: "Josefin Sans"),),
                                                  
                                                   const SizedBox(height: 5,),
                                                  
                                                   Text("বাচ্চার ধরণঃ সোনালী বাচ্চা", style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                        fontFamily: "Josefin Sans"),),
                                              
                                              
                                                   const SizedBox(height: 2,),
                                                  
                                                  Text("প্রতি বাচ্চার বিক্রয় মূল্যঃ  টাকা", style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                        fontFamily: "Josefin Sans"),),
                                              
                                              
                                              
                                                   
                                              
                                                   const SizedBox(height: 2,),
                                                  Text("প্রতি বাচ্চার ক্রয় মূল্যঃ টাকা", style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                        fontFamily: "Josefin Sans"),),
                                  


                                  const SizedBox(height: 2,),
                                 Text("গত মাসে বিক্রিত বাচ্চার সংখ্যাঃ 7 টি", style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: "Josefin Sans"),),

                             const SizedBox(height: 2,),    

                                                  
                                              
                                            
                          
                                              
                                ],
                              ),
                              trailing: 
                                      PopupMenuButton(
                                        onSelected: (value) {
                                          // your logic
                                        },
                                        itemBuilder: (BuildContext bc) {
                                          return const [
                                            PopupMenuItem(
                                              child: Text("Edit"),
                                              value: '/hello',
                                            ),
                                            PopupMenuItem(
                                              child: Text("Previous Sale"),
                                              value: '/about',
                                            ),
                                            PopupMenuItem(
                                              child: Text("Due"),
                                              value: '/contact',
                                            )
                                          ];
                                        },
                                      ),
                            ),
                            // Container(
                            //   height: 100.0,
                            //   child: Image.asset("lib/Images/chicken_feed.png", fit: BoxFit.cover,),
                            // ),
                    
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(ColorName().appColor),

                                  ),
                                  child: const Text("বাচ্চা বিক্রয় করুন", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: "Josefin Sans"),),
                                  onPressed: () {

                                  },
                                ),
                              
                              ],
                            )
                          ],
                        ))

                  ],
                ),
              ),

               Center(child: Text("hello"),),




            
            ],
          ),
        ),
      ),
    );
  }
}