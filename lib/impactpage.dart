import 'package:flutter/material.dart';
import 'package:gsc2023_food_app/constants.dart';
import 'package:gsc2023_food_app/sizeconfig.dart';
import 'backend.dart';

class ImpactPage extends StatefulWidget {
  const ImpactPage({super.key});

  @override
  State<ImpactPage> createState() => _ImpactPageState();
}

class _ImpactPageState extends State<ImpactPage> {
  int userCount = 0;
  int itemsCollected = 0;
  int peopleImpacted = 0;

  Future<void> fetchUserCount() async {
    int count = await Backend.amountOfUsers();
    setState(() {
      userCount = count;
    });
  }

  Future<void> globalItemsCollected() async {
    int collected = await Backend.amountOfPosts();
    setState(() {
      itemsCollected = collected;
    });
  }

  Future<void> globalPeopleImpacted() async {
    int impacted = await Backend.amountOfTransactions();
    setState(() {
      peopleImpacted = impacted;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserCount();
    globalItemsCollected();
    globalPeopleImpacted();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FoodMe",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(36),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 7),
                    SizedBox(
                      height: getProportionateScreenWidth(40),
                      width: getProportionateScreenWidth(40),
                      child: Image.asset('assets/images/foodme.png'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Text(
                          "We are on a mission to simultaneously eliminate food waste and food insecurity.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            color: kPrimaryColor,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Our Impact",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(25),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Container(
                  child: SafeArea(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth,
                          height: 145,
                          color: kPrimaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth / 3,
                                    child: Column(
                                      children: [
                                        Text(
                                          userCount.toString(),
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(40),
                                            color: kPrimaryLightColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Users",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(10),
                                            color: kPrimaryLightColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth / 3,
                                    child: Column(
                                      children: [
                                        Text(
                                          itemsCollected.toString(),
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(40),
                                            color: kPrimaryLightColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Total Posts",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(10),
                                            color: kPrimaryLightColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth / 3,
                                    child: Column(
                                      children: [
                                        Text(
                                          peopleImpacted.toString(),
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(40),
                                            color: kPrimaryLightColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "People Impacted",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(10),
                                            color: kPrimaryLightColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: getProportionateScreenWidth(150),
                  width: getProportionateScreenWidth(150),
                  child: Image.asset('assets/images/udcollab.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Our Mission",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(25),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Text(
                          "Large-scale food waste is a byproduct of the lack of sufficient infrastructure capable of connecting leftover food resources from places including supermarkets, food banks, and company events to people who are struggling with food insecurity. Our app, FoodMe, facilitates the connection of surplus resources to those who need them within local communities. By doing so, we aim to alleviate food insecurity and bridge the gap that exists between different socioeconomic groups.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(12),
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: getProportionateScreenWidth(150),
                  width: getProportionateScreenWidth(150),
                  child: Image.asset('assets/images/udlight.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Our Inspiration",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(25),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Text(
                          "Our initial inspiration for this app came from a GroupMe at Georgetown University, where we are students, where students and faculty announce if they have food left over from club meetings or other such events. We loved this idea of community food waste reduction and wanted to expand the concept to our greater community of Washington DC and beyond.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(12),
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
