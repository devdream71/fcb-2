import 'dart:async';

import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/utils/app_space.dart';
import 'package:fcb_global/view/about/controller/about_controller.dart';
import 'package:fcb_global/view/income/income_controller/income_controller.dart';
import 'package:fcb_global/view/invest/invest_view.dart';
import 'package:fcb_global/view/package/pacakage_view.dart';
import 'package:fcb_global/view/settings/settings.dart';
import 'package:fcb_global/view/team/team_view/team_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  // bool historyVisible = false;
  // final PageController _pageController = PageController();
  // int _currentIndex = 0;
  // Timer? _timer;

  // bool showAnimation = true;

  // @override
  // void initState() {
  //   super.initState();

  //   // Auto-scroll timer
  //   _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
  //     if (_currentIndex < 3) {
  //       _currentIndex++;
  //     } else {
  //       _currentIndex = 0;
  //     }

  //     _pageController.animateToPage(
  //       _currentIndex,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   });
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   _timer?.cancel();
  //   super.dispose();
  // }

  bool historyVisible = false;
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  bool showAnimation = true;

  late UserController userController;
  late IncomeApiController incomeController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers once
    userController = Get.put(UserController());
    incomeController = Get.put(IncomeApiController());

    // Fetch necessary data
    userController.fetchUserInfo();
    incomeController.fetchData();

    // Auto-scroll timer
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentIndex < 3) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, bottom: 5, top: 2),
                  color: AppColors.appcolor,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Get.to(const Setting(),
                                transition: Transition.rightToLeftWithFade);
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      buildRating(),
                      AppSpace.spaceH6,
                      buildBalance(),
                      AppSpace.spaceH10,
                      buildCategory(),
                      AppSpace.spaceH18,
                      //historyIncomeButton(),
                    ],
                  ),
                ),

                buildShowIncome(),
                //historyVisible ? buildShowHistory() : buildShowIncome(),
              ],
            ),
            if (showAnimation)
              Center(
                child: Lottie.asset(
                  'assets/animations/welcome_animation_two.json',
                  repeat: false,
                  onLoaded: (composition) {
                    Future.delayed(composition.duration, () {
                      setState(() {
                        showAnimation = false;
                      });
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Toggle button to switch between history and income views
  Row historyIncomeButton() {
    return Row(
      children: [
        //AppSpace.spaceW10,
        InkWell(
          onTap: () {
            setState(() {
              historyVisible = false;
            });
          },
          child: Container(
            width: 10,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              //color: Colors.yellow,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  // Show history list
  Widget buildShowHistory() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffF4F6FF),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Withdraw",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("Binebce"),
                        ],
                      ),
                      const Column(
                        children: [
                          Text("12.10.2024"),
                          Text("12.10.2024"),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("50"),
                          Container(
                            width: 80,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.yellow,
                            ),
                            child: const Text(
                              "Pending",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Link: S<flwredngvpe0h9u4jy940049"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildShowIncome() {
    //final IncomeApiController incomeController = Get.put(IncomeApiController());

    final IncomeApiController incomeController = Get.put(IncomeApiController());

    incomeController.fetchData();

    final Map<int, String> typeMapping = {
      0: "ROI",
      1: "Ref Com.",
      2: "Deposit Bonus",
      3: "Matching",
    };

    final Map<int, Color> typeColors = {
      0: Colors.blue.shade100, // ROI
      1: Colors.orange.shade100, // Referral Commission
      2: Colors.purple.shade100, // Deposit Bonus
      3: Colors.green.shade100, // Matching
    };

    final Map<int, String> packageMapping = {
      11: "P11",
      10: "P10",
      9: "P9",
      8: "P8",
      7: "P7",
      6: "P6",
      5: "P5",
      4: "P4",
      3: "P3",
      2: "P2",
      1: "P1",
    };

    return Obx(() {
      if (incomeController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final incomes = incomeController.apiResponse.value?.incomes ?? [];
      if (incomes.isEmpty) {
        return const Center(child: Text("No income data available."));
      }
      // Load only the first 20 entries
      final displayedIncomes = incomes.take(150).toList();

      return SizedBox(
        child: Container(
          height: MediaQuery.of(context).size.height - 390,

          //color: Colors.amber,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FittedBox(
              child: DataTable(
                dataRowMinHeight: 18.0,
                dataRowMaxHeight: 20.0,
                headingRowHeight: 20,
                columnSpacing: 56,
                decoration: const BoxDecoration(color: Colors.yellow),
                columns: const [
                  DataColumn(
                    label: Text("Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text("Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text("Package",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  DataColumn(
                    label: Text("Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
                rows: displayedIncomes.map((entry) {
                  final entryType = entry['type'];
                  final rowColor =
                      typeColors[entryType] ?? Colors.grey.shade200;
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          formatDate(entry['date']),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      DataCell(
                        Text(
                          typeMapping[entryType] ?? 'Unknown Type',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      DataCell(
                        Text(
                          packageMapping[entry['package_id']] ?? 'Unknown',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      DataCell(
                        Text(
                          "${entry['amount'] ?? '0'}\$",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                    color:
                        WidgetStateProperty.resolveWith((states) => rowColor),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );
    });
  }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) return 'Unknown';
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('yyyy/MM/dd').format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  // Balance widget
  Widget buildBalance() {
    final UserController userController = Get.put(UserController());
    userController.fetchUserInfo();
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 3),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Balance",
                style: TextStyle(fontSize: 14),
              ),
              Obx(() {
                if (userController.isLoading.value) {
                  return Center(
                      child: Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(),
                  ));
                } else if (userController.errorMessage.isNotEmpty) {
                  return Text(
                    userController.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$ ${double.tryParse(userController.myWallet.value.toString()) ?? 0.0}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.32),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Withdraw",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(2),
            ),
          ),
          const SizedBox(
            width: 2,
          )
        ],
      ),
    );
  }

  // Other helper methods (buildRating, buildCategory, buildRefeRowView) remain the same

  //buildRefeRowView
  buildRefeRowView() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: Get.width / 3,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffB4CFF4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "50\$",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Text(
                  "Today ROI",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
          AppSpace.spaceW10,
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: Get.width / 3,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffB4CFF4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "120\$",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Text(
                  "Reference",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
          AppSpace.spaceW10,
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: Get.width / 3,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffB4CFF4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "100\$",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Text(
                  "Marching",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildRating() {
    final UserController userController = Get.put(UserController());
    userController.fetchUserInfo();
    return Column(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AppAssets.appLogo),
        ),
        Text(
          (userController.name.value),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        RatingBar.builder(
          initialRating: 1.5,
          minRating: 1,
          itemSize: 26,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          unratedColor: Colors.white,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }

  //build category
  Padding buildCategory() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => Get.to(() => const PackageView(),
                  transition: Transition.rightToLeftWithFade),
              child: const Column(
                children: [
                  Icon(
                    Icons.storefront,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Package",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          AppSpace.spaceW10,
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => Get.to(() => const InvestView(),
                  transition: Transition.rightToLeftWithFade),
              child: const Column(
                children: [
                  Icon(
                    Icons.paid,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Invest",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          AppSpace.spaceW10,
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                Get.to(() => TreeView(),
                    transition: Transition.rightToLeftWithFade);
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.diversity_3,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Team",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Slider item with a clickable icon and label
  Widget buildSliderItem(String label, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Handle tap
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 100), // Adjust the size of the image
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
