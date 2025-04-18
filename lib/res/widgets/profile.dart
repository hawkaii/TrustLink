import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.brown),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: width * 0.1,
                    backgroundImage: const AssetImage("assets/image/logo.png")),
                SizedBox(
                  width: width * 0.25,
                ),
                FollowCount(
                  height: height,
                  width: width,
                  count: 100,
                ),
                FollowCount(
                  height: height,
                  width: width,
                  count: 100,
                ),
                Container(
                  height: height * 0.03,
                  width: height * 0.03,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: const Icon(Icons.arrow_drop_down_circle_outlined),
                )
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cristopher Nolen",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "@cristopher",
                      style: TextStyle(
                          color: Color(0xFFB50000),
                          fontSize: 12,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.badge,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Enterprenure",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 12,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_off_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Noida, sector 18",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 12,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.3,
                ),
                Column(
                  children: [
                    Container(
                      height: height * 0.04,
                      width: width * 0.23,
                      decoration: BoxDecoration(
                          color: const Color(0xFF39D2C0),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Follow",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Inter",
                                color: Color(0xFFFFFFFF)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height * 0.04,
                      width: width * 0.23,
                      decoration: BoxDecoration(
                          color: const Color(0xFF39D2C0),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 23,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Message",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                color: Color(0xFFFFFFFF)),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FollowCount extends StatelessWidget {
  const FollowCount({
    super.key,
    required this.height,
    required this.width,
    required this.count,
  });

  final double height;
  final double width;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.02),
      child: Container(
        height: height * 0.06,
        width: width * 0.173,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17), color: Colors.white),
        child: Center(
          child: Text('$count\n  K'),
        ),
      ),
    );
  }
}
