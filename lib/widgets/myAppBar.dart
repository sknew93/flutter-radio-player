import 'package:flutter/material.dart';
import 'package:radiostring/utils/utils.dart';

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      title: Text(currentPage,
        style: TextStyle(fontWeight: FontWeight.bold,
            fontFamily: 'Jost-Regular',
            color: (currentPage=='Radio String')?Theme.of(context).colorScheme.primary:Colors.white),),
      backgroundColor: (currentPage == 'Radio String') ?Colors.white : Theme.of(context).canvasColor,
      actions: [
        GestureDetector(
            onTap: (){
              setState(() {
                print(isSearching);
                isSearching = !isSearching;
                print(isSearching);
              });
            },
            child: (currentPage=='Radio String') ? ((!isSearching)?Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.search),
            ):Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.close),
            )):Container()
        )
      ],
      // automaticallyImplyLeading: false,
    );
  }
}
