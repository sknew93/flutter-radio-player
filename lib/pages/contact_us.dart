import 'package:flutter/material.dart';
import 'package:radiostring/utils/utils.dart';

import 'package:radiostring/widgets/buildSideMenu.dart';
import 'package:radiostring/widgets/myAppBar.dart';


class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                        child: RichText(
                            text: TextSpan(
                              text: '''If you have any queries you can send them by email at support@radiostring.com. 

Check our FAQ, where you may find solution for your query.
\n''',
                              style: Theme.of(context).textTheme.bodyText1
                              .merge(TextStyle(
                                fontFamily: 'Jost-Medium',
                              )),
                              children: <TextSpan>[
                                TextSpan(text: 'Frequently Asked Quesitions (FAQ)\n', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
                                TextSpan(text: '''\nQ. What is Radio String?
A. Radio String has huge list of live radio stations over 10 languages. You can listen any station from all over the world and which is available 24/7.

Q. How to Login to Radio String?
A. You can login with your social networking sites(Facebook, Google) from your browser. Click on Sign in button and connect with either Facebook or Google

Q. Is Radio String Free?
A. Yes, Radio String is absolutely free. Where you listen songs from any live station and any language across Hindi, English, Telugu, Tamil etc. But make sure to turn on your WiFi or Mobile Data to listen songs

Q. What kind of stations can I find in Radio String?
A. You can find stations in any kind of language and listen songs as per your mood like Rock, Folk, Classic, Pop music

Q. Can I access stations without login to Radio String?
A. Yes, you can also access stations without login too. But to create your Unique or Favourite list you should be a member of Radio String.

Q. Are the stations available in all kind of languages?
A. Yes, there are more stations which are available over 10 languages like English, Telugu, Tamil, Hindi etc.

Q. How to track all my favourites in one place?
A. Make sure to create an account in Radio String to track all your favourite stations in one place. All you need to do is,

- Login to Radio String with your social connections
- Choose your favourite station
- Add it to your favourite collection list

Q. How many stations can I add it to favourites?
A. There is no limit in adding stations to your favourite collection. You can add unlimited number of stations to favourites

Q. Where can I access Radio String?
A. You can Radio String from any kind of devices like Web, Tablet, Mobile. You can download Radio String app in mobile for easy use
                                \n'''),
                              ],
                            ))
                      ),
                    ))
              ],
            ),
          ),
        )
    );
  }


}
