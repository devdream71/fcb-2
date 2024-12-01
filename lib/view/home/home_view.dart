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
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool historyVisible = false; // State variable to toggle history/income views

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  bool showAnimation = true; 

  @override
  void initState() {
    super.initState();

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
            SingleChildScrollView(
              child: Column(
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
                        AppSpace.spaceH16,
                        //buildRefeRowView(),
                        AppSpace.spaceH10,
                        AppSpace.spaceH10,
                        buildCategory(),
                        AppSpace.spaceH18,
                        AppSpace.spaceH18,
                        historyIncomeButton(),
                      ],
                    ),
                  ),
                  AppSpace.spaceH6,
                  buildShowIncome(),
                  //historyVisible ? buildShowHistory() : buildShowIncome(),
                ],
              ),
            ),
          
             if (showAnimation)
            Center(
              child: Lottie.asset(
                'assets/animations/welcome_animation.json',  
                repeat: false,  
                onLoaded: (composition) {
                  Future.delayed(composition.duration, () {
                    // Hide animation after it completes
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
        ///=====>history comment showing only income
        // InkWell(
        //   onTap: () {
        //     setState(() {
        //       historyVisible = true;
        //     });
        //   },
        //   child: Container(
        //     width: 80,
        //     padding: const EdgeInsets.all(6),
        //     decoration: BoxDecoration(
        //       color: Colors.yellow,
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: const Text(
        //       "History",
        //       textAlign: TextAlign.center,
        //       style: TextStyle(fontSize: 16),
        //     ),
        //   ),
        // ),
        AppSpace.spaceW10,
        InkWell(
          onTap: () {
            setState(() {
              historyVisible = false;
            });
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              "Income",
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

  // Show income list //recceive money =====>
  // Widget buildShowIncome() {
  //   return ListView.builder(
  //     physics: const NeverScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     itemCount: 5,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Padding(
  //         padding: const EdgeInsets.all(5),
  //         child: Container(
  //           height: 70,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //             color: const Color(0xffF4F6FF),
  //           ),
  //           child: const Padding(
  //             padding: EdgeInsets.only(right: 8, left: 8),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       "ROI",
  //                       style: TextStyle(
  //                           fontSize: 18,
  //                           color: Colors.blue,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                     AppSpace.spaceH4,
  //                     Text("Package-3"),
  //                   ],
  //                 ),
  //                 Text("12.10.2024"),
  //                 Text("50"),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget buildShowIncome() {
  //   final IncomeApiController incomeController = Get.put(IncomeApiController());
  //   incomeController.fetchData();

  //   final Map<int, String> typeMapping = {
  //     0: "ROI",
  //     1: "Referral Commission",
  //     2: "Deposit Bonus",
  //     3: "Matching",
  //   };

  //   final Map<int, String> packageMapping = {
  //     11: "P11: 111",
  //     10: "P10: 50000",
  //     9: "P9: 30000",
  //     8: "P8: 10000",
  //     7: "P7: 5000",
  //     6: "P6: 3000",
  //     5: "P5: 1000",
  //     4: "P4: 500",
  //     3: "P3: 300",
  //     2: "P2: 100",
  //     1: "P1: 50",
  //   };

  //   return Obx(() {
  //     if (incomeController.isLoading.value) {
  //       return const Center(child: CircularProgressIndicator());
  //     }

  //     final incomes = incomeController.apiResponse.value?.incomes ?? [];

  //     if (incomes.isEmpty) {
  //       return const Center(child: Text("No income data available."));
  //     }
  //     return ListView.builder(
  //       shrinkWrap: true,
  //       padding: const EdgeInsets.all(10),
  //       itemCount: incomes.length > 10 ? 10 : incomes.length, //incomes.length,
  //       itemBuilder: (context, index) {
  //         final entry = incomes[index];
  //         return Card(
  //           elevation: 4,
  //           margin: const EdgeInsets.symmetric(vertical: 8),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(12.0),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       typeMapping[entry['type']] ?? 'Unknown Type',
  //                       style: const TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.blue,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 5),
  //                     Text(
  //                       packageMapping[entry['package_id']] ??
  //                           'Unknown Package',
  //                       style: const TextStyle(
  //                         fontSize: 14,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 5),
  //                   ],
  //                 ),
  //                 Text(
  //                   "${entry['date']}",
  //                   style: const TextStyle(
  //                     fontSize: 14,
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 5),
  //                 Text(
  //                   "${entry['amount']}\$",
  //                   style: const TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.green,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   });
  // }

  ////working income ======>
  Widget buildShowIncome() {
    final IncomeApiController incomeController = Get.put(IncomeApiController());
    incomeController.fetchData();

    final Map<int, String> typeMapping = {
      0: "ROI",
      1: "Referral Commission",
      2: "Deposit Bonus",
      3: "Matching",
    };

    final Map<int, String> packageMapping = {
      11: "P11: 111",
      10: "P10: 50000",
      9: "P9: 30000",
      8: "P8: 10000",
      7: "P7: 5000",
      6: "P6: 3000",
      5: "P5: 1000",
      4: "P4: 500",
      3: "P3: 300",
      2: "P2: 100",
      1: "P1: 50",
    };

    return
        // SizedBox(
        //   height: 200,
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: PageView(
        //           controller: _pageController,
        //           onPageChanged: (index) {
        //             setState(() {
        //               _currentIndex = index;
        //             });
        //           },
        //           children: [
        //             buildSliderItem('Invest', 'assets/images/trump.jpg', () {
        //               // Get.to(
        //               //   const AcademicLogin(),
        //               //   arguments: 'Academy',
        //               //   transition: Transition.rightToLeftWithFade,
        //               // );
        //             }),
        //             buildSliderItem('Income', 'assets/images/trump.jpg', () {
        //               // Get.to(const TeacherLoginView(),
        //               //  arguments: 'Teacher',
        //               //     transition: Transition.rightToLeftWithFade);
        //             }),
        //             buildSliderItem('Send Money', 'assets/images/trump.jpg', () {
        //               // Get.to(const Login(),
        //               //  arguments: 'Student',
        //               //     transition: Transition.rightToLeftWithFade);
        //             }),
        //             buildSliderItem('Withdraw', 'assets/images/trump.jpg', () {
        //               // Get.to(const HomeTutorPage(),
        //               //     transition: Transition.rightToLeftWithFade);
        //             }),
        //           ],
        //         ),
        //       ),

        //       // Dot Indicator for the slider
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 16),
        //         child: SmoothPageIndicator(
        //           controller: _pageController,
        //           count: 4, // Number of pages
        //           effect: const ExpandingDotsEffect(
        //             activeDotColor: Colors.blue,
        //             dotColor: Colors.grey,
        //             dotHeight: 10,
        //             dotWidth: 10,
        //             expansionFactor: 3,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // );
        SingleChildScrollView(
      child: Obx(() {
        if (incomeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final incomes = incomeController.apiResponse.value?.incomes ?? [];

        if (incomes.isEmpty) {
          return const Center(child: Text("No income data available."));
        }
        return Container(
          color: Colors.green.withOpacity(0.4),
          height: 380,
          //height: ,
          child: ListView.builder(
            shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling conflicts
            padding: const EdgeInsets.all(10),
            itemCount:
                incomes.length > 10 ? 10 : incomes.length, //incomes.length,
            itemBuilder: (context, index) {
              final entry = incomes[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            typeMapping[entry['type']] ?? 'Unknown Type',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            packageMapping[entry['package_id']] ??
                                'Unknown Package',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                      Text(
                        "${entry['date']}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${entry['amount']}\$",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  // Balance widget
  Widget buildBalance() {
    final UserController userController = Get.put(UserController());
    userController.fetchUserInfo();
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Balance",
                style: TextStyle(fontSize: 16),
              ),
              Obx(() {
                if (userController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
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
                        // Text(
                        //   '${userController.myWallet.value}',
                        //   style: const TextStyle(
                        //     fontSize: 24,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.green,
                        //   ),
                        // )
                        Text(
                          '\$ ${double.tryParse(userController.myWallet.value.toString()) ?? 0.0}',
                          style: const TextStyle(
                            fontSize: 24,
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
                style: TextStyle(fontSize: 16),
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

  //build rating
  // buildRating() {
  //   return Column(
  //     children: [
  //       const CircleAvatar(
  //         radius: 30,
  //         backgroundImage: AssetImage(AppAssets.appLogo),
  //       ),
  //       const Text(
  //         'Md. Mosiur Rahman Rangga',
  //         style: TextStyle(fontSize: 20, color: Colors.white),
  //       ),
  //       RatingBar.builder(
  //         initialRating: 2,
  //         minRating: 1,
  //         itemSize: 26,
  //         direction: Axis.horizontal,
  //         allowHalfRating: true,
  //         itemCount: 5,
  //         itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
  //         unratedColor: Colors.white,
  //         itemBuilder: (context, _) => const Icon(
  //           Icons.star,
  //           color: Colors.amber,
  //         ),
  //         onRatingUpdate: (rating) {},
  //       ),
  //     ],
  //   );
  // }

  buildRating() {
    final UserController userController = Get.put(UserController());
    userController.fetchUserInfo();
    return Column(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AppAssets.appLogo),
        ),
        // const Text(
        //   'Md. Mosiur Rahman Rangga',
        //   style: TextStyle(fontSize: 20, color: Colors.white),
        // ),
        Text(
          (userController.name.value),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        RatingBar.builder(
          initialRating: 5,
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
