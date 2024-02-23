import 'dart:math';

import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_color.dart';
import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_fontstyle.dart';
import 'package:dailoz/dailoz/dailoz_gloabelclass/dailoz_icons.dart';
import 'package:dailoz/dailoz/dailoz_page/dailoz_task/chitietlichsu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dailoz_theme/dailoz_themecontroller.dart';
import '../../dulieu.dart';
import '../dailoz_profile/dailoz_personal.dart';
import '../dailoz_profile/dailoz_private.dart';
import '../dailoz_profile/dailoz_work.dart';
import '../dailoz_task/dailoz_taskdetail.dart';
import '../dailoz_task/lichsuitem.dart';
import '../dailoz_task/themdulieu.dart';
import 'dailoz_mytask.dart';

class Dailozhome extends StatefulWidget {
  const Dailozhome({Key? key}) : super(key: key);

  @override
  State<Dailozhome> createState() => _DailozhomeState();
}
String convertHourFormat(String input) {
  try {
    int hour = int.parse(input.split('h')[0]);
    return '$hour Giờ';
  } catch (e) {
    return input; // Trả về nguyên gốc nếu không thể chuyển đổi
  }
}

void _sortDataByDate() {
  lichSuItems.sort((a, b) => b.ngay.compareTo(a.ngay));
}
var rng = Random();
int yatogamine = rng.nextInt(100) + 1;

List<LichSuItem> lichSuItems = [];
final DatabaseHelper dbHelper = DatabaseHelper();

class _DailozhomeState extends State<Dailozhome> {


  @override
  void initState() {
    super.initState();
    _initData();

  }
  void _initData() async {


    await dbHelper.initDatabase();
    List<Map<String, dynamic>> lichSuData = await dbHelper.getAllLichSu();
    setState(() {
      lichSuItems.clear();
      _sortDataByDate();
      int newestItemId = lichSuData.isNotEmpty
          ? lichSuData.reduce((a, b) => a['id'] > b['id'] ? a : b)['id']
          : 0;
      for (var i = 0; i < lichSuData.length; i++) {
        lichSuItems.add(LichSuItem(
          id: lichSuData[i]['id'],
          thu: lichSuData[i]['thu'],
          ngay: lichSuData[i]['ngay'],
          cdSang: lichSuData[i]['cd_sang'],
          cdToi: lichSuData[i]['cd_toi'],
          donThuong: lichSuData[i]['don_thuong'],
          tongChuyen: lichSuData[i]['tong_chuyen'],
          tongDiem: lichSuData[i]['tong_diem'],
          doanhThuNgay: lichSuData[i]['doanh_thungay'],
          vuotChuyen: lichSuData[i]['vuot_chuyen'],
          dbThuNhap: lichSuData[i]['db_thunhap'],
          diemTuan: lichSuData[i]['diem_tuan'],
          duGio: lichSuData[i]['du_gio'],
          caDangKi: lichSuData[i]['ca_dangki'],
          gioThemDuLieu: lichSuData[i]['gio_themdulieu'],
          thoigianHd: lichSuData[i]['thoigian_hd'],
          solansacPin: lichSuData[i]['solansac_pin'],
          thoigianSac: lichSuData[i]['thoigian_sac'],
          tilenhanchuyen: lichSuData[i]['tilenhanchuyen'],
          tilehuychuyen: lichSuData[i]['tilehuychuyen'],
          tilehoanthanhchuyen: lichSuData[i]['tilehoanthanhchuyen'],
          yatagami7: lichSuData[i]['yatagami7'],
          yatagami8: lichSuData[i]['yatagami8'],
          yatagami9: lichSuData[i]['yatagami9'],
          yatagami10: lichSuData[i]['yatagami10'],
          yatagami11: lichSuData[i]['yatagami11'],
          yatagami12: lichSuData[i]['yatagami12'],
          yatagami13: lichSuData[i]['yatagami13'],
          yatagami14: lichSuData[i]['yatagami14'],
          yatagami15: lichSuData[i]['yatagami15'],
          yatagami16: lichSuData[i]['yatagami16'],
          isNewest: lichSuData[i]['id'] == newestItemId,
        ));
      }
    });
  }


  String yatogami = "cau"+yatogamine.toString();

  final themedata = Get.put(DailozThemecontroler());
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height/96,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Xin Chào, Yatogami Tenka".tr, style: hsSemiBold.copyWith(fontSize: 26)),
                      FutureBuilder<String?>(
                        future: DatabaseHelper().getCaDangKiAdmin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String formattedHour = convertHourFormat(snapshot.data!);
                              return Text(
                                "Bạn đã đăng kí đại sứ : $formattedHour",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              return Text(
                                "Không có dữ liệu",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      FutureBuilder<String?>(
                        future: DatabaseHelper().getCaDangKiAdmin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String formattedHour = convertHourFormat(snapshot.data!);
                              return Text(
                                "Nhiệm vụ Tuần : coming soon",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              return Text(
                                "Không có dữ liệu",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      FutureBuilder<String?>(
                        future: DatabaseHelper().getCaDangKiAdmin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String formattedHour = convertHourFormat(snapshot.data!);
                              return Text(
                                "Nhiệm vụ ngày : coming soon",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              return Text(
                                "Không có dữ liệu",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      FutureBuilder<String?>(
                        future: DatabaseHelper().getCaDangKiAdmin(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String formattedHour = convertHourFormat(snapshot.data!);
                              return Text(
                                "App dev by (0397770219 Zalo) - Hà Nội,HCM,Đà nẵng",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            } else {
                              return Text(
                                "Không có dữ liệu",
                                style: hsRegular.copyWith(fontSize: 14),
                              );
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),





                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: height/16,
                    height: height/16,
                    decoration:  BoxDecoration(
                      color: DailozColor.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(color: DailozColor.textgray,blurRadius: 5)
                        ]
                    ),
                    child: Image.asset(DailozPngimage.avtar,height: height/36,),
                  )
                ],
              ),






              SizedBox(height: height/36,),
              Text("yatogamihome".tr,style: hsSemiBold.copyWith(fontSize: 24),),
              Text(yatogami.tr,style: hsSemiBold.copyWith(fontSize: 14,color: DailozColor.tenka),),
              SizedBox(height: height/36,),
              //11212
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: DailozColor.transparent,
                      highlightColor: DailozColor.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DailozMyTask("Completed")),
                        );
                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.lightblue,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.nhiemvungay, height: height / 12, fit: BoxFit.fitHeight),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: DailozColor.transparent,
                      highlightColor: DailozColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const DailozWork();
                        },));
                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.lightred,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.nhiemvuntuan, height: height / 12, fit: BoxFit.fitHeight),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: InkWell(
                      splashColor: DailozColor.transparent,
                      highlightColor: DailozColor.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DailozMyTask("Pending")),
                        );
                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.purple,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.dangphattrien, height: height / 12, fit: BoxFit.fitHeight),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: DailozColor.transparent,
                      highlightColor: DailozColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const khuvucdangki();
                        },));
                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.lightgreen,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.doikhuvuc, height: height / 12, fit: BoxFit.fitHeight),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: DailozColor.transparent,
                      highlightColor: DailozColor.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DailozMyTask("Completed")),
                        );
                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.lightblue,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.dangphattrien, height: height / 12, fit: BoxFit.fitHeight),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: DailozColor.transparent,
                      highlightColor: DailozColor.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DailozMyTask("Canceled")),
                        );
                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.lightred,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.tuychinhchinhsach, height: height / 12, fit: BoxFit.fitHeight),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: DailozColor.transparent,
                      highlightColor: DailozColor.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DailozMyTask("Pending")),
                        );
                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.purple,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.tuychinhthongtin, height: height / 12, fit: BoxFit.fitHeight),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: DailozColor.transparent,
                      highlightColor: DailozColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const calamviec();
                        },));
                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.lightgreen,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.thaydoidaisu, height: height / 12, fit: BoxFit.fitHeight),
                          ],
                        ),
                      ),
                    ),
                  ),









                ],
              ),





    
          ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: DailozColor.appcolor,

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return themdulieu(
              initDataCallback: _initData,
            );

          },));
        },
        child: const Icon(Icons.add,size: 22,color: DailozColor.white,),
      ),












    );
  }


  Future<bool> createBoard() async {
    String selectedKhuvuc = 'hanoi';
    String selectedCaDangKi = '5h';

    final Map<String, String> khuVucMapping = {
      'Hà Nội': 'hanoi',
      'HCM,BD,Đồng Nai': 'miennam',
      'Đà Nẵng': 'danang',
    };

    final Map<String, String> caDangKiMapping = {
      'Đại Sứ 5 Giờ': '5h',
      'Đại sứ 8 Giờ': '8h',
      'Đại sứ 10 Giờ': '10h',
    };

    await showDialog(
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 56, vertical: height / 96),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Thiết lập ứng dụng", style: hsSemiBold.copyWith(fontSize: 22)),
                SizedBox(height: height / 40),
                Text("Chọn khu vực", style: hsSemiBold.copyWith(fontSize: 14, color: DailozColor.tenka)),
                SizedBox(height: height / 46),
                CupertinoPicker(
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) async {
                    selectedKhuvuc = khuVucMapping.values.elementAt(index);
                    await DatabaseHelper().saveBoardInfo(selectedKhuvuc, selectedCaDangKi);
                  },
                  children: khuVucMapping.keys.map((String key) {
                    return Center(
                      child: Text(
                        key,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: themedata.isdark ? DailozColor.white : DailozColor.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: height / 46),
                Text("Chọn Ca đăng kí", style: hsSemiBold.copyWith(fontSize: 14, color: DailozColor.tenka)),
                SizedBox(height: height / 46),
                CupertinoPicker(
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) async {
                    selectedCaDangKi = caDangKiMapping.values.elementAt(index);
                    await DatabaseHelper().saveBoardInfo(selectedKhuvuc, selectedCaDangKi);
                  },
                  children: caDangKiMapping.keys.map((String key) {
                    return Center(
                      child: Text(
                        key,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: themedata.isdark ? DailozColor.white : DailozColor.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: height / 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: height / 20,
                          width: width / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: DailozColor.appcolor)
                          ),
                          child: Center(child: Text("Mặc định", style: hsRegular.copyWith(fontSize: 14, color: DailozColor.appcolor))),
                        ),
                      ),
                      SizedBox(width: width / 36),
                      InkWell(
                        splashColor: DailozColor.transparent,
                        highlightColor: DailozColor.transparent,
                        onTap: () async {
                          await DatabaseHelper().saveBoardInfo(selectedKhuvuc, selectedCaDangKi);
                          Navigator.pop(context);


                        },
                        child: Container(
                          height: height / 20,
                          width: width / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: DailozColor.appcolor
                          ),
                          child: Center(child: Text("Lưu Thông tin", style: hsRegular.copyWith(fontSize: 14, color: DailozColor.white))),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height / 56),
              ],
            ),
          )
        ],
      ),
      context: context,
    );
    return true;
  }



}
