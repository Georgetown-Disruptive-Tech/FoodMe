import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsc2023_food_app/constants.dart';
import 'package:gsc2023_food_app/item_info.dart';

class ListItemBusiness extends StatelessWidget {
  //doc received from firebase
  final DocumentSnapshot<Map<String, dynamic>> doc;
  final String distanceAway;

  const ListItemBusiness(this.doc, this.distanceAway, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: accentGreen,
            width: 4,
          ),
        ),
        margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        padding: const EdgeInsets.all(15),
        child: GestureDetector(
            onTap: () {
              displayItemInfo(context, doc, distanceAway, "Moments");
            },
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Business Listing",
                      style: TextStyle(color: accentGreen, fontSize: 16),
                    ),
                    SizedBox(width: 20),
                    Text(doc['title'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(doc['description']),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: kSecondaryColor, size: 16),
                                SizedBox(width: 5),
                                Text(distanceAway),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.email_outlined,
                                  color: kSecondaryColor, size: 16),
                              SizedBox(width: 5),
                              Text(doc['businessEmail'] != ''
                                  ? doc['businessEmail']
                                  : "No email provided."),
                            ],
                          ),
                          //place the media image below here
                        ],
                      ),
                    )
                  ],
                )),
                doc['imageUrl'] != ''
                    ? Image.network(
                        doc['imageUrl'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/placeholder.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
              ],
            )));
  }
}
