import 'dart:math';


import 'package:dailoz/dailoz/yatogami_page/yatogami_home/test.dart';
import 'package:dailoz/dailoz/yatogami_page/yatogami_home/yatogami_mytask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../database.dart';
import '../../yatogami_gloabelclass/yatogami_color.dart';
import '../../yatogami_gloabelclass/yatogami_fontstyle.dart';
import '../../yatogami_gloabelclass/yatogami_icons.dart';
import '../../yatogami_theme/yatogami_themecontroller.dart';
import '../yatogami_profile/yatogami_calamviec.dart';
import '../yatogami_profile/yatogami_khuvucdangki.dart';
import '../yatogami_profile/yatogami_nhiemvutuan.dart';
import '../yatogami_task/lichsuitem.dart';
import '../yatogami_task/themdulieu.dart';


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

double _currentSliderValue = 20;



String khuvucnehihi(String khuvucne) {
  switch (khuvucne) {
    case 'hanoi':
      return 'Hà Nội';
    case 'danang':
      return 'Đà Nẵng';
    case 'miennam':
      return 'Hồ Chí Minh,Bình Dương,Đồng Nai';
    default:
      return '';
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

  late final WebViewController controller;

  late DateTime pickedDate;
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initData();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://yatogami08.github.io/103.html'));


    dateController.text = DateFormat('EEEE, dd/MM/yyyy', 'vi_VN').format(DateTime.now());
  }
  void _initData() async {
    await dbHelper.addNewColumns();

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

  DateTime? _selectedDay;
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
                        future: DatabaseHelper().getCalkhuvuc(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              String khuvucne = khuvucnehihi(snapshot.data!);
                              return Text(
                                "khu vực hiện tại : $khuvucne",
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
                              double maxValue = 100;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nhiệm vụ Tuần:",
                                    style: hsRegular.copyWith(fontSize: 14),
                                  ),

                                ],
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
              Text("yatogamihome".tr + " 1.0.3",style: hsSemiBold.copyWith(fontSize: 24),),
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
                          MaterialPageRoute(builder: (context) => GLBViewer()),
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
                          return const nhiemvutuan();
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
                          color: DailozColor.mau1,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(DailozPngimage.saoluu, height: height / 12, fit: BoxFit.fitHeight),
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
                          color: DailozColor.mau2,
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


                        _themdulieu1(context);

                      },
                      child: Container(
                        height: height / 12,
                        width: height / 6, // Để tạo ô vuông
                        margin: EdgeInsets.all(5), // Khoảng cách giữa các ô
                        decoration: BoxDecoration(
                          color: DailozColor.mau3,
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
                          color: DailozColor.mau4,
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


              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: height / 4,
                      child: WebViewWidget(
                        controller: controller,


                        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                          Factory<HorizontalDragGestureRecognizer>(
                                () => HorizontalDragGestureRecognizer()
                              ..onUpdate = (_) {},
                          ),
                        },
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

  // Hàm kiểm tra tệp .glb có tồn tại không
  Future<bool> checkIfGLBFileExists(String filePath) async {
    try {
      // Đọc tệp .glb từ assets
      ByteData data = await rootBundle.load(filePath);
      // Nếu không có lỗi, tệp tồn tại
      return data != null;
    } catch (error) {
      // Nếu có lỗi xảy ra, tệp không tồn tại
      return false;
    }
  }






  Future<void> _themdulieu1(BuildContext context) async {


    return await showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/56,vertical: height/96),
              child: Column(
                children: [
                  Text("Thêm Dữ liệu Bước 1".tr,style: hsSemiBold.copyWith(fontSize: 22)),
                  SizedBox(height: height/56,),
                  SizedBox(height: height/36,),


                  TextField(
                    controller: dateController,
                    style: hsMedium.copyWith(fontSize: 16,color: themedata.isdark?DailozColor.white:DailozColor.black),
                    decoration: InputDecoration(
                        hintStyle: hsMedium.copyWith(fontSize: 16,color: DailozColor.tenka),
                        hintText: DateFormat('dd MMMM yyyy').format(DateTime.now()),

                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: InkWell(
                              splashColor: DailozColor.transparent,
                              highlightColor: DailozColor.transparent,
                              onTap: () {
                                calendar();
                             // Bạn có thể sử dụng selectedValue ở đây hoặc bất kỳ nơi nào cần thiết

                              },
                              child: Image.asset(DailozPngimage.calendar,height: height/36,color: DailozColor.textgray)),
                        ),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: DailozColor.greyy)
                        )
                    ),
                  ),


                  SizedBox(height: height/36,),
                  Text("Vui lòng chọn ngày thêm dữ liệu".tr,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: hsRegular.copyWith(fontSize: 16)),
                  SizedBox(height: height/36,),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: height/20,
                            width: width/4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: DailozColor.appcolor)
                            ),
                            child: Center(child: Text("Cancel".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.appcolor),)),
                          ),
                        ),
                        SizedBox(width: width/36,),
                        Container(
                          height: height / 20,
                          width: width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: DailozColor.appcolor,
                          ),
                          child: TextButton(
                            onPressed: () async {

                              // Đóng dialog
                              Navigator.of(context).pop();
                              _themdulieu2(context);
                            },
                            child: Center(
                              child: Text(
                                "Tiếp Theo".tr,
                                style: hsRegular.copyWith(fontSize: 14, color: DailozColor.white),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: height/56,),
                ],
              ),
            )
          ],
        ),
        context: context);
  }

  Future<void> _themdulieu2(BuildContext context) async {


    return await showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/56,vertical: height/96),
              child: Column(
                children: [
                  Text("Thêm Dữ liệu Bước 2".tr,style: hsSemiBold.copyWith(fontSize: 22)),
                  SizedBox(height: height/56,),
                  SizedBox(height: height/36,),


                  TextField(
                    controller: dateController,
                    style: hsMedium.copyWith(fontSize: 16,color: themedata.isdark?DailozColor.white:DailozColor.black),
                    decoration: InputDecoration(
                        hintStyle: hsMedium.copyWith(fontSize: 16,color: DailozColor.tenka),
                        hintText: DateFormat('dd MMMM yyyy').format(DateTime.now()),

                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: InkWell(
                              splashColor: DailozColor.transparent,
                              highlightColor: DailozColor.transparent,
                              onTap: () {
                                calendar();
                                // Bạn có thể sử dụng selectedValue ở đây hoặc bất kỳ nơi nào cần thiết

                              },
                              child: Image.asset(DailozPngimage.calendar,height: height/36,color: DailozColor.textgray)),
                        ),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: DailozColor.greyy)
                        )
                    ),
                  ),


                  SizedBox(height: height/36,),
                  Text("Vui lòng chọn ngày thêm dữ liệu".tr,textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,style: hsRegular.copyWith(fontSize: 16)),
                  SizedBox(height: height/36,),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: DailozColor.transparent,
                          highlightColor: DailozColor.transparent,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: height/20,
                            width: width/4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: DailozColor.appcolor)
                            ),
                            child: Center(child: Text("Cancel".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.appcolor),)),
                          ),
                        ),
                        SizedBox(width: width/36,),
                        Container(
                          height: height / 20,
                          width: width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: DailozColor.appcolor,
                          ),
                          child: TextButton(
                            onPressed: () async {

                              // Đóng dialog
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text(
                                "Tiếp Theo".tr,
                                style: hsRegular.copyWith(fontSize: 14, color: DailozColor.white),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: height/56,),
                ],
              ),
            )
          ],
        ),
        context: context);
  }




  Future<bool> calendar() async {
    print('Height: $height, Width: $width');
    return await showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Column(
              children: [
                TableCalendar(
                  locale: 'vi_VN', // Sử dụng định dạng ngôn ngữ Tiếng Việt
                  firstDay: DateTime.now().subtract(Duration(days: 30)),
                  focusedDay: DateTime.now(),
                  lastDay: DateTime.utc(2050, 3, 14),
                  headerVisible: true,
                  daysOfWeekVisible: true,
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: DailozColor.appcolor,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(
                      color: DailozColor.white,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: DailozColor.appcolor,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: DailozColor.white,
                    ),
                  ),
                  shouldFillViewport: false,
                  currentDay: _selectedDay,
                  calendarFormat: CalendarFormat.month,
                  pageAnimationEnabled: false,
                  headerStyle: HeaderStyle(
                      leftChevronIcon: SizedBox(
                        height: height / 26,
                        width: height / 26,
                        child: const Icon(
                          Icons.chevron_left,
                          color: DailozColor.textgray,
                        ),
                      ),
                      rightChevronIcon: SizedBox(
                          height: height / 26,
                          width: height / 26,
                          child: const Icon(Icons.chevron_right,
                            color:DailozColor.textgray,)),
                      formatButtonVisible: false,
                      decoration: const BoxDecoration(
                        color: DailozColor.transparent,
                      ),
                      titleCentered: true,
                      titleTextStyle: hsBold.copyWith(
                        fontSize: 16,
                        color: DailozColor.black,
                      )),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);

                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {

                      _selectedDay = selectedDay;
                      print('Selected Day: $_selectedDay');
                      dateController.text = DateFormat('EEEE, dd/MM/yyyy', 'vi_VN').format(selectedDay);
                      Navigator.pop(context);
                     // Bạn có thể sử dụng selectedValue ở đây hoặc bất kỳ nơi nào cần thiết
                      pickedDate = selectedDay;
                      /*  String convertdate = FormatedDate(_selectedDay.toString());
                      selectdate = convertdate;*/
                      // Navigator.pop(context);
                    });

                  },
                ),
                SizedBox(height: height/36,),
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
                          height: height/20,
                          width: width/4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: DailozColor.appcolor)
                          ),
                          child: Center(child: Text("Cancel".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.appcolor),)),
                        ),
                      ),
                      SizedBox(width: width/36,),
                      Container(
                        height: height/20,
                        width: width/4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: DailozColor.appcolor
                        ),
                        child: Center(child: Text("Save".tr,style: hsRegular.copyWith(fontSize: 14,color: DailozColor.white),)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height/56,),
              ],
            )
          ],
        ),

        context: context);

  }





}
