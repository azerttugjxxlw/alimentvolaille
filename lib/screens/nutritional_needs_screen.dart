// lib/screens/nutritional_needs_screen.dart
import 'package:flutter/material.dart';

import '../utile/constants.dart';
import '../utile/reusable_card.dart';
enum Gender {listingredient,besoin,gener_aliment,prophylaxie}

class NutritionalNeedsScreen extends StatefulWidget {
  @override
  _NutritionalNeedsScreenState createState() => _NutritionalNeedsScreenState();
}
class _NutritionalNeedsScreenState extends State<NutritionalNeedsScreen> {
  final PageController _controller = PageController(initialPage: 0);
  final List<String> imageAssets=[
    'assets/images/_ (4).jpeg',
    'assets/images/_ (6).jpeg',
    'assets/images/_ (7).jpeg'
  ];
  late Gender? selectedGender=Gender.besoin;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kAppcolor,

        appBar: AppBar(
          backgroundColor: kAppcolor,

          elevation: 0,
          title: Text('Besoins Nutritionnels',style: kEdit,),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
            child:Column(
              children: [
                Expanded(
                  flex: 5,
                    child: Container(
                      width:MediaQuery.of(context).size.width*0.9
                      ,
                      height:MediaQuery.of(context).size.height*0.08,
                      child: PageView.builder(
                        controller: _controller,
                          itemCount: imageAssets.length + 1,
                          itemBuilder:(context,index){
                            final int imageIndex =index %imageAssets.length;
                            return Image.asset(
                              width:MediaQuery.of(context).size.width*0.6,
                                height:MediaQuery.of(context).size.height*0.04,
                                imageAssets[imageIndex],
                                fit:BoxFit.cover);
                          }
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:  Border.all(color: Colors.black,width: 2)
                      ),
                    ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                        child: ReusableCard(
                      colour:selectedGender == Gender.gener_aliment ? kBottoncolor :kActiveColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(AssetImage('assets/icons/besoin.png'),size:50,color:selectedGender == Gender.gener_aliment ? kAppcolor :kblack,
                          ),
                          Text("Formule alimentaire",style:selectedGender == Gender.gener_aliment ? kLabelTextStyle :kEdit,)
                          ,],
                      ),
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.gener_aliment;
                            });
                          },
                    )),
                    Expanded(
                        flex: 5,
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.listingredient;
                            });
                        },
                      colour:selectedGender == Gender.listingredient ? kBottoncolor :kActiveColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          ImageIcon(AssetImage('assets/icons/genere.png'),size:60,color:selectedGender == Gender.listingredient ? kAppcolor :kblack,
                          ),
                          Text("Ingrédients",style:selectedGender == Gender.listingredient ? kLabelTextStyle :kEdit,)
                          ,],
                      ),

                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: ReusableCard(
                          colour:selectedGender == Gender.besoin ? kBottoncolor :kActiveColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          ImageIcon(AssetImage('assets/icons/food.png'),size:60,color:selectedGender == Gender.besoin ? kAppcolor :kblack,
                          ),
                          Text("Besoin Nutritionnels",style:selectedGender == Gender.besoin ? kLabelTextStyle :kEdit,)
                          ,],
                      ),
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.besoin;
                            });
                          },
                    )),
                    Expanded(
                        flex: 5,
                        child: ReusableCard(
                          colour:selectedGender == Gender.prophylaxie ? kBottoncolor :kActiveColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(AssetImage('assets/icons/treatment.png'),size:60,color:selectedGender == Gender.prophylaxie ? kAppcolor :kblack,
                          ),
                          Text("Prophylaxie",style:selectedGender == Gender.prophylaxie ? kLabelTextStyle :kEdit,)
                          ,],
                      ),  onPress: () {
                          setState(() {
                            selectedGender = Gender.prophylaxie;
                          });
                        },
                    ))
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
  void initState(){
    super.initState();
    _controller.addListener(() {
      if(_controller.page==imageAssets.length){
        _controller.jumpToPage(0);
      }else if(_controller.page==0){
        _controller.jumpToPage(imageAssets.length);
      }
    });
    Future.delayed(Duration(seconds:3),(){
      _controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease,);});
  }
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
}
