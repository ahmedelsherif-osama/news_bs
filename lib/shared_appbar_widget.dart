import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bs/cubit.dart';
import 'package:news_bs/search_results_page.dart';

class SharedAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const SharedAppBarWidget({Key? key}) : super(key: key);

  @override
  State<SharedAppBarWidget> createState() => _SharedAppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SharedAppBarWidgetState extends State<SharedAppBarWidget> {
  IconData? icon = Icons.search;

  @override
  void initState() {
    icon = Icons.search;
    super.initState();
  }

  void changeIcon() {
    if (icon == Icons.search) {
      setState(() {
        icon = Icons.close;
      });
    } else {
      setState(() {
        icon = Icons.search;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('TIMES news'),
      actions: <Widget>[
        Visibility(
          visible: icon != Icons.search,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: TextFormField(
              autofocus: true,
              onFieldSubmitted: (value) {
                print("submitted");
                // context.read<TestCubit>().selectSearchKeyword(value);
                changeIcon();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SearchResultsPage(
                              searchKeyword: value,
                            )));
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            changeIcon();
          },
        ),
      ],
    );
  }
}
