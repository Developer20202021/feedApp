import 'package:bijoy_helper/bijoy_helper.dart';
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
                            onPressed: (){

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

                      for(int i=0; i<20; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                        





                    ],
                  ),
                ),








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
                            onPressed: (){

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

                      for(int i=0; i<20; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                        





                    ],
                  ),
                ),



                
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
                            onPressed: (){

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

                      for(int i=0; i<20; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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