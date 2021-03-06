import 'package:flutter/material.dart';
import 'package:places/ui/widgets/list_screen/search_bar.dart';

class SliverAppBarList extends StatefulWidget {
  const SliverAppBarList({Key? key}) : super(key: key);

  @override
  _SliverAppBarListState createState() => _SliverAppBarListState();
}

class _SliverAppBarListState extends State<SliverAppBarList> {
  double appBarHeight = 0.0;
  bool isNotCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0.0,
      expandedHeight: 170.0,
      backgroundColor: Theme.of(context).accentColor,
      flexibleSpace: LayoutBuilder(
        builder: ( context,  constraints) {
          appBarHeight = constraints.biggest.height;
          isNotCollapsed = appBarHeight > 140 ? true : false;
          return Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: isNotCollapsed
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                FlexibleSpaceBar(
                  centerTitle: isNotCollapsed ? false : true,
                  titlePadding: EdgeInsets.only(
                    top: isNotCollapsed ? 40 : 15,
                  ),
                  title: isNotCollapsed
                      ? Text(
                          'Список\nинтересных мест',
                          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24,fontWeight: FontWeight.w700),
                        )
                      : Text(
                          'Список интересных мест',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                ),
                if (appBarHeight > 190)
                  const SizedBox(height: 10)
                else
                  const SizedBox(height: 0),
                if (appBarHeight > 200)
                  SearchBar()
                else
                  const SizedBox(height: 0),
              ],
            ),
          );
        },
      ),
    );
  }
}
