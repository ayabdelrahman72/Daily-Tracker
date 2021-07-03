import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/catogery_provider.dart';
import 'package:daily_tracker_diet_app/Admin/Provider/meal_provider.dart';
import 'package:daily_tracker_diet_app/User/screens/meal_to_add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'meal_to_add_to_cart.dart';

class MealByCategories extends StatefulWidget {
  // final MealProvider mealProvider;
  // MealByCategories({this.mealProvider});
  final String mealType;
  MealByCategories({this.mealType});
  @override
  _MealByCategoriesState createState() => _MealByCategoriesState();
}

class _MealByCategoriesState extends State<MealByCategories> {
  @override
  void initState() {
    // TODO: implement initState
    // Do something
    MealProvider mealProvider =
        Provider.of<MealProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MealProvider mealProvider = Provider.of<MealProvider>(context);
    Future<void> _refreshList() async {}

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text(
          "Create your own Meal",
          style: TextStyle(
              color: Color(0xFF09C04F),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoL'),
        ),
      ),
      drawer: Container(
        width: 250,
        height: 800,
        child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_box,
                  size: 30,
                  color: Color(0xFF09C04F),
                ),
                title: Text(
                  "View Users",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add,
                  size: 30,
                  color: Color(0xFF09C04F),
                ),
                title: GestureDetector(
                  onTap: () {
                    mealProvider.mealsByCategory = null;
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (BuildContext context) {
                    //     return UpdateMeal(
                    //       isUpdating: false,
                    //     );
                    //   }),
                    // );
                  },
                  child: Text(
                    "Add Meal",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF09C04F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/am1.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView.builder(
            itemCount: mealProvider.mealsByCategory.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                height: 220,
                width: 200,
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Color(0xFF61D27C),
                  boxShadow: kElevationToShadow[6],
                ),

                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: 4, left: 60, right: 20, bottom: 4),
                          width: 200,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 22, right: 15, top: 5),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(80),
                                    ),
                                child: (mealProvider
                                            .mealsByCategory[index].imageUrl ==
                                        null)
                                    ? Image.asset('assets/images/person.png')
                                    : Image.network(
                                        mealProvider
                                            .mealsByCategory[index].imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  (mealProvider.mealsByCategory[index]
                                              .mealName ==
                                          null)
                                      ? 'mealName'
                                      : mealProvider
                                          .mealsByCategory[index].mealName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      //fontWeight: FontWeight.bold,
                                      fontFamily: 'Shadows'),
                                ),
                              ),
                              //////////////////////////
                              Container(
                                margin: EdgeInsets.only(left: 50),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                            width: 100,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xFF09C04F),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey[400],
                                                    blurRadius: 5,
                                                  )
                                                ]),
                                            child: TextButton(
                                              child: Text('Ingredients'),
                                              style: TextButton.styleFrom(
                                                primary: Colors.white,
                                              ),
                                              onPressed: () {
                                                mealProvider
                                                        .currentMealToAddToUser =
                                                    mealProvider
                                                        .mealsByCategory[index];
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: MealCart(
                                                            mealType: widget
                                                                .mealType),
                                                        actions: <Widget>[
                                                          /* FlatButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context,
                                                                    false),
                                                            child: Text("Okay"),
                                                            textColor:
                                                                Colors.green,
                                                          ),*/
                                                        ],
                                                      );
                                                    });
                                              },
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: SizedBox(
                        width: 400,
                        child: Divider(
                          color: Colors.grey[300],
                          thickness: 3.0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        onRefresh: _refreshList,
        showChildOpacityTransition: true,
        color: Color(0xFF09C04F),
      ),
    );
  }
}
// Scaffold(
// body: SafeArea(
// child: LiquidPullToRefresh(
// child: new Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage('assets/images/am1.png'),
// fit: BoxFit.fill,
// ),
// ),
// child: Column(
// children: mealProvider.mealsByCategory
//     .map((e) => GestureDetector(
// onTap: () {},
// child: Text(e.mealName),
// ))
// .toList(),
// ),
// ),
// onRefresh: _refreshList,
// showChildOpacityTransition: true,
// color: Color(0xFF09C04F),
// ),
// ),
// );
