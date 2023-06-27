import 'package:flutter/material.dart';
import 'package:travel_app/theme.dart';
import 'package:travel_app/widget/item_card.dart';
import 'package:travel_app/widget/navigation.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      Widget exploreThese() {
        return Container(
          margin: EdgeInsets.only(bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivered at your door!',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "View All",
                    style: orangeTextStyle,
                  )
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(children: [
                        ItemCard(
                          imageUrl:
                              "https://www.jiomart.com/images/product/600x600/491251329/shubhkart-copper-kalash-64-g-2-20211007.jpg",
                          title: "Brass Kalash",
                          seller: "Raj Sons and Sons",
                          onClick: () {
                            Navigator.pushNamed(context, "/detail-page");
                          },
                        ),
                        ItemCard(
                          imageUrl:
                              "https://5.imimg.com/data5/SELLER/Default/2021/2/GN/KK/PT/32346440/new-product-500x500.jpeg",
                          title: "Dargah Chadar",
                          seller: "Haji Store",
                          onClick: () {},
                        ),
                      ]),
                      Row(
                        children: [
                          ItemCard(
                            imageUrl:
                                "https://www.dainikjharkhand.com/wp-content/uploads/2020/09/gangajal-pani.jpg",
                            title: "Fresh Gangajal",
                            seller: "Kumari Laxmi",
                            onClick: () {},
                          ),
                          ItemCard(
                            imageUrl:
                                "https://pbs.twimg.com/media/B_31OJ9WIAAYBdc.jpg",
                            title: "Sai Baba Prasad",
                            seller: "Mangal Bhavan",
                            onClick: () {},
                          ),
                        ],
                      ),
                      Row(children: [
                        ItemCard(
                          imageUrl:
                              "https://m.media-amazon.com/images/I/81a8AOgFHoL._SL1500_.jpg",
                          title: "Sandal Rosary",
                          seller: "Luigi House",
                          onClick: () {
                            Navigator.pushNamed(context, "/detail-page");
                          },
                        ),
                        ItemCard(
                          imageUrl:
                              "https://www.sikhvirasat.ca/image/cache/catalog/801_Gatka/8010082-7-1000x700.jpg",
                          title: "Nishan Sahib",
                          seller: "Gurmeet Traders",
                          onClick: () {},
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 23,
            right: 23,
            top: 27,
            bottom: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              exploreThese(),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            content(),
            CustomNavigation(
              home: kdisableOrange,
              market: kOrangeColor,
              bookmarks: kdisableOrange,
              user: kdisableOrange,
            ),
          ],
        ),
      ),
    );
  }
}
