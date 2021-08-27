import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/colors.dart';
import 'package:places/ui/icons.dart';

int? indexCategory;

class SightCategoryScreen extends StatefulWidget {
  const SightCategoryScreen({Key? key}) : super(key: key);

  @override
  _SightCategoryScreenState createState() => _SightCategoryScreenState();
}

class _SightCategoryScreenState extends State<SightCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: mocks.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                mocks[index].type[0].toUpperCase() +
                                    mocks[index].type.substring(1),
                                style: const TextStyle(
                                  color: myLightMain,
                                  fontSize: 16,
                                ),
                              ),
                              if (indexCategory == index)
                                SvgPicture.asset(
                                  iconCheck,
                                  height: 15,
                                  width: 15,
                                  color: myLightGreen,
                                ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          const Divider(height: 1),
                        ],
                      ),
                    ),
                    onTap: () => {
                      if (indexCategory != index)
                        {
                          indexCategory = index,
                        }
                      else
                        {
                          indexCategory = null,
                        },
                      setState(() {}),
                    },
                  );
                },
              ),
            ),
          ),
          const _SaveButton(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Сохранить'.toUpperCase(),
          style: TextStyle(
            color: (indexCategory == null)
                ? myLightSecondaryTwo.withOpacity(0.56)
                : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              (indexCategory == null) ? myLightBackground : myLightGreen),
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 48)),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text('Категория'),
      leading: IconButton(
        icon: const Icon(Icons.navigate_before_rounded),
        onPressed: () => Navigator.of(context).pop(),
        iconSize: 35,
      ),
    );
  }
}
