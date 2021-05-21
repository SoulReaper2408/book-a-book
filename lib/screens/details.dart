import 'dart:ui';

import 'package:catalog_app/services/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier = Provider.of<ProductNotifier>(
        context, listen: false);
    return Scaffold(


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 5.0, horizontal: 5.0),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.network(productNotifier.currentData.imgUrl, fit: BoxFit.fill,),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                          child: Container(color: Colors.orangeAccent.withOpacity(0.1)),


                        ),
                      ),
                      Positioned.fill(

                        child: Padding(

                          padding: const EdgeInsets.all(60),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),

                                child: Card(




                                  child :Hero(tag:productNotifier.currentData.imgUrl,child: Image.network(productNotifier.currentData.imgUrl, fit: BoxFit.cover)),



                                ),
                              ),
                            ),
                        ),

                      ])




                  ),



           Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(''),// Book name
                Text(''), // Author
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Container(
            color: Colors.amber,
              padding: EdgeInsets.all(30.0),
              child: Text('Number of Pages'),
            ),
            Container(
            color: Colors.amber,
            padding: EdgeInsets.all(30.0),
            child: Text('Subject'),
          ),

  ]
                ),
                Text('Description'),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical:15,horizontal:45),
                  onPressed: () {},
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))) ,
                  child: Text('Contact Details')
                ),
          ],

    ),
        ],

    )
        ),
      ),


    );

  }
}