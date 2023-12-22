import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bijoy_helper/bijoy_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:feed/DeveloperAccess/DeveloperAccess.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class EditChickenStock extends StatefulWidget {

 final String ChickenStockID;




  const EditChickenStock({super.key, required this.ChickenStockID,});

  @override
  State<EditChickenStock> createState() => _EditChickenStockState();
}

class _EditChickenStockState extends State<EditChickenStock> {
  TextEditingController BagNumber = TextEditingController();

  TextEditingController PerBagSalePrice = TextEditingController();

  TextEditingController PerKgSalePrice = TextEditingController();

  TextEditingController PerKgBuyingPrice = TextEditingController();

  TextEditingController PerBagBuyingPrice = TextEditingController();

  TextEditingController PerChickenBuyingPrice = TextEditingController();

  TextEditingController PerChickenSalePrice = TextEditingController();

  TextEditingController ChickenNumberController = TextEditingController();

  TextEditingController FeedNameController = TextEditingController();

  TextEditingController MedicineNameController = TextEditingController();

  TextEditingController PerMedicineBuyingPrice = TextEditingController();

  TextEditingController PerMedicinSalePrice = TextEditingController();

  TextEditingController MedicineAmountController = TextEditingController();

  var uuid = Uuid();

  bool loading = false;




  List AllChickenStockData = [];

  Future<void> getChickenStockData() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _CustomerOrderHistoryCollectionRef =
        FirebaseFirestore.instance.collection('ChickenStockInfo');

    // // all Due Query Count
       Query _CustomerOrderHistoryCollectionRefDueQueryCount = _CustomerOrderHistoryCollectionRef.where("StockID", isEqualTo: widget.ChickenStockID);

    QuerySnapshot queryDueSnapshot =
        await _CustomerOrderHistoryCollectionRefDueQueryCount.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
  
        loading = false;
      });
    } else {
      setState(() {
        AllChickenStockData =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
        loading = false;
      });
    }

    SetChickenType();

    print(AllChickenStockData);
  }

















  final List<String> Bags = [
    '২৫ কেজি',
    '৫০ কেজি',
  ];
  String? selectedValue;

  final List<String> Chickens = [
    'সোনালী বাচ্চা',
    'ব্রয়লার বাচ্চা',
  ];
  String? ChickenTypeValue;

  final List<String> Medicins = [
    'ভিটামিন',
    'ভ্যাকসিন',
    'তরল বোতল',
    'ট্যাবলেট পাতা',
    'টিকা',
  ];
  String? MedicinsTypeValue;


// set bag type from server 

  void SetChickenType(){

    setState(() {
      ChickenTypeValue = AllChickenStockData[0]["ChickenType"];
    });
  }



@override
  void initState() {

    getChickenStockData();
    
   

    super.initState();
  }














  @override
  Widget build(BuildContext context) {
    var StockID = uuid.v4();

    double width = MediaQuery.of(context).size.width;





    ChickenNumberController.text = "${AllChickenStockData[0]["ChickenNumber"]}";

    PerChickenSalePrice.text = AllChickenStockData[0]["ChickenSalePrice"];

    PerChickenBuyingPrice.text = AllChickenStockData[0]["ChickenBuyingPrice"];












    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed App',
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_circle_left, size: 22,color: Colors.white,)),
            title: Text(
              "স্টক পরিবর্তন করবেন".toBijoy,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: "SiyamRupali"),
            ),
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.redAccent,
              tabs: [
             
                Tab(
                    text: 'মুরগীর বাচ্চা',
                    icon: Image.asset(
                      "lib/Images/chicken_baby.png",
                      width: 40,
                      height: 40,
                    )),
           
              ],
            ),
          ),
          body: TabBarView(
            children: [
             
              // Second Tab
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 30,
                              decoration: InputDecoration(
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(top: 17),
                                  child: Text(
                                    "টি",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: "Josefin Sans"),
                                  ),
                                ),

                                prefixIcon: Image.asset(
                                  "lib/Images/chicken_baby.png",
                                  width: 10,
                                  height: 10,
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'বাচ্চার সংখ্যা লিখুন',
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Josefin Sans"),

                                hintText: 'বাচ্চার সংখ্যা লিখুন',
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Josefin Sans"),

                                //  enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                //     ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).primaryColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 66, 125, 145)),
                                ),
                              ),
                              controller: ChickenNumberController,
                            ),
                            SizedBox(height: 10),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: const Text(
                                  'বাচ্চার ধরণ উল্লেখ করুন',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: "Josefin Sans"),
                                ),
                                items: Chickens.map(
                                    (String item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Josefin Sans"),
                                          ),
                                        )).toList(),
                                value: ChickenTypeValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    ChickenTypeValue = value;
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  height: 70,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: Colors.white),
                                  elevation: 2,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 30,
                              decoration: InputDecoration(
                                suffixIcon: const Text(
                                  "৳",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      fontFamily: "Josefin Sans"),
                                ),

                                prefixIcon: Image.asset(
                                  "lib/Images/chicken_bag.png",
                                  width: 10,
                                  height: 10,
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'প্রতি পিছের বিক্রয় মূল্য',
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Josefin Sans"),

                                hintText: 'প্রতি পিছের বিক্রয় মূল্য',
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Josefin Sans"),

                                //  enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                //     ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).primaryColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 66, 125, 145)),
                                ),
                              ),
                              controller: PerChickenSalePrice,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 30,
                              decoration: InputDecoration(
                                suffixIcon: const Text(
                                  "৳",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      fontFamily: "Josefin Sans"),
                                ),
                                prefixIcon: Image.asset(
                                  "lib/Images/chicken_bag.png",
                                  width: 10,
                                  height: 10,
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'প্রতি পিছের ক্রয় মূল্য',
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Josefin Sans"),

                                hintText: 'প্রতি পিছের ক্রয় মূল্য',
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Josefin Sans"),

                                //  enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                //     ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).primaryColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 66, 125, 145)),
                                ),
                              ),
                              controller: PerChickenBuyingPrice,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              ColorName().appColor)),
                                  onPressed: () async {
                                    AwesomeDialog(
                                            showCloseIcon: true,
                                            customHeader: Image.asset(
                                              "lib/Images/alert.png",
                                              width: 90,
                                              height: 90,
                                            ),
                                            context: context,
                                            dialogType: DialogType.info,
                                            animType: AnimType.rightSlide,
                                            body: SingleChildScrollView(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "আপনি নিচে দেখে নিশ্চিত করুন সব ঠিক আছে কি না?",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "Josefin Sans"),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      "বাচ্চার সংখ্যাঃ ${ChickenNumberController.text} টি",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Josefin Sans"),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "বাচ্চার ধরণঃ $ChickenTypeValue",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Josefin Sans"),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "প্রতি বাচ্চার বিক্রয় মূল্যঃ ${PerChickenSalePrice.text} টাকা",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Josefin Sans"),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "প্রতি বাচ্চার ক্রয় মূল্যঃ ${PerChickenBuyingPrice.text} টাকা",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Josefin Sans"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            btnOkOnPress: () async {
                                              Future
                                                  SaveChickenStockdata() async {
                                                setState(() {
                                                  loading = true;
                                                });

                                                final docUser =
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            "ChickenStockInfo")
                                                        .doc(widget.ChickenStockID);

                                                final SetData = {
                                                
                                                  "ChickenNumber":
                                                      ChickenNumberController
                                                          .text
                                                          .trim(),
                                                  "ChickenType":
                                                      ChickenTypeValue
                                                          .toString(),
                                                  "ChickenSalePrice":
                                                      PerChickenSalePrice.text
                                                          .trim(),
                                                  "ChickenBuyingPrice":
                                                      PerChickenBuyingPrice.text
                                                          .trim(),
                                                  "Date": DateTime.now()
                                                      .toIso8601String(),
                                                  "month":
                                                      "${DateTime.now().month}/${DateTime.now().year}",
                                                  "year":
                                                      "${DateTime.now().year}",
                                                };

                                                // user Data Update and show snackbar

                                                docUser
                                                    .update(SetData)
                                                    .then((value) =>
                                                        setState(() {
                                                          setState(() {
                                                            loading = false;
                                                          });

                                                          print("Done");

                                                          final snackBar =
                                                              SnackBar(
                                                            /// need to set following properties for best effect of awesome_snackbar_content
                                                            elevation: 0,
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            content:
                                                                AwesomeSnackbarContent(
                                                              title:
                                                                  'Stock Upload Successfull',
                                                              message:
                                                                  'Stock Upload Successfull',

                                                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                              contentType:
                                                                  ContentType
                                                                      .success,
                                                            ),
                                                          );

                                                          ScaffoldMessenger.of(
                                                              context)
                                                            ..hideCurrentSnackBar()
                                                            ..showSnackBar(
                                                                snackBar);
                                                        }))
                                                    .onError((error,
                                                            stackTrace) =>
                                                        setState(() {
                                                          loading = false;

                                                          final snackBar =
                                                              SnackBar(
                                                            /// need to set following properties for best effect of awesome_snackbar_content
                                                            elevation: 0,
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            content:
                                                                AwesomeSnackbarContent(
                                                              title:
                                                                  'Stock Upload Successfull',
                                                              message:
                                                                  'Stock Upload Successfull',

                                                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                              contentType:
                                                                  ContentType
                                                                      .failure,
                                                            ),
                                                          );

                                                          ScaffoldMessenger.of(
                                                              context)
                                                            ..hideCurrentSnackBar()
                                                            ..showSnackBar(
                                                                snackBar);

                                                          print(error);
                                                        }));
                                              }

                                              SaveChickenStockdata();
                                            },
                                            btnCancelOnPress: () {},
                                            btnOkColor: ColorName().appColor,
                                            btnCancelColor:
                                                ColorName().CancelBtnColor)
                                        .show();
                                  },
                                  icon: Icon(Icons.add,
                                      size: 18, color: Colors.white),
                                  label: const Text(
                                    "সংরক্ষণ করুন",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: "Josefin Sans",
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

            ]
          ),
        ),
      ),
    );
  }
}
