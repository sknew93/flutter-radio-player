import 'package:flutter/material.dart';
import 'package:radiostring/utils/utils.dart';
import 'package:radiostring/widgets/buildSideMenu.dart';
import 'package:radiostring/widgets/myAppBar.dart';


class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> _willPopCallback() async {
    currentPage = 'Radio String';
    return Future.value(true);
      // await showDialog or Show add banners or whatever
      // then
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        drawer: Container(
          width: screenSize.width * 0.75,
          child: Drawer(
            child: BuildSideMenu(),
          ),
        ),
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          child: Column(
            children: [
              MyAppBar(),
              Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1
                                .merge(TextStyle(
                              fontFamily: 'Jost-Medium',
                              fontSize: 15
                            )),
                            children: <TextSpan>[
                              TextSpan(text: '''Radiostring.com is the best web radio streaming service providing a huge amount of stations across worldwide. It was launched in 2017 and it can be accessed from Desktop, Tablets, Mobile. The application will be available on all devices like Android,iPhone, Windows mobiles.

We provide high-quality audio stations over 10 languages such as '''),
                              TextSpan(text: 'English, Hindi, Telugu, Tamil, Kannada, Bengali and many more languages. ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink)),
                              TextSpan(text: '''Radiostring.com is absolutely free, where you can listen to live stations without paying for us. We are providing stations in several categories like Pop, Rock, Folk Music etc. You can listen to any category as per your mood.

You can make your own favorite list in Radiosting.com. All you need to do is create an account with us. To create an account, you can connect with your Facebook account or Google account. After creating an account with us, you can add stations to favorites and there is no limit of adding stations too.
                                \n'''),

                            ]
                        )
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )
    );
  }


}
