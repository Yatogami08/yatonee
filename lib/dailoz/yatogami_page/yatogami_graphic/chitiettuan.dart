import 'dart:developer';

import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_color.dart';
import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_fontstyle.dart';
import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../yatogami_theme/yatogami_themecontroller.dart';
import '../../database.dart';
import '../yatogami_home/yatogami_home.dart';



class xanhsmxinchao extends StatefulWidget {
  late DateTime startDateOfWeek;
  late DateTime endDateOfWeek;
  final Function() onLeftArrowPressed;
  final Function() onRightArrowPressed;

  xanhsmxinchao({Key? key, required this.onLeftArrowPressed, required this.onRightArrowPressed}) : super(key: key);

  State<xanhsmxinchao> createState() => _DailozTaskState();
}

class _DailozTaskState extends State<xanhsmxinchao> {
  Map<String, dynamic>? dataForSelectedWeek;
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  int isselected = 0;
  int yato_4nhiemvu5h1 = 0;
  int yato_5nhiemvu5h1 = 0;
  String muocthuongvndnhiemvu5h1 = "";
  int yato_4nhiemvu5h2 = 0;
  int yato_5nhiemvu5h2 = 0;
  String muocthuongvndnhiemvu5h2 = "";
  int yato_4nhiemvu5h3 = 0;
  int yato_5nhiemvu5h3 = 0;
  String muocthuongvndnhiemvu5h3 = "";


  int yato_4nhiemvu8h1 = 0;
  int yato_5nhiemvu8h1 = 0;
  String muocthuongvndnhiemvu8h1 = "";
  int yato_4nhiemvu8h2 = 0;
  int yato_5nhiemvu8h2 = 0;
  String muocthuongvndnhiemvu8h2 = "";
  int yato_4nhiemvu8h3 = 0;
  int yato_5nhiemvu8h3 = 0;
  String muocthuongvndnhiemvu8h3 = "";
  int yato_4nhiemvu8h4 = 0;
  int yato_5nhiemvu8h4 = 0;
  String muocthuongvndnhiemvu8h4 = "";


  int yato_4nhiemvu10h1 = 0;
  int yato_5nhiemvu10h1 = 0;
  String muocthuongvndnhiemvu10h1 = "";
  int yato_4nhiemvu10h2 = 0;
  int yato_5nhiemvu10h2 = 0;
  String muocthuongvndnhiemvu10h2 = "";
  int yato_4nhiemvu10h3 = 0;
  int yato_5nhiemvu10h3 = 0;
  String muocthuongvndnhiemvu10h3 = "";
  int yato_4nhiemvu10h4 = 0;
  int yato_5nhiemvu10h4 = 0;
  String muocthuongvndnhiemvu10h4 = "";
  String khuvuc = '';




  Future<void> _loadCaDangKiAdmin() async {
    String? caDangKiAdmin = await DatabaseHelper().getCalkhuvuc();
    if (caDangKiAdmin != null) {
      setState(() {
        khuvuc = caDangKiAdmin;
        print(khuvuc);
      });
    }
  }




  String yatogami = '';

  Future<void> _loadCaDangKiAdmin1() async {
    String? caDangKiAdmin = await DatabaseHelper().getCaDangKiAdmin();
    if (caDangKiAdmin != null) {
      setState(() {
        yatogami = caDangKiAdmin;
      });
    }
  }




  Future<void> _fetchData() async {
    // Lấy dữ liệu từ cơ sở dữ liệu
    final List<Map<String, dynamic>> data = await dbHelper.getNhiemvuData();

    // Xử lý dữ liệu và gán giá trị cho các biến tương ứng
    for (final item in data) {
      final String ca_dangki = item['ca_dangki'];
      final int yato_4 = int.tryParse(item['yato_4']) ?? 0;
      final int yato_5 = int.tryParse(item['yato_5']) ?? 0;
      final String muocthuong_vnd = item['muocthuongvnd'] ?? '';

      // Gán giá trị cho các biến tương ứng với các điều kiện
      if (ca_dangki == '5h') {
        if (item['muc'] == 'Mức 1') {
          yato_4nhiemvu5h1 = yato_4;
          yato_5nhiemvu5h1 = yato_5;
          muocthuongvndnhiemvu5h1 = muocthuong_vnd;
        } else if (item['muc'] == 'Mức 2') {
          yato_4nhiemvu5h2 = yato_4;
          yato_5nhiemvu5h2 = yato_5;
          muocthuongvndnhiemvu5h2 = muocthuong_vnd;
        } else if (item['muc'] == 'Mức 3') {
          yato_4nhiemvu5h3 = yato_4;
          yato_5nhiemvu5h3 = yato_5;
          muocthuongvndnhiemvu5h3 = muocthuong_vnd;
        }
      } else if (ca_dangki == '8h') {
        if (item['muc'] == 'Mức 1') {
          yato_4nhiemvu8h1 = yato_4;
          yato_5nhiemvu8h1 = yato_5;
          muocthuongvndnhiemvu8h1 = muocthuong_vnd;
        } else if (item['muc'] == 'Mức 2') {
          yato_4nhiemvu8h2 = yato_4;
          yato_5nhiemvu8h2 = yato_5;
          muocthuongvndnhiemvu8h2 = muocthuong_vnd;
        } else if (item['muc'] == 'Mức 3') {
          yato_4nhiemvu8h3 = yato_4;
          yato_5nhiemvu8h3 = yato_5;
          muocthuongvndnhiemvu8h3 = muocthuong_vnd;
        } else if (item['muc'] == 'Mức 4') {
          yato_4nhiemvu8h4 = yato_4;
          yato_5nhiemvu8h4 = yato_5;
          muocthuongvndnhiemvu8h4 = muocthuong_vnd;
        }
      } else if (ca_dangki == '10h') {
        if (item['muc'] == 'Mức 1') {
          yato_4nhiemvu10h1 = yato_4;
          yato_5nhiemvu10h1 = yato_5;
          muocthuongvndnhiemvu10h1 = muocthuong_vnd ;
        } else if (item['muc'] == 'Mức 2') {
          yato_4nhiemvu10h2 = yato_4;
          yato_5nhiemvu10h2 = yato_5;
          muocthuongvndnhiemvu10h2 = muocthuong_vnd ;
        } else if (item['muc'] == 'Mức 3') {
          yato_4nhiemvu10h3 = yato_4;
          yato_5nhiemvu10h3 = yato_5;
          muocthuongvndnhiemvu10h3 = muocthuong_vnd;
        } else if (item['muc'] == 'Mức 4 - Idol ~') {
          yato_4nhiemvu10h4 = yato_4;
          yato_5nhiemvu10h4 = yato_5;
          muocthuongvndnhiemvu10h4 = muocthuong_vnd ;
        }
      }
    }

    print('yato_4nhiemvu5h1: $yato_4nhiemvu5h1');
    print('yato_5nhiemvu5h1: $yato_5nhiemvu5h1');
    print('muocthuongvndnhiemvu5h1: $muocthuongvndnhiemvu5h1');

    print('yato_4nhiemvu5h2: $yato_4nhiemvu5h2');
    print('yato_5nhiemvu5h2: $yato_5nhiemvu5h2');
    print('muocthuongvndnhiemvu5h2: $muocthuongvndnhiemvu5h2');

    print('yato_4nhiemvu5h3: $yato_4nhiemvu5h3');
    print('yato_5nhiemvu5h3: $yato_5nhiemvu5h3');
    print('muocthuongvndnhiemvu5h3: $muocthuongvndnhiemvu5h3');

    print('yato_4nhiemvu8h1: $yato_4nhiemvu8h1');
    print('yato_5nhiemvu8h1: $yato_5nhiemvu8h1');
    print('muocthuongvndnhiemvu8h1: $muocthuongvndnhiemvu8h1');

    print('yato_4nhiemvu8h2: $yato_4nhiemvu8h2');
    print('yato_5nhiemvu8h2: $yato_5nhiemvu8h2');
    print('muocthuongvndnhiemvu8h2: $muocthuongvndnhiemvu8h2');

    print('yato_4nhiemvu8h3: $yato_4nhiemvu8h3');
    print('yato_5nhiemvu8h3: $yato_5nhiemvu8h3');
    print('muocthuongvndnhiemvu8h3: $muocthuongvndnhiemvu8h3');

    print('yato_4nhiemvu8h4: $yato_4nhiemvu8h4');
    print('yato_5nhiemvu8h4: $yato_5nhiemvu8h4');
    print('muocthuongvndnhiemvu8h4: $muocthuongvndnhiemvu8h4');

    print('yato_4nhiemvu10h1: $yato_4nhiemvu10h1');
    print('yato_5nhiemvu10h1: $yato_5nhiemvu10h1');
    print('muocthuongvndnhiemvu10h1: $muocthuongvndnhiemvu10h1');

    print('yato_4nhiemvu10h2: $yato_4nhiemvu10h2');
    print('yato_5nhiemvu10h2: $yato_5nhiemvu10h2');
    print('muocthuongvndnhiemvu10h2: $muocthuongvndnhiemvu10h2');

    print('yato_4nhiemvu10h3: $yato_4nhiemvu10h3');
    print('yato_5nhiemvu10h3: $yato_5nhiemvu10h3');
    print('muocthuongvndnhiemvu10h3: $muocthuongvndnhiemvu10h3');

    print('yato_4nhiemvu10h4: $yato_4nhiemvu10h4');
    print('yato_5nhiemvu10h4: $yato_5nhiemvu10h4');
    print('muocthuongvndnhiemvu10h4: $muocthuongvndnhiemvu10h4');


    // Cập nhật lại giao diện khi có dữ liệu mới
    setState(() {});
  }


  final themedata = Get.put(DailozThemecontroler());



  List name = ["Thứ Hai 2024-01-01","ngày 2","ngày 3","ngày 4","ngày 5","ngày 6","ngày 7"];

  List name2 = ["test","Dữ liệu 2","Dữ liệu 3"];

  DateTime _getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

// Phương thức để lấy ngày cuối cùng của tuần
  DateTime _getEndOfWeek(DateTime date) {
    return date.add(Duration(days: 7 - date.weekday));
  }
  @override
  void initState() {
    super.initState();
    widget.startDateOfWeek = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    widget.endDateOfWeek = widget.startDateOfWeek.add(Duration(days: 6));
    fetchDataForWeek();

    DateTime startDate = DateTime.now().subtract(Duration(days: 30));
    selectedDate = DateTime.now();
    isselected = 30;
    _fetchData();
    _loadCaDangKiAdmin();
    _loadCaDangKiAdmin1();
  }










  DateTime selectedDate = DateTime.now();
  ScrollController scrollController = ScrollController();

  List<String> listOfDays = ["Thứ hai", "thứ ba", "Thứ Tư", "Thứ năm", "Thứ sáu", "Thứ 7	", "Chủ nhật"]; //List of Days

  late DateTime startDateOfWeek;
  late DateTime endDateOfWeek;


  Future<void> fetchDataForWeek() async {
    dataForSelectedWeek = await DatabaseHelper().fetchDataForWeek(
      widget.startDateOfWeek,
      widget.endDateOfWeek,




    );

    if (dataForSelectedWeek == null) {
      print('vclll');

    } else {
      // In kiểu dữ liệu của average_tilenhanchuyen và average_tilehoanthanhchuyen
      print('ảo thật');
    }

    setState(() {});
  }



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
            children: [

              SizedBox(height: height/26,),
              Row(
                children: [
                  Text("Thống kê tuần".tr,style: hsSemiBold.copyWith(fontSize: 24,color: DailozColor.yatogamineee),),
                  const Spacer(),
                  Image.asset(DailozPngimage.calendar,height: height/46,),
                  SizedBox(width: width/36,),
                  Text("Hiện tại "+DateFormat('dd/MM/yyyy').format(selectedDate),style: hsRegular.copyWith(fontSize: 12),),
                ],
              ),
              SizedBox(height: height/36,),

              SizedBox(
                height: height / 8.8,
                child: ListView.builder(
                  itemCount: 31,

                  controller: PageController(
                    initialPage: isselected,
                    viewportFraction: 0.3,
                  ),

                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DateTime startDate = DateTime.now().subtract(Duration(days: 30));
                    DateTime currentDate = startDate.add(Duration(days: index));
                    DateFormat dateFormat = DateFormat('dd/MM');

                    return InkWell(
                      onTap: () {
                        setState(() {
                          isselected = index;
                          selectedDate = DateTime.utc(currentDate.year, currentDate.month, currentDate.day);
                          updateSelectedWeek(DateTime.utc(currentDate.year, currentDate.month, currentDate.day));
                          fetchDataForWeek();


                          widget.startDateOfWeek =
                              widget.startDateOfWeek.subtract(Duration(days: 7));
                          widget.endDateOfWeek =
                              widget.startDateOfWeek.add(Duration(days: 6));




                        });
                      },
                      child: Container(
                        width: width / 7,
                        margin: EdgeInsets.only(bottom: width / 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isselected == index ? DailozColor.appcolor : DailozColor.transparent,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: height / 96),
                          child: Column(
                            children: [
                              Text(
                                listOfDays[currentDate.weekday - 1],
                                style: hsMedium.copyWith(
                                  fontSize: 16,
                                  color: isselected == index
                                      ? DailozColor.white
                                      : themedata.isdark
                                      ? DailozColor.white
                                      : DailozColor.black,
                                ),
                              ),
                              SizedBox(height: height / 96),
                              Text(
                                dateFormat.format(currentDate),
                                style: hsRegular.copyWith(
                                  fontSize: 14,
                                  color: isselected == index
                                      ? DailozColor.white
                                      : themedata.isdark
                                      ? DailozColor.white
                                      : DailozColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),








              SizedBox(height: height/36,),
              Row(
                children: [
                  Text("Dữ Liệu Tuần".tr,style: hsSemiBold.copyWith(fontSize: 24,color: DailozColor.tim),),
                  const Spacer(),
                    Text("Tuần hiện tại (${DateFormat('dd/MM/yyyy').format(_getStartOfWeek(selectedDate))} - ${DateFormat('dd/MM/yyyy').format(_getEndOfWeek(selectedDate))})",
                    style: hsRegular.copyWith(fontSize: 14,color: DailozColor.tim),
                  ),
                ],
              ),




              SizedBox(height: height/96,),
              if(name.isEmpty)...[
                Image.asset(DailozPngimage.emptytask,height: height/4,fit: BoxFit.fitHeight,),
                SizedBox(height: height/26,),
                Text("bạn không có dữ liệu trong ngày này!\nVui lòng kiểm tra lại.",textAlign: TextAlign.center,style: hsRegular.copyWith(fontSize: 14,),),
              ]else...[
                const Divider(color: DailozColor.textgray,),
                SizedBox(height: height/96,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height/46),
                      child: Text("7 Ngày",style: hsMedium.copyWith(fontSize: 14),),
                    ),
                    const Spacer(),



                    SizedBox(
                      height: height / 5.7,
                      width: width / 1.25,
                      child: FutureBuilder<List<Map<String, dynamic>>>(
                        future: DatabaseHelper().getAllLichSu(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            List<Map<String, dynamic>> lichSuData = snapshot.data ?? [];
                            List<String?> thulist = [];
                            List<String?> ngaylist = [];
                            List<String?> gioHoatDongList = [];
                            List<String?> diemNgayList = [];
                            List<String?> doanhThuNgayList = [];

                            // Lọc dữ liệu trong tuần
                            for (int i = 0; i <= 6; i++) {
                              DateTime currentDate = _getStartOfWeek(selectedDate).add(Duration(days: i));
                              String currentDateStr = DateFormat('yyyy-MM-dd').format(currentDate);

                              List<Map<String, dynamic>> filteredData =
                              lichSuData.where((item) => item['ngay'] == currentDateStr).toList();

                              if (filteredData.isNotEmpty) {
                                // Chuyển đổi giá trị kiểu int sang String
                                ngaylist.add(filteredData.first['ngay'].toString());
                                thulist.add(filteredData.first['thu'].toString());
                                gioHoatDongList.add(filteredData.first['thoigian_hd'].toString());
                                diemNgayList.add(filteredData.first['tong_diem'].toString());
                                doanhThuNgayList.add(filteredData.first['doanh_thungay'].toString());
                              } else {
                                print("không có dữ liẹu cho ngày: $currentDateStr");
                                // Thêm giá trị mặc định (có thể là '' hoặc null tùy vào yêu cầu)

                                ngaylist.add(null);
                                gioHoatDongList.add(null);
                                diemNgayList.add(null);
                                doanhThuNgayList.add(null);
                                thulist.add(null);


                              }
                            }










                            // Kiểm tra xem có dữ liệu trong tuần không
                            if (ngaylist.every((element) => element == null)) {
                              return Center(
                                child: Text('Không có dữ liệu trong tuần.'),
                              );
                            }

                            // Sử dụng ListView.builder để hiển thị dữ liệu
                            return ListView.builder(
                              itemCount: 7,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (ngaylist[index] == null) {
                                  // Trả về Container rỗng nếu không có dữ liệu cho ngày đó
                                  return Container();
                                }
                                return Container(
                                  width: width / 1.8,
                                  margin: EdgeInsets.only(right: width / 36),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: DailozColor.bggray,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 66),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              thulist[index]! + " "+  ngaylist[index]!,
                                              style: hsMedium.copyWith(fontSize: 16, color: DailozColor.yatogamineee),
                                            ),
                                            const Spacer(),
                                            SizedBox(
                                              height: height / 22,
                                              width: height / 26,
                                              child: PopupMenuButton<int>(
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    value: 1,
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          DailozPngimage.closeSquare,
                                                          height: height / 36,
                                                          color: DailozColor.black,
                                                        ),
                                                        SizedBox(
                                                          width: width / 36,
                                                        ),
                                                        Text(
                                                          "Test",
                                                          style: hsRegular.copyWith(fontSize: 16, color: DailozColor.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    value: 2,
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          DailozPngimage.editSquare,
                                                          height: height / 36,
                                                        ),
                                                        SizedBox(
                                                          width: width / 36,
                                                        ),
                                                        Text(
                                                          "chỉnh sửa",
                                                          style: hsRegular.copyWith(fontSize: 16, color: DailozColor.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    value: 3,
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          DailozPngimage.delete,
                                                          height: height / 36,
                                                        ),
                                                        SizedBox(
                                                          width: width / 36,
                                                        ),
                                                        Text(
                                                          "Xóa",
                                                          style: hsRegular.copyWith(fontSize: 16, color: DailozColor.black),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                                offset: const Offset(5, 50),
                                                color: DailozColor.white,
                                                constraints: BoxConstraints(
                                                  maxWidth: width / 2.8,
                                                ),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                                icon: Image.asset(
                                                  DailozPngimage.dot,
                                                  height: height / 36,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                                elevation: 2,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 200,
                                        ),
                                        Text(
                                          "Hoạt Động : "+gioHoatDongList[index]!,
                                          style: hsRegular.copyWith(fontSize: 14, color: DailozColor.tim),
                                        ),
                                        SizedBox(
                                          height: height / 66,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0x338F99EB),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 120),
                                                child: Text(
                                                  diemNgayList[index]!+" Điểm",
                                                  style: hsMedium.copyWith(fontSize: 10, color: DailozColor.xanh),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width / 36,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0x338F99EB),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 120),
                                                child: Text(
                                                  "Thu nhập "+doanhThuNgayList[index]!,
                                                  style: hsMedium.copyWith(fontSize: 10, color: DailozColor.red),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    )

















                  ],
                ),
                SizedBox(height: height/80,),
                Row(
                  children: [
                    Text("Chi Tiết Tuần".tr,style: hsSemiBold.copyWith(fontSize: 24,color: DailozColor.tim),),
                    const Spacer(),
                    Text("Thông tin ngày "+ DateFormat('dd/MM/yyyy').format(selectedDate),
                      style: hsRegular.copyWith(fontSize: 14,color: DailozColor.tim),
                    ),
                  ],
                ),
                SizedBox(height: height/80,),
                const Divider(color: DailozColor.textgray,),
                SizedBox(height: height/96,),
                SizedBox(
                  height: height/21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(2, (index) {
                      String labelText = "";
                      Color labelColor = Colors.black;
                      Color textColor = Colors.black;

                      switch(index) {
                        case 0:
                          labelText = "Cao điểm sáng : " + (dataForSelectedWeek?['total_cd_sang'] ?? '').toString();
                          labelColor = DailozColor.lightblue;
                          textColor = DailozColor.tim;
                          break;
                        case 1:
                          labelText = "Cao điểm Tối : " + (dataForSelectedWeek?['total_cd_toi'] ?? '').toString();
                          labelColor = DailozColor.lightred;
                          textColor = DailozColor.tim;
                          break;
                        case 2:
                          labelText = "Mục 3";
                          labelColor = const Color(0xffFFE9ED);
                          textColor = DailozColor.lightred;
                          break;
                        case 3:
                          labelText = "Mục 4";
                          labelColor = DailozColor.bgsky;
                          textColor = DailozColor.textblue;
                          break;
                        default:
                          break;
                      }

                      return Container(
                        margin: EdgeInsets.only(right: width/36),
                        height: height/22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: labelColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/20),
                            child: Text(labelText, style: hsRegular.copyWith(fontSize: 14, color: textColor)),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: height/36,),

                SizedBox(
                  height: height/21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(2, (index) {
                      String labelText = "";
                      Color labelColor = Colors.black;
                      Color textColor = Colors.black;

                      switch(index) {
                        case 0:
                          labelText = "Đơn Thường : "+ (dataForSelectedWeek?['total_don_thuong'] ?? '').toString();
                          labelColor = DailozColor.lightred;
                          textColor = DailozColor.tim;
                          break;
                        case 1:
                          labelText = "Tổng chuyến : "+ (dataForSelectedWeek?['total_tong_chuyen'] ?? '').toString();
                          labelColor = DailozColor.lightblue;
                          textColor = DailozColor.tim;
                          break;
                        case 2:
                          labelText = "Mục 3";
                          labelColor = const Color(0xffFFE9ED);
                          textColor = DailozColor.lightred;
                          break;
                        case 3:
                          labelText = "Mục 4";
                          labelColor = DailozColor.bgsky;
                          textColor = DailozColor.textblue;
                          break;
                        default:
                          break;
                      }

                      return Container(
                        margin: EdgeInsets.only(right: width/36),
                        height: height/22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: labelColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/20),
                            child: Text(labelText, style: hsRegular.copyWith(fontSize: 14, color: textColor)),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: height/36,),



                SizedBox(
                  height: height/21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(2, (index) {
                      String labelText = "";
                      Color labelColor = Colors.black;
                      Color textColor = Colors.black;

                      switch(index) {
                        case 0:
                          labelText = "Giao Hàng 1.5 : "+ (dataForSelectedWeek?['total_don_giaohang15'] ?? '').toString();
                          labelColor = DailozColor.lightblue;
                          textColor = DailozColor.tim;
                          break;
                        case 1:
                          labelText = "Giao Hàng 2.0 : "+ (dataForSelectedWeek?['total_don_giaohang20'] ?? '').toString();



                          labelColor = DailozColor.lightred;
                          textColor = DailozColor.tim;

                          break;
                        case 2:
                          labelText = "Mục 3";
                          labelColor = const Color(0xffFFE9ED);
                          textColor = DailozColor.lightred;
                          break;
                        case 3:
                          labelText = "Mục 4";
                          labelColor = DailozColor.bgsky;
                          textColor = DailozColor.textblue;
                          break;
                        default:
                          break;
                      }

                      return Container(
                        margin: EdgeInsets.only(right: width/36),
                        height: height/22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: labelColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/20),
                            child: Text(labelText, style: hsRegular.copyWith(fontSize: 14, color: textColor)),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: height/36,),



                SizedBox(
                  height: height/21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(2, (index) {
                      String labelText = "";
                      Color labelColor = Colors.black;
                      Color textColor = Colors.black;

                      switch(index) {
                        case 0:
                          double averageTileHoanThanhChuyen = (dataForSelectedWeek?['average_tilehoanthanhchuyen'] ?? 0).toDouble();
                          String formattedAverageTileHoanThanhChuyen = averageTileHoanThanhChuyen.toStringAsFixed(1); // Làm tròn giá trị đến 1 chữ số sau dấu chấm
                          labelText = "Tỉ lệ Hoàn Thành : $formattedAverageTileHoanThanhChuyen%";
                          labelColor = DailozColor.lightred;
                          textColor = DailozColor.tim;
                          break;
                        case 1:
                          double averageTileHoanThanhChuyen = (dataForSelectedWeek?['average_tilenhanchuyen'] ?? 0).toDouble();
                          String formattedAverageTileHoanThanhChuyen = averageTileHoanThanhChuyen.toStringAsFixed(1); // Làm tròn giá trị đến 1 chữ số sau dấu chấm
                          labelText = "Tỉ lệ Nhận chuyến : $formattedAverageTileHoanThanhChuyen%";

                          labelColor = DailozColor.lightblue;
                          textColor = DailozColor.tim;
                          break;
                        case 2:
                          labelText = "Mục 3";
                          labelColor = const Color(0xffFFE9ED);
                          textColor = DailozColor.lightred;
                          break;
                        case 3:
                          labelText = "Mục 4";
                          labelColor = DailozColor.bgsky;
                          textColor = DailozColor.textblue;
                          break;
                        default:
                          break;
                      }

                      return Container(
                        margin: EdgeInsets.only(right: width/36),
                        height: height/22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: labelColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/20),
                            child: Text(labelText, style: hsRegular.copyWith(fontSize: 14, color: textColor)),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: height/36,),


                if (khuvuc == "mienam" || khuvuc == "danang")
                  SizedBox(
                  height: height/21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Đặt giá trị MainAxisAlignment.center ở đây
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: width/36),
                        height: height/22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: DailozColor.bgred,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/20),
                            child: Text(
                              thuonghcmvadanang(
                                dataForSelectedWeek!['total_tong_diem'],
                                dataForSelectedWeek!['ca_dangkiadmin'],
                                dataForSelectedWeek!['average_tilenhanchuyen'].toDouble().toInt(),
                                dataForSelectedWeek!['average_tilehoanthanhchuyen'].toDouble().toInt(),
                              ),
                              style: hsRegular.copyWith(fontSize: 14,color: DailozColor.yatogamineee),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (khuvuc == "hanoi")
                  SizedBox(
                    height: height/21,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Đặt giá trị MainAxisAlignment.center ở đây
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: width/36),
                          height: height/22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: DailozColor.bgred,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width/20),
                              child: Text(
                                thuonghanoi(
                                  dataForSelectedWeek!['total_tong_diem'],
                                  dataForSelectedWeek!['ca_dangkiadmin'],
                                  dataForSelectedWeek!['average_tilenhanchuyen'].toDouble().toInt(),
                                  dataForSelectedWeek!['average_tilehoanthanhchuyen'].toDouble().toInt(),
                                ),
                                style: hsRegular.copyWith(fontSize: 14,color: DailozColor.yatogamineee),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                SizedBox(height: height/36,),


                if (khuvuc == "danang" || khuvuc == "miennam")
                SizedBox(
                  height: height/21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Đặt giá trị MainAxisAlignment.center ở đây
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: width/36),
                        height: height/22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: DailozColor.bgred,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/20),
                            child: Text(
                              thongdiephcmvadanang(
                                dataForSelectedWeek!['total_tong_diem'],
                                dataForSelectedWeek!['ca_dangkiadmin'],
                                dataForSelectedWeek!['average_tilenhanchuyen'].toDouble().toInt(),
                                dataForSelectedWeek!['average_tilehoanthanhchuyen'].toDouble().toInt(),
                              ),
                              style: hsRegular.copyWith(fontSize: 14,color: DailozColor.yatogamineee),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (khuvuc == "hanoi")
                  SizedBox(
                    height: height/21,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Đặt giá trị MainAxisAlignment.center ở đây
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: width/36),
                          height: height/22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: DailozColor.bgred,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width/20),
                              child: Text(
                                thongdiephanoi(
                                  dataForSelectedWeek!['total_tong_diem'],
                                  dataForSelectedWeek!['ca_dangkiadmin'],
                                  dataForSelectedWeek!['average_tilenhanchuyen'].toDouble().toInt(),
                                  dataForSelectedWeek!['average_tilehoanthanhchuyen'].toDouble().toInt(),
                                ),
                                style: hsRegular.copyWith(fontSize: 14,color: DailozColor.yatogamineee),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: height/36,),
                SizedBox(
                  height: height/21,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Đặt giá trị MainAxisAlignment.center ở đây
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: width/36),
                        height: height/22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: DailozColor.bgred,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/20),
                            child: Text(
                              yatogami == "5h"
                                  ? "Vượt Chuyến + Thưởng cao điểm : " +
                                  formatCurrency(dataForSelectedWeek?['total_vuot_chuyen'].toString() ?? '') +
                                  " và " +
                                  formatCurrency(dataForSelectedWeek?['total_cd_sang_toi_sum'].toString() ?? '') +
                                  "đ"
                                  : "Thưởng Vượt Chuyến : " +
                                  formatCurrency(dataForSelectedWeek?['total_vuot_chuyen'].toString() ?? '') +
                                  "đ",
                              style: hsRegular.copyWith(fontSize: 14, color: DailozColor.tim),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),



                SizedBox(height: height/36,),
                Row(
                  children: [
                    Container(
                      width: width / 2.2,
                      decoration: BoxDecoration(
                        color: DailozColor.lightgreenbg,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 56),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Tổng Điểm Tuần".tr,
                                style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                (dataForSelectedWeek?['total_tong_diem'] ?? '').toString()+"Điểm",
                                style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: width / 2.2,
                      decoration: BoxDecoration(
                        color: DailozColor.lightgreenbg,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 56),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Thu nhập".tr,
                                style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                thunhap(dataForSelectedWeek?['total_doanh_thungay'].toString() ?? '')+"đ" ,
                                style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height/36,),
                Row(
                  children: [
                    if (khuvuc == "miennam")
                      Container(
                        width: width / 2.2,
                        decoration: BoxDecoration(
                          color: DailozColor.lightgreenbg,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 56),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Đảm bảo thu nhập".tr,
                                  style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  formatCurrency(dataForSelectedWeek?['total_db_thunhap'].toString() ?? '') + "đ",
                                  style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (khuvuc != "miennam")
                      Container(
                        width: width / 2.2,
                        decoration: BoxDecoration(
                          color: DailozColor.lightgreenbg,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 56),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Hoạt Động".tr,
                                  style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  convertToDayHourMinute((dataForSelectedWeek?['total_thoigian_hd'] ?? 0).toDouble()),
                                  style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const Spacer(),


                    if (khuvuc == "miennam")
                    Container(
                      width: width / 2.2,
                      decoration: BoxDecoration(
                        color: DailozColor.lightgreenbg,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 56),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Tổng Doanh Thu".tr,
                                style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                sumFormattedCurrency(
                                    dataForSelectedWeek?['total_sum'].toString() ?? '',
                                    (dataForSelectedWeek?['total_doanh_thungay'].toString() ?? '')) + "đ",
                                style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    if (khuvuc == "hanoi")
                      Container(
                        width: width / 2.2,
                        decoration: BoxDecoration(
                          color: DailozColor.lightgreenbg,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 56),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Tổng Doanh Thu".tr,
                                  style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,

                                child: Text(
                                  yatogami == "5h"
                                      ? yatogamit(
                                      dataForSelectedWeek?['total_vuot_chuyen'].toString() ?? '',
                                      dataForSelectedWeek?['total_doanh_thungay'].toString() ?? '',
                                      dataForSelectedWeek?['total_cd_sang_toi_sum'].toString() ?? ''
                                  ) + "đ"
                                      : sumFormattedCurrency(
                                      dataForSelectedWeek?['total_vuot_chuyen'].toString() ?? '',
                                      dataForSelectedWeek?['total_doanh_thungay'].toString() ?? ''
                                  ) + "đ",
                                  style: hsRegular.copyWith(fontSize: 14, color: DailozColor.tim),
                                ),







                              ),
                            ],
                          ),
                        ),
                      ),

                    if (khuvuc == "danang")
                      Container(
                        width: width / 2.2,
                        decoration: BoxDecoration(
                          color: DailozColor.lightgreenbg,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 56),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Tổng Doanh Thu".tr,
                                  style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  sumFormattedCurrency(
                                      dataForSelectedWeek?['total_vuot_chuyen'].toString() ?? '',
                                      (dataForSelectedWeek?['total_doanh_thungay'].toString() ?? '')) + "đ",
                                  style: hsMedium.copyWith(fontSize: 18, color: DailozColor.tim),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),






              ]
            ],
          ),
        ),
      ),
    );
  }









  String convertToDayHourMinute(double totalHours) {
    int days = (totalHours / 24).floor();
    int remainingHours = (totalHours % 24).floor();
    int minutes = ((totalHours - days * 24 - remainingHours) * 60).toInt();
    return '${days > 0 ? '$days Ngày ' : ''}$remainingHours Giờ $minutes Phút';
  }





  void updateSelectedWeek(DateTime newSelectedDate) {
    startDateOfWeek = _getStartOfWeek(newSelectedDate);
    endDateOfWeek = _getEndOfWeek(newSelectedDate);
    selectedDate = newSelectedDate;

    widget.startDateOfWeek = startDateOfWeek;  // Thêm dòng này
    widget.endDateOfWeek = endDateOfWeek;  // Thêm dòng này
    print('ngày bắt đầu:'+widget.startDateOfWeek.toString());
    print('ngày kết thúc:'+widget.endDateOfWeek.toString());


    fetchDataForWeek();
  }





  String thuonghanoi(double  totalTongDiem, String caDangKi, int averageTilenhanchuyen, int averageTilehoanthanhchuyen) {
    if (averageTilenhanchuyen == null || averageTilehoanthanhchuyen == null) {
      return 'Không đạt điều kiện thưởng';
    }

    if (averageTilenhanchuyen < 90 || averageTilehoanthanhchuyen < 90) {
      return 'Không đạt điều kiện thưởng';
    }

    if (caDangKi.contains('5h')) {
      if (totalTongDiem < yato_4nhiemvu5h1) {
        return 'Chưa có thưởng';
      } else if (totalTongDiem >= yato_4nhiemvu5h1 && totalTongDiem <= yato_5nhiemvu5h1) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu5h1;
      } else if (totalTongDiem >= yato_4nhiemvu5h2 && totalTongDiem <= yato_5nhiemvu5h2) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu5h2;
      }
      else if (totalTongDiem >= yato_4nhiemvu5h3 && totalTongDiem <= yato_5nhiemvu5h3){
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu5h3;
      }
    else
      {
        return 'chịu idol hack rồi';
      }
    }

    else if (caDangKi.contains('8h')) {
      if (totalTongDiem < yato_4nhiemvu8h1) {
        return 'Chưa có thưởng';
      } else if (totalTongDiem >= yato_4nhiemvu8h1 && totalTongDiem <= yato_5nhiemvu8h1) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu8h1;
      } else if (totalTongDiem >= yato_4nhiemvu8h2 && totalTongDiem <= yato_5nhiemvu8h2) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu8h2;
      } else if (totalTongDiem >= yato_4nhiemvu8h3 && totalTongDiem <= yato_5nhiemvu8h3) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu8h3;
      } else if (totalTongDiem >= yato_4nhiemvu8h4 && totalTongDiem <= yato_5nhiemvu8h4) {

          return 'Thưởng hiện tại: '+muocthuongvndnhiemvu8h4;
      }
    else
      {
        return 'chịu idol hack rồi';
      }
    }
    else if  (caDangKi.contains('10h')) {
        if (totalTongDiem < yato_4nhiemvu10h1) {
          return 'Chưa có thưởng';
        } else if (totalTongDiem >= yato_4nhiemvu10h1 && totalTongDiem <= yato_5nhiemvu10h1) {
          return 'Thưởng hiện tại: '+muocthuongvndnhiemvu10h1;
        } else if (totalTongDiem >= yato_4nhiemvu10h2 && totalTongDiem <= yato_5nhiemvu10h2) {
          return 'Thưởng hiện tại: '+muocthuongvndnhiemvu10h2;
        } else if (totalTongDiem >= yato_4nhiemvu10h3 && totalTongDiem <= yato_5nhiemvu10h3) {
          return 'Thưởng hiện tại: '+muocthuongvndnhiemvu10h3;
        } else if (totalTongDiem >= yato_4nhiemvu10h4 && totalTongDiem <= yato_5nhiemvu10h4) {
          return 'Thưởng hiện tại: '+muocthuongvndnhiemvu10h4;
        }
      } else {
        return ''; // Xử lý trường hợp khác nếu cần
      }
      return ''; // Xử lý trường hợp khác nếu cần
  }






  String thuonghcmvadanang(double  totalTongDiem, String caDangKi, int averageTilenhanchuyen, int averageTilehoanthanhchuyen) {
    if (averageTilenhanchuyen == null || averageTilehoanthanhchuyen == null) {
      return 'Không đạt điều kiện thưởng';
    }

    if (averageTilenhanchuyen < 90 || averageTilehoanthanhchuyen < 90) {
      return 'Không đạt điều kiện thưởng';
    }

    if (caDangKi.contains('5h')) {
      if (totalTongDiem < yato_4nhiemvu5h1) {
        return 'Chưa có thưởng';
      } else if (totalTongDiem >= yato_4nhiemvu5h1 && totalTongDiem <= yato_5nhiemvu5h1) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu5h1;
      } else if (totalTongDiem >= yato_4nhiemvu5h2 && totalTongDiem <= yato_5nhiemvu5h2) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu5h2;
      }
      else if (totalTongDiem >= yato_4nhiemvu5h3 && totalTongDiem <= yato_5nhiemvu5h3){
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu5h3;
      }
      else
      {
        return 'chịu idol hack rồi';
      }
    }

    else if (caDangKi.contains('8h')) {
      if (totalTongDiem < yato_4nhiemvu8h1) {
        return 'Chưa có thưởng';
      } else if (totalTongDiem >= yato_4nhiemvu8h1 && totalTongDiem <= yato_5nhiemvu8h1) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu8h1;
      } else if (totalTongDiem >= yato_4nhiemvu8h2 && totalTongDiem <= yato_5nhiemvu8h2) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu8h2;
      } else if (totalTongDiem >= yato_4nhiemvu8h3 && totalTongDiem <= yato_5nhiemvu8h3) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu8h3;
      }
      else
      {
        return 'chịu idol hack rồi';
      }
    }
    else if  (caDangKi.contains('10h')) {
      if (totalTongDiem < yato_4nhiemvu10h1) {
        return 'Chưa có thưởng';
      } else if (totalTongDiem >= yato_4nhiemvu10h1 && totalTongDiem <= yato_5nhiemvu10h1) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu10h1;
      } else if (totalTongDiem >= yato_4nhiemvu10h2 && totalTongDiem <= yato_5nhiemvu10h2) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu10h2;
      } else if (totalTongDiem >= yato_4nhiemvu10h3 && totalTongDiem <= yato_5nhiemvu10h3) {
        return 'Thưởng hiện tại: '+muocthuongvndnhiemvu10h3;
      }
    } else {
      return ''; // Xử lý trường hợp khác nếu cần
    }
    return ''; // Xử lý trường hợp khác nếu cần
  }














  String sumFormattedCurrency(String value1, String value2) {
    // Sử dụng NumberFormat để định dạng số thành chuỗi có dấu phẩy
    final currencyFormat = NumberFormat('#,##0', 'vi_VN');

    // Chuyển đổi chuỗi số thành số thực và cộng chúng lại với nhau
    final double doubleValue1 = double.tryParse(value1) ?? 0;
    final double doubleValue2 = (double.tryParse(value2) ?? 0) * 0.73;

    final double sum = doubleValue1 + doubleValue2;

    // Định dạng kết quả thành chuỗi với dấu phẩy
    return currencyFormat.format(sum);
  }

  String yatogamit(String value1, String value2,String value3) {
    // Sử dụng NumberFormat để định dạng số thành chuỗi có dấu phẩy
    final currencyFormat = NumberFormat('#,##0', 'vi_VN');

    // Chuyển đổi chuỗi số thành số thực và cộng chúng lại với nhau
    final double doubleValue1 = double.tryParse(value1) ?? 0;
    final double doubleValue2 = (double.tryParse(value2) ?? 0) * 0.73;
    final double doubleValue3 = double.tryParse(value3) ?? 0;
    final double sum = doubleValue1 + doubleValue2 +doubleValue3;

    // Định dạng kết quả thành chuỗi với dấu phẩy
    return currencyFormat.format(sum);
  }

  String thunhap(String value) {
    // Sử dụng NumberFormat để định dạng số thành chuỗi có dấu phẩy
    final currencyFormat = NumberFormat('#,##0', 'vi_VN');

    // Chuyển đổi chuỗi số thành số thực và nhân với 0.73
    final double doubleValue = (double.tryParse(value) ?? 0) * 0.73;

    // Định dạng số thành chuỗi với dấu phẩy
    return currencyFormat.format(doubleValue);
  }



  String formatCurrency(String value) {
    // Sử dụng NumberFormat để định dạng số thành chuỗi có dấu phẩy
    final currencyFormat = NumberFormat('#,##0', 'vi_VN');

    // Chuyển đổi chuỗi số thành số nguyên
    final intValue = int.parse(value);

    // Định dạng số thành chuỗi với dấu phẩy
    return currencyFormat.format(intValue);
  }

  String thongdiephanoi(double  totalTongDiem, String caDangKi, int averageTilenhanchuyen, int averageTilehoanthanhchuyen) {
    if (averageTilenhanchuyen == null || averageTilehoanthanhchuyen == null) {
      return 'Không đạt điều kiện thưởng';
    }

    int averageTilenhanchuyenDouble = averageTilenhanchuyen;
    int averageTilehoanthanhchuyenDouble = averageTilehoanthanhchuyen;

    if (averageTilenhanchuyenDouble < 90 || averageTilehoanthanhchuyenDouble < 90) {
      return 'Không đạt điều kiện thưởng';
    }
    if (caDangKi.contains('5h')) {
      if (totalTongDiem < yato_4nhiemvu5h1) {
        return 'Còn Thiếu ${yato_4nhiemvu5h1 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu5h1;
      } else if (totalTongDiem >= yato_4nhiemvu5h1 && totalTongDiem < yato_5nhiemvu5h1) {
        return 'Còn Thiếu ${yato_5nhiemvu5h1 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu5h2;
      } else if (totalTongDiem >= yato_4nhiemvu5h2 && totalTongDiem < yato_5nhiemvu5h2) {
        return 'Còn Thiếu ${yato_4nhiemvu5h3 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu5h3;
      } else {
        return 'Thưởng hiện tại : '+muocthuongvndnhiemvu5h3 + " (tối đa)";
      }
    } else if (caDangKi.contains('8h') ) {
      if (totalTongDiem < yato_4nhiemvu8h1) {
        return 'Còn Thiếu ${yato_4nhiemvu8h1 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu8h1;
      } else if (totalTongDiem >= yato_4nhiemvu8h1 && totalTongDiem < yato_4nhiemvu8h2) {
        return 'Còn Thiếu ${yato_4nhiemvu8h2 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu8h2;
      } else if (totalTongDiem >= yato_4nhiemvu8h2 && totalTongDiem < yato_4nhiemvu8h3) {
        return 'Còn Thiếu ${yato_4nhiemvu8h3 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu8h3;
      }
      else if (totalTongDiem >= yato_4nhiemvu8h3 && totalTongDiem < yato_4nhiemvu8h4) {
        return 'Còn Thiếu ${yato_4nhiemvu8h4 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu8h4;
      }
      else {
        return 'Thưởng hiện tại : '+muocthuongvndnhiemvu8h4 +"(tối đa)";
      }
    } else {


     if (caDangKi.contains('10h')) {
    if (totalTongDiem < yato_4nhiemvu10h1) {
    return 'Còn Thiếu ${yato_4nhiemvu10h1 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu10h1;
    } else if (totalTongDiem >= yato_4nhiemvu10h1 && totalTongDiem < yato_4nhiemvu10h2) {
    return 'Còn Thiếu ${180 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu10h2;
    }
    else if (totalTongDiem >= yato_4nhiemvu10h2 && totalTongDiem <= yato_4nhiemvu10h3) {
    return 'Còn Thiếu ${yato_4nhiemvu10h3 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu10h3;
    }
    else if (totalTongDiem >= yato_4nhiemvu10h3 && totalTongDiem <= yato_4nhiemvu10h4) {
      return 'Còn Thiếu ${yato_4nhiemvu10h4 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu10h4;
    }

    else {
    return 'Thưởng hiện tại : '+muocthuongvndnhiemvu10h4+"(tối đa)";
    }
    }


      return ''; // Xử lý trường hợp khác nếu cần
    }
  }

  String thongdiephcmvadanang(double  totalTongDiem, String caDangKi, int averageTilenhanchuyen, int averageTilehoanthanhchuyen) {
    if (averageTilenhanchuyen == null || averageTilehoanthanhchuyen == null) {
      return 'Không đạt điều kiện thưởng';
    }

    int averageTilenhanchuyenDouble = averageTilenhanchuyen;
    int averageTilehoanthanhchuyenDouble = averageTilehoanthanhchuyen;

    if (averageTilenhanchuyenDouble < 90 || averageTilehoanthanhchuyenDouble < 90) {
      return 'Không đạt điều kiện thưởng';
    }
    if (caDangKi.contains('5h')) {
      if (totalTongDiem < yato_4nhiemvu5h1) {
        return 'Còn Thiếu ${yato_4nhiemvu5h1 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu5h1;
      } else if (totalTongDiem >= yato_4nhiemvu5h1 && totalTongDiem < yato_5nhiemvu5h1) {
        return 'Còn Thiếu ${yato_5nhiemvu5h1 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu5h2;
      } else if (totalTongDiem >= yato_4nhiemvu5h2 && totalTongDiem < yato_5nhiemvu5h2) {
        return 'Còn Thiếu ${yato_4nhiemvu5h3 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu5h3;
      } else {
        return 'Thưởng hiện tại : '+muocthuongvndnhiemvu5h3 + " (tối đa)";
      }
    } else if (caDangKi.contains('8h') ) {
      if (totalTongDiem < yato_4nhiemvu8h1) {
        return 'Còn Thiếu ${yato_4nhiemvu8h1 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu8h1;
      } else if (totalTongDiem >= yato_4nhiemvu8h1 && totalTongDiem < yato_4nhiemvu8h2) {
        return 'Còn Thiếu ${yato_4nhiemvu8h2 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu8h2;
      } else if (totalTongDiem >= yato_4nhiemvu8h2 && totalTongDiem < yato_4nhiemvu8h3) {
        return 'Còn Thiếu ${yato_4nhiemvu8h3 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu8h3;
      }

      else {
        return 'Thưởng hiện tại : '+muocthuongvndnhiemvu8h3 +"(tối đa)";
      }
    } else {


      if (caDangKi.contains('10h')) {
        if (totalTongDiem < yato_4nhiemvu10h1) {
          return 'Còn Thiếu ${yato_4nhiemvu10h1 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu10h1;
        } else if (totalTongDiem >= yato_4nhiemvu10h1 && totalTongDiem < yato_4nhiemvu10h2) {
          return 'Còn Thiếu ${180 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu10h2;
        }
        else if (totalTongDiem >= yato_4nhiemvu10h2 && totalTongDiem <= yato_4nhiemvu10h3) {
          return 'Còn Thiếu ${yato_4nhiemvu10h3 - totalTongDiem} điểm để đạt mốc '+muocthuongvndnhiemvu10h3;
        }

        else {
          return 'Thưởng hiện tại : '+muocthuongvndnhiemvu10h3+"(tối đa)";
        }
      }


      return ''; // Xử lý trường hợp khác nếu cần
    }
  }


}