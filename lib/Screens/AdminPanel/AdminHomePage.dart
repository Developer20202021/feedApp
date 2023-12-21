import 'package:bijoy_helper/bijoy_helper.dart';
import 'package:feed/DeveloperAccess/DeveloperAccess.dart';
import 'package:feed/Screens/AdminPanel/DailySales.dart';
import 'package:feed/Screens/AdminPanel/DueCustomers.dart';
import 'package:feed/Screens/AdminPanel/MonthlySales.dart';
import 'package:feed/Screens/AdminPanel/YearlySales.dart';
import 'package:feed/Screens/StockManagement.dart';
import 'package:feed/Screens/StockUpload.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminHomePage extends StatefulWidget {


 const AdminHomePage({ super.key,});

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
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
          childCount: 20,
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