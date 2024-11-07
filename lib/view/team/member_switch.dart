import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
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
        body: Column(
          children: [
            const SizedBox(
              height: 10,
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
      
            buildRating(),
      
            ratingwithdimond(),
      
            HeaderWithTeams(),
      
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
                          teamScore: 100,
                          members: List.generate(
                            7,
                            (index) => MemberData('MD.Anwar Alom',
                                'anowar@gmail.com', 'Ref:Md.Korim', 10),
                          ),
                        ),
                        Positioned(
                          right: 50,
                          bottom: 100,
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
                                  child: JoinForm(),
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
                      length: 550,
                      dashLength: 5,
                      dashColor: Colors.white),
                  Expanded(
                    child: Stack(
                      children: [
                        TeamList(
                          teamScore: 150,
                          members: List.generate(
                            7,
                            (index) => MemberData('MD.Anwar Alom',
                                'anowar@gmail.com', 'Ref:Md.Taher', 5),
                          ),
                        ),
                        Positioned(
                          right: 50,
                          bottom: 100,
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
                                  child: JoinForm(),
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
          onRatingUpdate: (rating) {
            print(rating);
          },
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
        radius: 30,
        backgroundImage: AssetImage(AppAssets.appLogo),
      ),
      Text(
        'Md. Anwar Alom',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      Text(
        'anowar@gmail.com',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      Text(
        'Ref: Md. Korim',
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
    ],
  );
}

class HeaderWithTeams extends StatelessWidget {
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
        Text(
          'L-1 L-2',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}

class TeamList extends StatelessWidget {
  final int teamScore;
  final List<MemberData> members;

  TeamList({required this.teamScore, required this.members});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Center(
            child: Text(
              '$teamScore',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
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

  MemberTile({required this.member});

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
                backgroundColor: Colors.white,
                child: Text(
                  '${member.score}',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MemberData {
  final String name;
  final String email;
  final String ref;
  final int score;

  MemberData(this.name, this.email, this.ref, this.score);
}

class JoinForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor:
          0.9, // Controls the height of the modal sheet (90% of screen)
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const Text("Name"),
            const CustomTextField(label: 'Name'),
            const Text("Email"),
            const CustomTextField(label: 'E-Mail'),
            const Text("Phone Number"),
            const CustomTextField(label: 'Phone Number'),
            const Text("Pssword"),
            const CustomTextField(label: 'Password', isPassword: true),
            Container(
              //color: Colors.cyan,
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //color: Colors.orange,
                      height: 90,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gender"),
                          CustomTextField(label: 'Gender'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      //color: Colors.red,
                      height: 90,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("century"),
                          CustomTextField(label: 'Century'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Text("Referral E-mail"),
            const CustomTextField(label: 'Referral E-Mail'),
            const Text("Up Mail"),
            const CustomTextField(label: 'Up Mail'),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 50),
                SizedBox(width: 10),
                Text('Picture Upload'),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF4B0082), // Purple color as in the image
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const CustomTextField(
      {Key? key, required this.label, this.isPassword = false})
      : super(key: key);

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
