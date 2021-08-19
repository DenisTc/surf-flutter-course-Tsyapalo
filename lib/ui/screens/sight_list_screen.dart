import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/sight_bottom_nav_bar.dart';
import 'package:places/ui/widgets/card/sight_card.dart';
import 'package:places/ui/widgets/list_screen/add_sight_button.dart';
import 'package:places/ui/widgets/list_screen/search_bar.dart';
import 'package:places/ui/widgets/list_screen/sight_app_bar.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  double appBarHeight = 0.0;
  bool isNotCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0.0,
                expandedHeight: 170.0,
                backgroundColor: Colors.white,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
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
                                ? const Text(
                                    'Список\nинтересных мест',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )
                                : const Text(
                                    'Список интересных мест',
                                    textAlign: TextAlign.center,
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
              ),
              SliverPadding(
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final sight = mocks[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SightCard(sight: sight),
                      );
                    },
                    childCount: mocks.length,
                  ),
                ),
                padding: const EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
          const AddSightButton(),
        ],
      ),
      bottomNavigationBar: const SightBottomNavBar(),
    );
  }
}