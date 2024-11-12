import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class MemberSwitch extends StatelessWidget {
  const MemberSwitch({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Team ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              buildRating(),

              ratingwithdimond(),

              const HeaderWithTeams(),

              const SizedBox(height: 20),

              // Team member section
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          TeamList(
                            teamScore: 5,
                            members: List.generate(
                              1,
                              (index) => MemberData('MD. Tamim',
                                  'tamin@gmail.com', 'Ref:Md.Korim', 0),
                            ),
                          ),
                          Positioned(
                            right: 50,
                            bottom: 300,
                            child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: const JoinForm(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Add+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Dash(
                        direction: Axis.vertical,
                        length: 150,
                        dashLength: 5,
                        dashColor: Colors.white),
                    Expanded(
                      child: Stack(
                        children: [
                          TeamList(
                            teamScore: 3,
                            members: List.generate(
                              1,
                              (index) => MemberData('MD.Shakib',
                                  'shakib@gmail.com', 'Ref:Md.Taher', 2),
                            ),
                          ),
                          Positioned(
                            right: 50,
                            bottom: 300,
                            child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: const JoinForm(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Add+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
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

  Widget ratingwithdimond() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: 2,
          minRating: 1,
          itemSize: 20,
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
        const Icon(
          Icons.diamond,
          color: Colors.white,
        )
      ],
    );
  }
}

buildRating() {
  return const Column(
    children: [
      CircleAvatar(
        radius: 37,
        child: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(AppAssets.trump),
        ),
      ),
      Text(
        'Trump',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      Text(
        'trump@gmail.com',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      Text(
        'Ref: Md. Korim',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
    ],
  );
}

///build rating Team
buildRatingTeam() {
  return const Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(AppAssets.appLogo),
      ),
      Text(
        'Biden',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      Text(
        'biden@gmail.com',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      Text(
        'Ref: Md. Korim',
        style: TextStyle(fontSize: 13, color: Colors.white),
      )
    ],
  );
}

class HeaderWithTeams extends StatelessWidget {
  const HeaderWithTeams({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, color: Colors.white, size: 40),
          ],
        ),
        SizedBox(height: 5),
        Text(
          'Team',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        SizedBox(height: 5),
        // Text(
        //   'L-1 L-2',
        //   style: TextStyle(color: Colors.white, fontSize: 14),
        // ),
      ],
    );
  }
}

class TeamList extends StatelessWidget {
  final int teamScore;
  final List<MemberData> members;

  const TeamList({super.key, required this.teamScore, required this.members});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Center(
            child: Text(
              '$teamScore',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              final member = members[index];
              return MemberTile(member: member);
            },
          ),
        ),
      ],
    );
  }
}

class MemberTile extends StatelessWidget {
  final MemberData member;

  const MemberTile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member.name,
                      style: const TextStyle(color: Colors.white)),
                  Text(member.email,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12)),
                  Text(member.ref,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Text(
                  '${member.score}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///MemberData
class MemberData {
  final String name;
  final String email;
  final String ref;
  final int score;

  MemberData(this.name, this.email, this.ref, this.score);
}

///joinForm====>
class JoinForm extends StatefulWidget {
  const JoinForm({super.key});

  @override
  State<JoinForm> createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
  String? selectedValue = 'No';

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor:
          0.9, // Controls the height of the modal sheet (90% of screen)
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Joining',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Add spacing for better layout

              const LabelWithAsterisk(
                labelText: 'Name',
                isRequired: true,
              ),
              const CustomTextField(label: 'Name'),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Email',
                isRequired: true,
              ),
              const CustomTextField(label: 'E-Mail'),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Phone Number',
                isRequired: true,
              ),
              const CustomTextField(label: 'Phone Number'),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Password',
                isRequired: true,
              ),
              const CustomTextField(label: 'Password', isPassword: true),
              const SizedBox(height: 8),
              const SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelWithAsterisk(
                              labelText: 'Gender',
                              isRequired: true,
                            ),
                            CustomTextField(label: 'Gender'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelWithAsterisk(
                              labelText: 'Country',
                              isRequired: true,
                            ),
                            CustomTextField(label: 'Country'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Referral E-mail',
                isRequired: true,
              ),
              const CustomTextField(label: 'Ref@gmail.com'),
              const SizedBox(height: 8),

              const LabelWithAsterisk(
                labelText: 'Up Mail',
                isRequired: true,
              ),
              const CustomTextField(label: 'upline@gmail.com'),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, size: 50),
                  SizedBox(width: 10),
                  Text('Picture Upload'),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B0082), // Purple color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///botom sheet for gallery and camera
  // void _showImageSourceActionSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SafeArea(
  //         child: Wrap(
  //           children: [
  //             ListTile(
  //               leading: const Icon(Icons.photo_library),
  //               title: const Text('Gallery'),
  //               onTap: () {
  //                 Navigator.of(context).pop();
  //                 //_pickImage(ImageSource.gallery);
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.photo_camera),
  //               title: const Text('Camera'),
  //               onTap: () {
  //                 Navigator.of(context).pop();
  //                 //_pickImage(ImageSource.camera);
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}

///custom text field.
class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const CustomTextField(
      {super.key, required this.label, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
