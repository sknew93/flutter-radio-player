import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flushbar/flushbar.dart';
import 'package:radiostring/blocs/config.dart';
import 'package:radiostring/blocs/station_bloc.dart';
import 'package:radiostring/models/country.dart';
import 'package:radiostring/utils/utils.dart';
import 'package:radiostring/widgets/buildSideMenu.dart';
import 'all_channels.dart';
import 'favourite_channels.dart';

class Home extends StatefulWidget {
  Home();

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController searchController = new TextEditingController();
  var screenSize;
  String channelType = 'all';
  // bool isSearching = false;

  List<Country> _countries= [] ;

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  checkInternet() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // await stationsBloc.getFavourites();
      stationsBloc.getCountries();
      // stationsBloc.getStations();
    } else {
      showNoInternet(context, 'No internet connection!');
    }
  }

  void showNoInternet(BuildContext context, String errorContent) {
    Flushbar(
      messageText: Text(errorContent,
        style: TextStyle(
          fontFamily: 'Jost-Regular',
          color: Colors.white
        )
      ),
      isDismissible: false,
      mainButton: FlatButton(
        child: Text(
          'TRY AGAIN',
          style: TextStyle(color: Theme.of(context).accentColor,
          fontFamily: 'Jost-Medium'),
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
          checkInternet();
        },
      ),
      duration: Duration(minutes: 1),
    )..show(context);
  }

  @override
  void dispose() {
    stationsBloc.dispose();
    super.dispose();
  }

  void _openEndDrawer() {
    scaffoldKey.currentState.openEndDrawer();
  }

  Widget myappBar(){
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      title: Text('Radio String', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      backgroundColor: Theme.of(context).backgroundColor,
      actions: [
        GestureDetector(
            onTap: (){
              setState(() {
                print(isSearching);
                isSearching = !isSearching;
                print(isSearching);
              });
            },
            child: !isSearching ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.search),
            ):Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.close),
            ))
      ],
      // automaticallyImplyLeading: false,
    );
  }


  Widget _buildTabBar() {
    return Container(
      height: screenSize.height * 0.06,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide( 
            color: Color.fromRGBO(203, 203, 203, 1)
          ),
          top: BorderSide(  
            color: Color.fromRGBO(203, 203, 203, 1)
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                channelType = 'all';
              });
            },
            child: Container(
              height: screenSize.height * 0.06,
              color: channelType == 'all' ? Theme.of(context).highlightColor: Colors.white,
              width: screenSize.width * 0.43,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Image.asset('assets/images/squares.png',
                    width: screenSize.width / 35,
                    color: channelType == 'all' ? Colors.white: Colors.black)
                  ),
                  Text('All Channels',
                  style: TextStyle(
                    color: channelType == 'all' ? Colors.white: Colors.black,
                    fontFamily: 'Jost-Regular',
                    fontSize: screenSize.width / 25
                  ),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                channelType = 'favourites';
              });
            },
            child: Container(
              height: screenSize.height * 0.06,
              width: screenSize.width * 0.43,
              decoration: BoxDecoration(
                color: channelType == 'favourites' ? Theme.of(context).highlightColor: Colors.white,
                border: Border(
                  left: BorderSide( 
                    color: Color.fromRGBO(203, 203, 203, 1)
                  ),
                  right: BorderSide(  
                    color: Color.fromRGBO(203, 203, 203, 1)
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Image.asset('assets/images/favourite.png',
                    width: screenSize.width / 30,
                    color: channelType == 'favourites' ? Colors.white: Colors.black)
                  ),
                  Text('Favourite Stations',
                  style: TextStyle(
                    color: channelType == 'favourites' ? Colors.white: Colors.black,
                    fontFamily: 'Jost-Regular',
                    fontSize: screenSize.width / 25
                  ),)
                ],
              ),
            ),
          ),
          Container(
            width: screenSize.width * 0.14,
            child: GestureDetector(
              onTap: _openEndDrawer,
              child: Icon(Icons.view_sidebar_outlined)
              // SvgPicture.asset('assets/images/filters.svg',
              //   width: screenSize.width / 22,
              //   color: Colors.black
              // ),
            )
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, AsyncSnapshot<StationsBloc> snapshot) {

    return Container(
      child: channelType == 'all' ?
        AllChannels(snapshot): FavouriteChannels(snapshot),
    );
  }


  Widget _buildEndDrawer(context, AsyncSnapshot<StationsBloc> snapshot) {
      _countries = stationsBloc.countries;
      return Container(
        color: Theme.of(context).backgroundColor,
        child: Container(
          child: Column(
            children: [
              Container(
                color: Color.fromRGBO(203, 203, 203, 1),
                height: screenSize.height * 0.04,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                color: Color.fromRGBO(203, 203, 203, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Filter By Country',
                        style: TextStyle(
                          fontFamily: 'Jost-Medium'
                        ),
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                          stationsBloc.clearFilters();
                        }, 
                        child: Text('Clear All',
                        style: TextStyle(
                          fontFamily: 'Jost-Medium',
                          color: Colors.grey
                        ))
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: screenSize.height * 0.85,
                margin: EdgeInsets.only(top: 5.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0.0),
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _countries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                            child: GestureDetector(
                              onTap: (){
                                stationsBloc.filteredCountryId = _countries[index].id;
                                Navigator.of(context).pop();
                                stationsBloc.getCountryStations(_countries[index].id);
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: screenSize.height / 24,
                                child: Text(_countries[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: stationsBloc.filteredCountryId == _countries[index].id ?
                                            Theme.of(context).buttonColor: Color.fromRGBO(124, 138, 175, 1),
                                    fontFamily: 'Jost-Regular',
                                    fontSize: screenSize.width / 23
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      );
  }

  Widget _buildBottomBar(context, AsyncSnapshot<StationsBloc> snapshot){
    return stationsBloc.currentPlayingStation != null && 
    stationsBloc.currentPlayingStation.id != null ? BottomAppBar(
      color: Color.fromRGBO(72, 100, 170, 1),
      child: Container(
        height: screenSize.height * 0.09,
        child: Row(
          children: [
            Container(
              width: screenSize.width * 0.12,
              child: IconButton(
                icon: stationsBloc.isPlaying ? 
                Icon(Icons.pause, color: Colors.white, size: 30.0):
                Icon(Icons.play_arrow, color: Colors.white, size: 30.0), 
                onPressed: (){
                  if(!stationsBloc.isPlaying){
                    stationsBloc.startAudio();
                    stationsBloc.isPlaying = true;
                  } else {
                    stationsBloc.stopAudio();
                    stationsBloc.isPlaying = false;
                  }
                }
              ),
            ),
            Container(
              width: screenSize.width * 0.53,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(stationsBloc.currentPlayingStation.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Jost-Regular'
                    )),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(stationsBloc.currentPlayingStation.country,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontFamily: 'Jost-Regular'
                    )),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              width: screenSize.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      stationsBloc.currentPlayingStation.isFavourite = !stationsBloc.currentPlayingStation.isFavourite;
                      stationsBloc.updateFavourites(stationsBloc.currentPlayingStation);
                    },
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(5.0) 
                        ),
                      ),
                      child: Image.asset(!stationsBloc.currentPlayingStation.isFavourite ? 
                      'assets/images/unfavourite.png': 'assets/images/favourite.png',
                      height: screenSize.width / 27, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(5.0) 
                      ),
                    ),
                    child: Image.asset('assets/images/google.png',
                    height: screenSize.width / 27, color: Colors.white),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(5.0) 
                      ),
                    ),
                    child: Image.asset('assets/images/facebook.png',
                    height: screenSize.width / 27, color: Colors.white),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(5.0)
                      ),
                    ),
                    child: Image.asset('assets/images/twitter.png',
                    height: screenSize.width / 27, color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ): BottomAppBar();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return StreamBuilder<StationsBloc>(
      stream: stationsBloc.station,
      builder: (context, AsyncSnapshot<StationsBloc> snapshot) {
        return Scaffold(
          drawer: Container(
            child: Drawer(
              child: BuildSideMenu(),
            ),
          ),
          key: scaffoldKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Container(
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                    children: [
                      myappBar(),
                      isSearching ? Container(
                          margin: EdgeInsets.only(top: 5.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            color: Theme.of(context).backgroundColor,
                            child: Row(
                              children: [
                                Flexible(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                                      height: screenSize.height * 0.06,
                                      child: TextFormField(
                                        autofocus: true,
                                        cursorColor: Theme.of(context).iconTheme.color,
                                        controller: searchController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Search by Name',
                                          hintStyle: TextStyle(
                                              fontFamily: 'Jost-Regular'
                                          ),
                                        ),
                                        onChanged: (val){
                                          print('Searching...');

                                        },
                                      ),
                                    )
                                ),
                                Container(
                                  width: screenSize.width * 0.10,
                                  height: screenSize.height * 0.06,
                                  color: Colors.green,
                                  child: SvgPicture.asset('assets/images/search.svg',
                                      fit: BoxFit.none,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                      ): Container(),
                      _buildTabBar(),
                    ],
                  )
                ),
                Expanded(child: _buildBody(context, snapshot))
              ],
            ),
          ),
          endDrawer: Drawer(
            child: Container(
              width: screenSize.width * 0.6,
              child: Drawer(
                child: _buildEndDrawer(context, snapshot),
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomBar(context, snapshot),
        );
      }
    );
  }


}
