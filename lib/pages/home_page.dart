import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui1/core/consts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterui1/core/flutter_icons.dart';
import 'package:flutterui1/models/food_models.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<FoodModel> foodList = FoodModel.list ;
  PageController pageController = new PageController(viewportFraction: .8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 60),
              child: Column(
                children: <Widget>[
                  _customAppBar(),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height*.41,
                          child: PageView.builder(
                            controller: pageController,
                            physics: BouncingScrollPhysics(),
                            itemCount: foodList.length,
                            itemBuilder: (context , index){
                              return Padding(
                                padding: const EdgeInsets.only(right: 20,top: 40),
                                child: Stack(
                                  children: [
                                    _buildBackGround(index),
                                    Align(
                                      alignment: Alignment(1.3,-1.3),
                                      child: Transform.rotate(
                                        angle: math.pi / 3,
                                        child: Image(
                                          width: 150,
                                          image: AssetImage(foodList[index].imgPath),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 10,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                        decoration: BoxDecoration(
                                          color: AppColors.redColor,
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Text("\$ ${foodList[index].price}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("Popular",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 32),),
                        ),
                       _buildPopulerList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: 60,
              padding: EdgeInsets.only(top: 25),
              color: AppColors.greenLightColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("asset/images/profile.jpg")
                      )
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                    ),
                    child: Center(child: Icon(FlutterIcons.menu),),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              left: -20,
              child: Transform.rotate(
                angle: -math.pi/2,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        _buildMenu("Vegetable"),
                        _buildMenu("Chicken"),
                        _buildMenu("Beef"),
                        _buildMenu("Thai"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(String menu){
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text(menu,style: TextStyle(color: Colors.black , fontSize: 18),))
        ),
        onTap: (){},
      )
    );
  }
  Widget _buildBackGround(int index) {
    return Container(
                              margin: EdgeInsets.only(left: 1,bottom: 10,right: 10),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.greenLightColor,
                                borderRadius: BorderRadius.circular(32)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        itemCount: 5,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemSize: 16,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                        itemBuilder:(context,index)
                                        => Icon(Icons.star,color: Colors.amber,),
                                        onRatingUpdate: (rating)
                                        => print(rating.toString()),
                                      ),
                                      SizedBox(width: 10,),
                                      Text("(120 Reviews)",style: TextStyle(fontSize: 12),),
                                    ],
                                  ),
                                  Text(foodList[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  SizedBox(height: 5,)
                                ],
                              ),
                            );
  }
  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "Hello,\n",
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: "Shailee weedly",
                  style: TextStyle(color: AppColors.greenColor,fontWeight: FontWeight.bold,height: 1.5),
                ),
              ]
            ),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.greenLightColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: <Widget>[
                  Expanded(child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search"
                    ),
                  ),),
                  Icon(FlutterIcons.search,size: 14,color: Colors.grey.shade700,)
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Icon(FlutterIcons.shop,size: 16,),
          ),
        ],
      ),
    );
  }
  Widget _buildPopulerList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(left: 5,bottom: 16,top: 20),
      itemCount: foodList.length,
      itemBuilder: (context , index)
      => Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12)
            )
        ),
        child: Row(
          children: <Widget>[
            Image(image: AssetImage(foodList[index].imgPath),width: 100,),
            SizedBox(width: 4,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${foodList[index].name}",style: TextStyle(fontSize: 20),),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Text("\$ ${foodList[index].price.toInt()}",style: TextStyle(fontSize: 12 , color: Colors.red,fontWeight: FontWeight.bold),),
                    SizedBox(width: 16,),
                    Text("${foodList[index].weight.toInt()}gm Weight",style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
