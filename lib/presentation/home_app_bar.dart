import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_app/core/app_theme.dart';
import 'package:todo_list_app/core/constants.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(152);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  int? selectedDate;
  final _pageController = PageController(initialPage: 2);

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now().day;
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 48,
                  child: Icon(Icons.menu, size: 28),
                ),
                Text('Todo List', style: AppTheme.title1),
                const SizedBox(
                  width: 48,
                  child: Icon(
                    Icons.calendar_today_outlined,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            height: 96,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    7,
                    (index) => SizedBox(
                      width: (100 / 7).w,
                      height: 48,
                      child: Center(
                        child: Text(
                          kdayList[index],
                          style: AppTheme.title1.copyWith(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) => Row(
                      children: List.generate(7, (j) {
                        late int diff;
                        switch (DateFormat('EEEE').format(DateTime.now())) {
                          case "Monday":
                            diff = 14;
                            break;
                          case "Tuesday":
                            diff = 15;
                            break;
                          case "Wednesday":
                            diff = 16;
                            break;
                          case "Thursday":
                            diff = 17;
                            break;
                          case "Friday":
                            diff = 18;
                            break;
                          case "Saturday":
                            diff = 19;
                            break;
                          case "Sunday":
                            diff = 20;
                            break;
                        }
                        DateTime date = DateTime.now()
                            .add(Duration(days: j + (i * 7) - diff));
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedDate = date.day;
                            });
                          },
                          child: SizedBox(
                            width: (100 / 7).w,
                            height: 48,
                            child: Center(
                              child: selectedDate == date.day
                                  ? Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.yellow.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${date.month}월',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${date.day}일',
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : Text(
                                      '${date.day}',
                                      style: AppTheme.title1
                                          .copyWith(fontSize: 22),
                                    ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
