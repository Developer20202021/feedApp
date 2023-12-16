import 'package:bijoy_helper/bijoy_helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {


  TextEditingController BagNumber = TextEditingController();

  TextEditingController PerBagSalePrice = TextEditingController();

  TextEditingController PerKgSalePrice = TextEditingController();




  final List<String> Bags = [
  '২৫ কেজি ',
  '৫০ কেজি ',
];
String? selectedValue;





  @override
  Widget build(BuildContext context) {

    
double width = MediaQuery. of(context). size. width ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
          "স্টক যুক্ত করবেন"
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
          body:  TabBarView(
            children: [

              // First Tab
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                      SizedBox(height: 30,),

                      TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 30,
                      decoration: InputDecoration(

                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: Text("টি", style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Josefin Sans"),),
                        ),

                          prefixIcon: Image.asset("lib/Images/fish-food.png", width: 10, height: 10,),
                          border: OutlineInputBorder(),
                          labelText: 'বস্তার সংখ্যা লিখুন',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Josefin Sans"),
                       
                          hintText: 'বস্তার সংখ্যা লিখুন',
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
                      controller: BagNumber,
                    ),

                    SizedBox(height:10),


                    DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Text(
                              'বস্তার ধরণ উল্লেখ করবেন',
                              style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "SiyamRupali"),
                            ),
                            items: Bags
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item.toBijoy,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            fontFamily: "SiyamRupali"),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 70,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: Colors.white
                                  
                                ),
                                elevation: 2,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),


                         SizedBox(height: 20,),

                      TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 30,
                      decoration: InputDecoration(
                          suffixIcon: Text("৳", style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                            fontFamily: "Josefin Sans"),),


                          prefixIcon: Image.asset("lib/Images/fish-food.png", width: 10, height: 10,),
                          border: OutlineInputBorder(),
                          labelText: 'প্রতি বস্তার বিক্রয় মূল্য',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Josefin Sans"),
                       
                          hintText: 'প্রতি বস্তার বিক্রয় মূল্য',
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
                      controller: PerBagSalePrice,
                    ),



                    SizedBox(height: 20,),

                      TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 30,
                      decoration: InputDecoration(
                          suffixIcon: Text("৳", style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                            fontFamily: "Josefin Sans"),),
                          prefixIcon: Image.asset("lib/Images/kg.png", width: 10, height: 10,),
                          border: OutlineInputBorder(),
                          labelText: 'প্রতি কেজি বিক্রয় মূল্য',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Josefin Sans"),
                       
                          hintText: 'প্রতি কেজি বিক্রয় মূল্য',
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
                      controller: PerKgSalePrice,
                    ),

                        
             
                  
                      ],
                    ),
                  ),
                ),
                Center(child: Text('CATS')),
                Center(child: Text('BIRDS')),
            ],
          ),
        ),
      ),
    );
  }
}