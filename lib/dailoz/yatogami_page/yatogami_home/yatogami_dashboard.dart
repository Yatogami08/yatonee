
import 'package:dailoz/dailoz/yatogami_page/yatogami_home/yatogami_home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../database.dart';
import '../../yatogami_gloabelclass/yatogami_color.dart';
import '../../yatogami_gloabelclass/yatogami_icons.dart';
import '../../yatogami_theme/yatogami_themecontroller.dart';
import '../yatogami_graphic/chitiettuan.dart';
import '../yatogami_profile/yatogami_hoso.dart';
import '../yatogami_task/dailoz_task.dart';

// ignore: must_be_immutable
class DailozDashboard extends StatefulWidget {





  String? index;

  DailozDashboard(this.index, {Key? key}) : super(key: key);
  @override
  State<DailozDashboard> createState() => _DailozDashboardState();
}

class _DailozDashboardState extends State<DailozDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int selectindex = 0;
  PageController pageController = PageController();
  int _selectedItemIndex = 0;
  final themedata = Get.put(DailozThemecontroler());
  late List<Widget> _pages;
  late String khuvuc="hanoi"; // Khai báo biến khuvuc ở đây

  @override
  void initState() {
    super.initState();
    _initPages();
    init();
    _fetchCaDangKiAdmin(); // Gọi hàm để cập nhật giá trị của khuvuc

  }
  Future<void> _fetchCaDangKiAdmin() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    final result = await databaseHelper.fetchCaDangKiAdmin();
    setState(() {
      khuvuc = result['khuvuc'] ?? "";
      _initPages(); // Gọi lại _initPages sau khi cập nhật giá trị khuvuc

    });
  }
  void _initPages() {

    _pages = [
      Dailozhome(),
      lichsungay(),
      if (khuvuc == "hanoi") xanhsmxinchao(onLeftArrowPressed: () {}, onRightArrowPressed: () {}),
      if (khuvuc == "miennam") xanhsmxinchao(onLeftArrowPressed: () {}, onRightArrowPressed: () {}),
      if (khuvuc == "danang")xanhsmxinchao(onLeftArrowPressed: () {}, onRightArrowPressed: () {}),
      DailozProfile(),
    ];
  }


  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }










  Widget _bottomTabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 36),
      child: Container(
        decoration: BoxDecoration(
          color: themedata.isdark ? DailozColor.black : DailozColor.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [BoxShadow(color: DailozColor.textgray, blurRadius: 5)],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedItemIndex,
          onTap: _onTap,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: DailozColor.transparent,
          type: BottomNavigationBarType.fixed,
          fixedColor: themedata.isdark ? DailozColor.white : DailozColor.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(DailozSvgimage.home, height: height / 30, width: width / 30),
              activeIcon: SvgPicture.asset(DailozSvgimage.homefill, height: height / 35, width: width / 35),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(DailozSvgimage.task, height: height / 30, width: width / 30),
              activeIcon: SvgPicture.asset(DailozSvgimage.taskfill, height: height / 30, width: width / 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(DailozSvgimage.graphic, height: height / 32, width: width / 32),
              activeIcon: SvgPicture.asset(DailozSvgimage.graphicfill, height: height / 34, width: width / 34),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(DailozSvgimage.folder, height: height / 32, width: width / 32),
              activeIcon: SvgPicture.asset(DailozSvgimage.folderfill, height: height / 32, width: width / 32),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
      _initPages();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return GetBuilder<DailozThemecontroler>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: _bottomTabBar(),
          body: _pages[_selectedItemIndex],
        );
      },
    );
  }
}
