import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bijoy_helper/bijoy_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:feed/DeveloperAccess/DeveloperAccess.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:uuid/uuid.dart';

class StockShow extends StatefulWidget {
  const StockShow({super.key});

  @override
  State<StockShow> createState() => _StockShowState();
}

class _StockShowState extends State<StockShow> {
  Map<String, double> dataMap = {
    "ক্রয়": 60,
    "বিক্রয়": 40,
    "লাভ": 40,
  };

  Map<String, double> ChickenSaleBuyData = {
    "ক্রয়": 60,
    "বিক্রয়": 40,
    "লাভ": 40,
  };

  Map<String, double> KhuchraSaleBuyData = {
    "ক্রয়": 60,
    "বিক্রয়": 40,
    "লাভ": 40,
  };

  Map<String, double> bagAndkhuchraChartData = {
    "বস্তা": 60,
    "খুচরা": 40,
  };

  final List<String> Bags = [
    '২৫ কেজি ',
    '৫০ কেজি ',
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

  var uuid = Uuid();

  String? MedicinsTypeValue;

  int BagAmount = 0;

  TextEditingController SaleBagNumberController = TextEditingController();

  TextEditingController CustomerNameController = TextEditingController();

  TextEditingController CustomerPhoneNumberController = TextEditingController();

  TextEditingController CustomerAddressController = TextEditingController();

  TextEditingController KhuchraAmountController = TextEditingController();

  TextEditingController BagToKhuchraConvertController = TextEditingController();

  TextEditingController ChickenNumberController = TextEditingController();

  TextEditingController MedicinNumberController = TextEditingController();

  TextEditingController JomaController = TextEditingController();

  bool loading = false;
  String FirstTabDataLoad = "";

  // Firebase All Customer Data Load

  List AllFeedStockData = [];

  Future<void> getFeedStockData() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _CustomerOrderHistoryCollectionRef =
        FirebaseFirestore.instance.collection('FeedStockInfo');

    // // all Due Query Count
    //    Query _CustomerOrderHistoryCollectionRefDueQueryCount = _CustomerOrderHistoryCollectionRef.where("Department", isEqualTo: widget.DepartmentName).where("Semister", isEqualTo: widget.SemisterName).where("StudentStatus", isEqualTo: "new");

    QuerySnapshot queryDueSnapshot =
        await _CustomerOrderHistoryCollectionRef.get();

    var RecentGetFeedData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetFeedData.isEmpty) {
      setState(() {
        FirstTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllFeedStockData =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
        loading = false;
      });
    }

    print(AllFeedStockData);
  }

  String SecondTabDataLoad = "";

  // Firebase All Customer Data Load

  List AllChickenStockData = [];

  Future<void> getChickenStockData() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _CustomerOrderHistoryCollectionRef =
        FirebaseFirestore.instance.collection('ChickenStockInfo');

    // // all Due Query Count
    //    Query _CustomerOrderHistoryCollectionRefDueQueryCount = _CustomerOrderHistoryCollectionRef.where("Department", isEqualTo: widget.DepartmentName).where("Semister", isEqualTo: widget.SemisterName).where("StudentStatus", isEqualTo: "new");

    QuerySnapshot queryDueSnapshot =
        await _CustomerOrderHistoryCollectionRef.get();

    var RecentGetChickenStockData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetChickenStockData.isEmpty) {
      setState(() {
        SecondTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllChickenStockData =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
        loading = false;
      });
    }

    print(AllChickenStockData);
  }

  String thirdTabDataLoad = "";

  // Firebase All Customer Data Load

  List AllMedicineStockData = [];

  Future<void> getMedicineStockData() async {
    setState(() {
      loading = true;
    });

    // Get docs from collection reference
    CollectionReference _CustomerOrderHistoryCollectionRef =
        FirebaseFirestore.instance.collection('MedicinStockInfo');

    // // all Due Query Count
    //    Query _CustomerOrderHistoryCollectionRefDueQueryCount = _CustomerOrderHistoryCollectionRef.where("Department", isEqualTo: widget.DepartmentName).where("Semister", isEqualTo: widget.SemisterName).where("StudentStatus", isEqualTo: "new");

    QuerySnapshot queryDueSnapshot =
        await _CustomerOrderHistoryCollectionRef.get();

    var RecentGetMedicineStockData =
        queryDueSnapshot.docs.map((doc) => doc.data()).toList();

    if (RecentGetMedicineStockData.isEmpty) {
      setState(() {
        thirdTabDataLoad = "0";
        loading = false;
      });
    } else {
      setState(() {
        AllMedicineStockData =
            queryDueSnapshot.docs.map((doc) => doc.data()).toList();
        loading = false;
      });
    }

    print(AllMedicineStockData);
  }

  @override
  void initState() {
    getFeedStockData();
    getChickenStockData();
    getMedicineStockData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var SaleID = uuid.v4();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed App',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_circle_left,
                  size: 22,
                  color: Colors.white,
                )),
            title: Text(
              "স্টক দেখুন".toBijoy,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: "SiyamRupali"),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.redAccent,
              tabs: [
                Tab(
                    text: 'মুরগীর খাদ্য',
                    icon: Image.asset(
                      "lib/Images/chicken_feed.png",
                      width: 40,
                      height: 40,
                    )),
                Tab(
                    text: 'মুরগীর বাচ্চা',
                    icon: Image.asset(
                      "lib/Images/chicken_baby.png",
                      width: 40,
                      height: 40,
                    )),
                Tab(
                    text: 'মেডিসিন',
                    icon: Image.asset(
                      "lib/Images/drugs.png",
                      width: 40,
                      height: 40,
                    )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // first tab

              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : FirstTabDataLoad == "0"
                      ? Center(
                          child: Text("No Data Available"),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              for (int i = 0; i < AllFeedStockData.length; i++)
                                InkWell(
                                  // আয় ও ব্যয়ের তথ্য
                                  onTap: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return AlertDialog(
                                                elevation: 50.0,
                                                title: const Center(
                                                  child: Text(
                                                    "গত মাসের বস্তা ক্রয় বিক্রয় লাভের তথ্য",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        fontFamily:
                                                            "Josefin Sans"),
                                                  ),
                                                ),
                                                content: Container(
                                                  height: 200,
                                                  child: Center(
                                                      child: PieChart(
                                                    dataMap: dataMap,
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
                                                                    .visible,
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
                                                ));
                                          });
                                        });
                                  },

                                  // বস্তা ও খুচরা বিক্রি তথ্য

                                  onLongPress: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return AlertDialog(
                                                elevation: 50.0,
                                                title: const Center(
                                                  child: Text(
                                                    "গত মাসের বস্তা(টি) ও খুচরা(কেজি) বিক্রির তথ্য",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        fontFamily:
                                                            "Josefin Sans"),
                                                  ),
                                                ),
                                                content: Container(
                                                  height: 200,
                                                  child: Center(
                                                      child: PieChart(
                                                    dataMap:
                                                        bagAndkhuchraChartData,
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
                                                ));
                                          });
                                        });
                                  },

                                  onDoubleTap: // বস্তা ও খুচরা বিক্রি তথ্য

                                      () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return AlertDialog(
                                                elevation: 50.0,
                                                title: const Center(
                                                  child: Text(
                                                    "গত মাসের খুচরা(কেজি) ক্রয় বিক্রয়ের তথ্য",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        fontFamily:
                                                            "Josefin Sans"),
                                                  ),
                                                ),
                                                content: Container(
                                                  height: 200,
                                                  child: Center(
                                                      child: PieChart(
                                                    dataMap: KhuchraSaleBuyData,
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
                                                ));
                                          });
                                        });
                                  },
                                  child: Card(
                                      elevation: 8.0,
                                      child: Column(
                                        children: [
                                          int.parse(AllFeedStockData[i]
                                                      ["FeedBagNumber"]) <=
                                                  0
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      height: 70.0,
                                                      child: Image.asset(
                                                        "lib/Images/sold_out.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Text(""),

                                          ListTile(
                                            title: Text(
                                              "খাদ্যের নাম: ${AllFeedStockData[i]["FeedName"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontFamily: "Josefin Sans"),
                                            ),
                                            subtitle: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "মোট বস্তার সংখ্যাঃ ${AllFeedStockData[i]["FeedBagNumber"]} টি",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.green.shade400,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily:
                                                          "Josefin Sans"),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "বস্তার ধরণঃ ${AllFeedStockData[i]["FeedBagType"]}",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.pink.shade400,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily:
                                                          "Josefin Sans"),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "প্রতি বস্তার বিক্রয় মূল্যঃ ${AllFeedStockData[i]["PerBagSalePrice"]} টাকা",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          "Josefin Sans"),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "প্রতি কেজি বিক্রয় মূল্যঃ ${AllFeedStockData[i]["PerKgSalePrice"]} টাকা",
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          "Josefin Sans"),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "প্রতি বস্তার ক্রয় মূল্যঃ ${AllFeedStockData[i]["PerBagBuyingPrice"]} টাকা",
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          "Josefin Sans"),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "প্রতি কেজি ক্রয় মূল্যঃ ${AllFeedStockData[i]["PerKgBuyingPrice"]} টাকা",
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          "Josefin Sans"),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "অবশিষ্ট খুচরা পরিমানঃ ${AllFeedStockData[i]["KhuchraAmountKg"]} কেজি",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.green.shade400,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          "Josefin Sans"),
                                                ),
                                              ],
                                            ),
                                            trailing: PopupMenuButton(
                                              onSelected: (value) {
                                                // your logic
                                              },
                                              itemBuilder: (BuildContext bc) {
                                                return [
                                                  PopupMenuItem(
                                                    onTap: () async {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return StatefulBuilder(
                                                                builder: (context,
                                                                    setState) {
                                                              return AlertDialog(
                                                                  actions: [
                                                                    ElevatedButton(
                                                                        style:
                                                                            ButtonStyle(
                                                                          elevation:
                                                                              MaterialStatePropertyAll(15),
                                                                          backgroundColor:
                                                                              MaterialStatePropertyAll(ColorName().appColor),
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          // Update FeedStock bag Number Data

                                                                          Future
                                                                              updateData() async {
                                                                            final docUser =
                                                                                FirebaseFirestore.instance.collection("FeedStockInfo").doc(AllFeedStockData[i]["StockID"]);

                                                                            final UpadateData =
                                                                                {
                                                                              "FeedBagNumber": (int.parse(AllFeedStockData[i]["FeedBagNumber"].toString()) - (int.parse(BagToKhuchraConvertController.text.trim().toString()))).toString(),
                                                                              "KhuchraAmountKg": (int.parse(BagToKhuchraConvertController.text.trim().toString())) * (AllFeedStockData[i]["FeedBagType"].toString().split(" ")[0] == "২৫" ? 25 : 50)
                                                                            };

                                                                            // user Data Update and show snackbar

                                                                            docUser
                                                                                .update(UpadateData)
                                                                                .then((value) => setState(() {
                                                                                      setState(() {
                                                                                        loading = false;
                                                                                      });

                                                                                      Navigator.of(context).pop();

                                                                                      print("Done");

                                                                                      final snackBar = SnackBar(
                                                                                        /// need to set following properties for best effect of awesome_snackbar_content
                                                                                        elevation: 0,
                                                                                        behavior: SnackBarBehavior.floating,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        content: AwesomeSnackbarContent(
                                                                                          title: 'Sale Successfull',
                                                                                          message: 'Sale Successfull',

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
                                                                                      Navigator.of(context).pop();
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
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Convert",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ))
                                                                  ],
                                                                  elevation:
                                                                      50.0,
                                                                  title:
                                                                      const Center(
                                                                    child: Text(
                                                                      "বস্তা থেকে খুচরাতে নিয়ে আসুন",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              17,
                                                                          overflow: TextOverflow
                                                                              .visible,
                                                                          fontFamily:
                                                                              "Josefin Sans"),
                                                                    ),
                                                                  ),
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        TextField(
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          maxLength:
                                                                              30,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                            labelText:
                                                                                'বস্তার সংখ্যা লিখুন',
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 14,
                                                                                fontFamily: "Josefin Sans"),

                                                                            hintText:
                                                                                'বস্তার সংখ্যা লিখুন',
                                                                            hintStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 14,
                                                                                fontFamily: "Josefin Sans"),

                                                                            //  enabledBorder: OutlineInputBorder(
                                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                            //     ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                            ),
                                                                            errorBorder:
                                                                                const OutlineInputBorder(
                                                                              borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                            ),
                                                                          ),
                                                                          controller:
                                                                              BagToKhuchraConvertController,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ));
                                                            });
                                                          });
                                                    },
                                                    child: const Text(
                                                      "বস্তা থেকে খুচরা",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Josefin Sans"),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text("Edit"),
                                                    value: '/hello',
                                                  ),
                                                  PopupMenuItem(
                                                    child:
                                                        Text("Previous Sale"),
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
                                            alignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              int.parse(AllFeedStockData[i]
                                                          ["FeedBagNumber"]) <=
                                                      0
                                                  ? Text("")
                                                  : ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                ColorName()
                                                                    .appColor),
                                                      ),
                                                      child: const Text(
                                                        "বস্তা বিক্রয় করুন",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "Josefin Sans"),
                                                      ),
                                                      onPressed: () async {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return StatefulBuilder(
                                                                  builder: (context,
                                                                      setState) {
                                                                return AlertDialog(
                                                                    actions: [
                                                                      ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            elevation:
                                                                                const MaterialStatePropertyAll(15),
                                                                            backgroundColor:
                                                                                MaterialStatePropertyAll(ColorName().appColor),
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            Future
                                                                                SaveFeedSaledata() async {
                                                                              setState(() {
                                                                                loading = true;
                                                                              });

                                                                              final docUser = FirebaseFirestore.instance.collection("FeedSaleInfo").doc(SaleID);

                                                                              final SetData = {
                                                                                "SaleID": SaleID,
                                                                                "FeedName": AllFeedStockData[i]["FeedName"],
                                                                                "SaleFeedBagNumber": SaleBagNumberController.text.trim(),
                                                                                "StockID": AllFeedStockData[i]["StockID"],
                                                                                "SaleFeedBagType": AllFeedStockData[i]["FeedBagType"],
                                                                                "PerBagSalePrice": AllFeedStockData[i]["PerBagSalePrice"],
                                                                                "PerKgSalePrice": AllFeedStockData[i]["PerKgSalePrice"],
                                                                                "PerBagBuyingPrice": AllFeedStockData[i]["PerBagBuyingPrice"],
                                                                                "PerKgBuyingPrice": AllFeedStockData[i]["PerKgBuyingPrice"],
                                                                                "SaleAmount": int.parse(SaleBagNumberController.text.trim()) * double.parse(AllFeedStockData[i]["PerBagSalePrice"]),
                                                                                "JomaAmount": JomaController.text.trim(),
                                                                                "DueAmount": (int.parse(SaleBagNumberController.text.trim()) * double.parse(AllFeedStockData[i]["PerBagSalePrice"])) - double.parse(JomaController.text.trim()),
                                                                                "Profit": (int.parse(SaleBagNumberController.text.trim()) * double.parse(AllFeedStockData[i]["PerBagSalePrice"])) - (int.parse(SaleBagNumberController.text.trim()) * double.parse(AllFeedStockData[i]["PerBagBuyingPrice"])),
                                                                                "CustomerName": CustomerNameController.text.trim(),
                                                                                "CustomerAddress": CustomerAddressController.text.trim(),
                                                                                "CustomerPhoneNo": CustomerPhoneNumberController.text.trim(),
                                                                                "Date": DateTime.now().toIso8601String(),
                                                                                "month": "${DateTime.now().month}/${DateTime.now().year}",
                                                                                "year": "${DateTime.now().year}",
                                                                              };

                                                                              // user Data Update and show snackbar

                                                                              docUser
                                                                                  .set(SetData)
                                                                                  .then((value) => setState(() {
                                                                                        setState(() {
                                                                                          loading = false;
                                                                                        });

                                                                                        print("Done");

                                                                                        // Update FeedStock bag Number Data

                                                                                        Future updateData() async {
                                                                                          final docUser = FirebaseFirestore.instance.collection("FeedStockInfo").doc(AllFeedStockData[i]["StockID"]);

                                                                                          final UpadateData = {
                                                                                            "FeedBagNumber": (int.parse(AllFeedStockData[i]["FeedBagNumber"].toString()) - (int.parse(SaleBagNumberController.text.trim().toString()))).toString()
                                                                                          };

                                                                                          // user Data Update and show snackbar

                                                                                          docUser
                                                                                              .update(UpadateData)
                                                                                              .then((value) => setState(() {
                                                                                                    setState(() {
                                                                                                      loading = false;
                                                                                                    });

                                                                                                    print("Done");

                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Sale Successfull',
                                                                                                        message: 'Sale Successfull',

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

                                                                                        getFeedStockData();

                                                                                        final snackBar = SnackBar(
                                                                                          /// need to set following properties for best effect of awesome_snackbar_content
                                                                                          elevation: 0,
                                                                                          behavior: SnackBarBehavior.floating,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          content: AwesomeSnackbarContent(
                                                                                            title: 'Stock Upload Successfull',
                                                                                            message: 'Stock Upload Successfull',

                                                                                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                            contentType: ContentType.success,
                                                                                          ),
                                                                                        );

                                                                                        ScaffoldMessenger.of(context)
                                                                                          ..hideCurrentSnackBar()
                                                                                          ..showSnackBar(snackBar);

                                                                                        Navigator.of(context).pop();
                                                                                      }))
                                                                                  .onError((error, stackTrace) => setState(() {
                                                                                        loading = false;

                                                                                        final snackBar = SnackBar(
                                                                                          /// need to set following properties for best effect of awesome_snackbar_content
                                                                                          elevation: 0,
                                                                                          behavior: SnackBarBehavior.floating,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          content: AwesomeSnackbarContent(
                                                                                            title: 'Stock Upload Successfull',
                                                                                            message: 'Stock Upload Successfull',

                                                                                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                            contentType: ContentType.failure,
                                                                                          ),
                                                                                        );

                                                                                        ScaffoldMessenger.of(context)
                                                                                          ..hideCurrentSnackBar()
                                                                                          ..showSnackBar(snackBar);

                                                                                        Navigator.of(context).pop();

                                                                                        print(error);
                                                                                      }));
                                                                            }

                                                                            SaveFeedSaledata();
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            "Sale Now",
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ))
                                                                    ],
                                                                    elevation:
                                                                        50.0,
                                                                    title:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "বস্তা বিক্রির তথ্য দিন",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                17,
                                                                            overflow:
                                                                                TextOverflow.visible,
                                                                            fontFamily: "Josefin Sans"),
                                                                      ),
                                                                    ),
                                                                    content:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          TextField(
                                                                            readOnly:
                                                                                true,
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            maxLength:
                                                                                30,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'বিক্রিত বস্তার ধরণঃ ${AllFeedStockData[i]["FeedBagType"]}',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17, fontFamily: "Josefin Sans"),

                                                                              hintText: 'বিক্রিত বস্তার ধরণঃ ${AllFeedStockData[i]["FeedBagType"]}',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            maxLength:
                                                                                30,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'বিক্রিত বস্তার সংখ্যা লিখুন',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'বিক্রিত বস্তার সংখ্যা লিখুন',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                SaleBagNumberController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            maxLength:
                                                                                30,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'জমার পরিমান লিখুন',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'জমার পরিমান লিখুন',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                JomaController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.name,
                                                                            maxLength:
                                                                                80,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'ক্রেতার নাম',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'ক্রেতার নাম',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                CustomerNameController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.phone,
                                                                            maxLength:
                                                                                80,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'ক্রেতার ফোন নং',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'ক্রেতার ফোন নং',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                CustomerPhoneNumberController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.streetAddress,
                                                                            maxLength:
                                                                                180,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'ক্রেতার ঠিকানা',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'ক্রেতার ঠিকানা',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                CustomerAddressController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ));
                                                              });
                                                            });
                                                      },
                                                    ),
                                              AllFeedStockData[i]
                                                          ["KhuchraAmountKg"] <=
                                                      0
                                                  ? Text("")
                                                  : ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                ColorName()
                                                                    .appColor),
                                                      ),
                                                      child: const Text(
                                                        "খুচরা বিক্রয় করুন",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "Josefin Sans"),
                                                      ),
                                                      onPressed: () async {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return StatefulBuilder(
                                                                  builder: (context,
                                                                      setState) {
                                                                return AlertDialog(
                                                                    actions: [
                                                                      ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            elevation:
                                                                                const MaterialStatePropertyAll(15),
                                                                            backgroundColor:
                                                                                MaterialStatePropertyAll(ColorName().appColor),
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            Future
                                                                                SaveFeedSaledata() async {
                                                                              setState(() {
                                                                                loading = true;
                                                                              });

                                                                              final docUser = FirebaseFirestore.instance.collection("FeedKhuchraSaleInfo").doc(SaleID);

                                                                              final SetData = {
                                                                                "SaleID": SaleID,
                                                                                "FeedName": AllFeedStockData[i]["FeedName"],
                                                                                "SaleFeedKgNumber": KhuchraAmountController.text.trim(),
                                                                                "StockID": AllFeedStockData[i]["StockID"],
                                                                                "SaleFeedBagType": AllFeedStockData[i]["FeedBagType"],
                                                                                "PerBagSalePrice": AllFeedStockData[i]["PerBagSalePrice"],
                                                                                "PerKgSalePrice": AllFeedStockData[i]["PerKgSalePrice"],
                                                                                "PerBagBuyingPrice": AllFeedStockData[i]["PerBagBuyingPrice"],
                                                                                "PerKgBuyingPrice": AllFeedStockData[i]["PerKgBuyingPrice"],
                                                                                "SaleAmount": int.parse(KhuchraAmountController.text.trim().toString()) * double.parse(AllFeedStockData[i]["PerKgSalePrice"]),
                                                                                "JomaAmount": JomaController.text.trim(),
                                                                                "DueAmount": (int.parse(KhuchraAmountController.text.trim()) * double.parse(AllFeedStockData[i]["PerKgSalePrice"])) - double.parse(JomaController.text.trim()),
                                                                                "Profit": (int.parse(KhuchraAmountController.text.trim()) * double.parse(AllFeedStockData[i]["PerKgSalePrice"].toString())) - (int.parse(KhuchraAmountController.text.trim()) * double.parse(AllFeedStockData[i]["PerKgBuyingPrice"].toString())),
                                                                                "CustomerName": CustomerNameController.text.trim(),
                                                                                "CustomerAddress": CustomerAddressController.text.trim(),
                                                                                "CustomerPhoneNo": CustomerPhoneNumberController.text.trim(),
                                                                                "Date": DateTime.now().toIso8601String(),
                                                                                "month": "${DateTime.now().month}/${DateTime.now().year}",
                                                                                "year": "${DateTime.now().year}",
                                                                              };

                                                                              // user Data Update and show snackbar

                                                                              docUser
                                                                                  .set(SetData)
                                                                                  .then((value) => setState(() {
                                                                                        setState(() {
                                                                                          loading = false;
                                                                                        });

                                                                                        print("Done");

                                                                                        // Update FeedStock bag Number Data

                                                                                        Future updateData() async {
                                                                                          final docUser = FirebaseFirestore.instance.collection("FeedStockInfo").doc(AllFeedStockData[i]["StockID"]);

                                                                                          final UpadateData = {
                                                                                            "KhuchraAmountKg": (int.parse(AllFeedStockData[i]["KhuchraAmountKg"].toString()) - (int.parse(KhuchraAmountController.text.trim().toString())))
                                                                                          };

                                                                                          // user Data Update and show snackbar

                                                                                          docUser
                                                                                              .update(UpadateData)
                                                                                              .then((value) => setState(() {
                                                                                                    setState(() {
                                                                                                      loading = false;
                                                                                                    });

                                                                                                    print("Done");

                                                                                                    final snackBar = SnackBar(
                                                                                                      /// need to set following properties for best effect of awesome_snackbar_content
                                                                                                      elevation: 0,
                                                                                                      behavior: SnackBarBehavior.floating,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      content: AwesomeSnackbarContent(
                                                                                                        title: 'Sale Successfull',
                                                                                                        message: 'Sale Successfull',

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

                                                                                        getFeedStockData();

                                                                                        final snackBar = SnackBar(
                                                                                          /// need to set following properties for best effect of awesome_snackbar_content
                                                                                          elevation: 0,
                                                                                          behavior: SnackBarBehavior.floating,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          content: AwesomeSnackbarContent(
                                                                                            title: 'Stock Upload Successfull',
                                                                                            message: 'Stock Upload Successfull',

                                                                                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                            contentType: ContentType.success,
                                                                                          ),
                                                                                        );

                                                                                        ScaffoldMessenger.of(context)
                                                                                          ..hideCurrentSnackBar()
                                                                                          ..showSnackBar(snackBar);

                                                                                        Navigator.of(context).pop();
                                                                                      }))
                                                                                  .onError((error, stackTrace) => setState(() {
                                                                                        loading = false;

                                                                                        final snackBar = SnackBar(
                                                                                          /// need to set following properties for best effect of awesome_snackbar_content
                                                                                          elevation: 0,
                                                                                          behavior: SnackBarBehavior.floating,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          content: AwesomeSnackbarContent(
                                                                                            title: 'Stock Upload Successfull',
                                                                                            message: 'Stock Upload Successfull',

                                                                                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                                            contentType: ContentType.failure,
                                                                                          ),
                                                                                        );

                                                                                        ScaffoldMessenger.of(context)
                                                                                          ..hideCurrentSnackBar()
                                                                                          ..showSnackBar(snackBar);

                                                                                        Navigator.of(context).pop();

                                                                                        print(error);
                                                                                      }));
                                                                            }

                                                                            SaveFeedSaledata();
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            "Sale Now",
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ))
                                                                    ],
                                                                    elevation:
                                                                        50.0,
                                                                    title:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "খুচরা পরিমান বিক্রির তথ্য দিন",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                17,
                                                                            overflow:
                                                                                TextOverflow.visible,
                                                                            fontFamily: "Josefin Sans"),
                                                                      ),
                                                                    ),
                                                                    content:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            maxLength:
                                                                                30,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: "বিক্রিত খুচরা পরিমান কেজি",
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'বিক্রিত খুচরা পরিমান কেজি',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                KhuchraAmountController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            maxLength:
                                                                                30,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'জমার পরিমান লিখুন',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'জমার পরিমান লিখুন',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                JomaController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.name,
                                                                            maxLength:
                                                                                80,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'ক্রেতার নাম',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'ক্রেতার নাম',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                CustomerNameController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.phone,
                                                                            maxLength:
                                                                                80,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'ক্রেতার ফোন নং',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'ক্রেতার ফোন নং',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                CustomerPhoneNumberController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          TextField(
                                                                            keyboardType:
                                                                                TextInputType.streetAddress,
                                                                            maxLength:
                                                                                180,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(),
                                                                              labelText: 'ক্রেতার ঠিকানা',
                                                                              labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              hintText: 'ক্রেতার ঠিকানা',
                                                                              hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Josefin Sans"),

                                                                              //  enabledBorder: OutlineInputBorder(
                                                                              //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                                              //     ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                                                                              ),
                                                                              errorBorder: const OutlineInputBorder(
                                                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                                                                              ),
                                                                            ),
                                                                            controller:
                                                                                CustomerAddressController,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ));
                                                              });
                                                            });
                                                      },
                                                    )
                                            ],
                                          )
                                        ],
                                      )),
                                )
                            ],
                          ),
                        ),

              // second Tab
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return AlertDialog(
                                    elevation: 50.0,
                                    title: const Center(
                                      child: Text(
                                        "গত মাসের ক্রয় বিক্রয় লাভের তথ্য",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: "Josefin Sans"),
                                      ),
                                    ),
                                    content: Container(
                                      height: 200,
                                      child: Center(
                                          child: PieChart(
                                        dataMap: dataMap,
                                        animationDuration:
                                            Duration(milliseconds: 800),
                                        chartLegendSpacing: 22,

                                        chartRadius:
                                            MediaQuery.of(context).size.width,

                                        initialAngleInDegree: 0,
                                        chartType: ChartType.disc,
                                        ringStrokeWidth: 22,
                                        centerText: "",
                                        centerTextStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: "Josefin Sans"),
                                        legendOptions: const LegendOptions(
                                          showLegendsInRow: false,
                                          legendPosition: LegendPosition.right,
                                          showLegends: true,
                                          legendTextStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValueBackground: true,
                                          showChartValues: true,
                                          showChartValuesInPercentage: false,
                                          showChartValuesOutside: false,
                                          decimalPlaces: 1,
                                        ),
                                        // gradientList: ---To add gradient colors---
                                        // emptyColorGradient: ---Empty Color gradient---
                                      )),
                                    ));
                              });
                            });
                      },
                      child: Card(
                          elevation: 8.0,
                          child: Column(
                            children: [
                              BagAmount <= 0
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 70.0,
                                          child: Image.asset(
                                            "lib/Images/sold_out.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(""),

                              ListTile(
                                title: const Text(
                                  "বাচ্চার ধরণঃ সোনালী বাচ্চা",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: "Josefin Sans"),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "বাচ্চার সংখ্যাঃ ১০ টি",
                                      style: TextStyle(
                                          color: Colors.green.shade400,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "বাচ্চার ধরণঃ সোনালী বাচ্চা",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "প্রতি বাচ্চার বিক্রয় মূল্যঃ  টাকা",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "প্রতি বাচ্চার ক্রয় মূল্যঃ টাকা",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "গত মাসে বিক্রিত বাচ্চার সংখ্যাঃ 7 টি",
                                      style: TextStyle(
                                          color: Colors.pink.shade400,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                ),
                                trailing: PopupMenuButton(
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
                                      backgroundColor: MaterialStatePropertyAll(
                                          ColorName().appColor),
                                    ),
                                    child: const Text(
                                      "বাচ্চা বিক্রয় করুন",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    onPressed: () async {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return AlertDialog(
                                                  actions: [
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                          elevation:
                                                              MaterialStatePropertyAll(
                                                                  15),
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  ColorName()
                                                                      .appColor),
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                          "Sale Now",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ))
                                                  ],
                                                  elevation: 50.0,
                                                  title: const Center(
                                                    child: Text(
                                                      "বাচ্চা বিক্রির তথ্য দিন",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                          overflow: TextOverflow
                                                              .visible,
                                                          fontFamily:
                                                              "Josefin Sans"),
                                                    ),
                                                  ),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextField(
                                                          readOnly: true,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLength: 30,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'বাচ্চার ধরণঃ সোনালী',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'বাচ্চার ধরণঃ সোনালী',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLength: 30,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'বাচ্চার সংখ্যা লিখুন',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'বাচ্চার সংখ্যা লিখুন',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              ChickenNumberController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLength: 30,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'জমার পরিমান লিখুন',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'জমার পরিমান লিখুন',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              JomaController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          maxLength: 80,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'ক্রেতার নাম',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'ক্রেতার নাম',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              CustomerNameController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          maxLength: 80,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'ক্রেতার ফোন নং',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'ক্রেতার ফোন নং',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              CustomerPhoneNumberController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .streetAddress,
                                                          maxLength: 180,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'ক্রেতার ঠিকানা',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'ক্রেতার ঠিকানা',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              CustomerAddressController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                      ],
                                                    ),
                                                  ));
                                            });
                                          });
                                    },
                                  ),
                                ],
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),

              // Third Tab
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return AlertDialog(
                                    elevation: 50.0,
                                    title: const Center(
                                      child: Text(
                                        "গত মাসের ক্রয় বিক্রয় লাভের তথ্য",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: "Josefin Sans"),
                                      ),
                                    ),
                                    content: Container(
                                      height: 200,
                                      child: Center(
                                          child: PieChart(
                                        dataMap: dataMap,
                                        animationDuration:
                                            Duration(milliseconds: 800),
                                        chartLegendSpacing: 22,

                                        chartRadius:
                                            MediaQuery.of(context).size.width,

                                        initialAngleInDegree: 0,
                                        chartType: ChartType.disc,
                                        ringStrokeWidth: 22,
                                        centerText: "",
                                        centerTextStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: "Josefin Sans"),
                                        legendOptions: const LegendOptions(
                                          showLegendsInRow: false,
                                          legendPosition: LegendPosition.right,
                                          showLegends: true,
                                          legendTextStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValueBackground: true,
                                          showChartValues: true,
                                          showChartValuesInPercentage: false,
                                          showChartValuesOutside: false,
                                          decimalPlaces: 1,
                                        ),
                                        // gradientList: ---To add gradient colors---
                                        // emptyColorGradient: ---Empty Color gradient---
                                      )),
                                    ));
                              });
                            });
                      },
                      child: Card(
                          elevation: 8.0,
                          child: Column(
                            children: [
                              BagAmount <= 0
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 70.0,
                                          child: Image.asset(
                                            "lib/Images/sold_out.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(""),

                              ListTile(
                                title: const Text(
                                  "মেডিসিনের ধরণঃ সোনালী বাচ্চা",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: "Josefin Sans"),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "মেডিসিনের সংখ্যাঃ ১০ টি",
                                      style: TextStyle(
                                          color: Colors.green.shade400,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "মেডিসিনের ধরণঃ টিকা",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "প্রতি মেডিসিনের বিক্রয় মূল্যঃ  টাকা",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "প্রতি মেডিসিনের ক্রয় মূল্যঃ টাকা",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "গত মাসে বিক্রিত মেডিসিনের সংখ্যাঃ 7 টি",
                                      style: TextStyle(
                                          color: Colors.pink.shade400,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                ),
                                trailing: PopupMenuButton(
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
                                      backgroundColor: MaterialStatePropertyAll(
                                          ColorName().appColor),
                                    ),
                                    child: const Text(
                                      "মেডিসিন বিক্রয় করুন",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: "Josefin Sans"),
                                    ),
                                    onPressed: () async {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return AlertDialog(
                                                  actions: [
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                          elevation:
                                                              MaterialStatePropertyAll(
                                                                  15),
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  ColorName()
                                                                      .appColor),
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                          "Sale Now",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ))
                                                  ],
                                                  elevation: 50.0,
                                                  title: const Center(
                                                    child: Text(
                                                      "মেডিসিন বিক্রির তথ্য দিন",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                          overflow: TextOverflow
                                                              .visible,
                                                          fontFamily:
                                                              "Josefin Sans"),
                                                    ),
                                                  ),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextField(
                                                          readOnly: true,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLength: 30,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'মেডিসিনের ধরণঃ টিকা',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'মেডিসিনের ধরণঃ টিকা',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLength: 30,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'মেডিসিনের সংখ্যা লিখুন',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'মেডিসিনের সংখ্যা লিখুন',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              MedicinNumberController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLength: 30,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'জমার পরিমান লিখুন',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'জমার পরিমান লিখুন',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              JomaController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          maxLength: 80,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'ক্রেতার নাম',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'ক্রেতার নাম',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              CustomerNameController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          maxLength: 80,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'ক্রেতার ফোন নং',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'ক্রেতার ফোন নং',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              CustomerPhoneNumberController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .streetAddress,
                                                          maxLength: 180,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'ক্রেতার ঠিকানা',
                                                            labelStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            hintText:
                                                                'ক্রেতার ঠিকানা',
                                                            hintStyle: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "Josefin Sans"),

                                                            //  enabledBorder: OutlineInputBorder(
                                                            //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                                                            //     ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          66,
                                                                          125,
                                                                          145)),
                                                            ),
                                                          ),
                                                          controller:
                                                              CustomerAddressController,
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                      ],
                                                    ),
                                                  ));
                                            });
                                          });
                                    },
                                  ),
                                ],
                              )
                            ],
                          )),
                    )
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
