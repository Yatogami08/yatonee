import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_color.dart';
import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_fontstyle.dart';
import 'package:dailoz/dailoz/yatogami_gloabelclass/yatogami_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../database.dart';
import '../yatogami_task/yatogami_taskdetail.dart';
import 'yatogami_addpersonal.dart';

class nhiemvutuan extends StatefulWidget {
  const nhiemvutuan({Key? key}) : super(key: key);

  @override
  State<nhiemvutuan> createState() => _DailozWorkState();
}

class _DailozWorkState extends State<nhiemvutuan> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  late int soluongnhiemvu = 0;
  String khuvuc = '';

  @override
  void initState() {
    super.initState();
    _laySoLuongNhiemVuhn();
    laykhuvuc();
  }


  Future<void> laykhuvuc() async {
    String? caDangKiAdmin = await DatabaseHelper().getCalkhuvuc();
    if (caDangKiAdmin != null) {
      setState(() {
        khuvuc = caDangKiAdmin;
      });
    }
  }

  Future<void> _laySoLuongNhiemVuhn() async {
    String? caDangKiAdmin = await DatabaseHelper().getCaDangKiAdmin();
    String? khuvuc = await DatabaseHelper().getCalkhuvuc();

    print('khuvuc: $khuvuc, caDangKiAdmin: $caDangKiAdmin'); // Thêm log để hiển thị giá trị của khuvuc và caDangKiAdmin

    if (khuvuc == 'hanoi' && caDangKiAdmin == '5h') {
      setState(() {
        soluongnhiemvu = 3;
      });
    } else if (khuvuc == 'hanoi' && (caDangKiAdmin == '8h' || caDangKiAdmin == '10h')) {
      setState(() {
        soluongnhiemvu = 4;
      });
    } else if (khuvuc == 'danang' && caDangKiAdmin == '5h') {
      setState(() {
        soluongnhiemvu = 3;
      });
    } else if (khuvuc == 'danang' &&  (caDangKiAdmin == '8h' || caDangKiAdmin == '10h')) {
      setState(() {
        soluongnhiemvu = 3;
      });
    } else if (khuvuc == 'miennam' && caDangKiAdmin == '5h') {
      setState(() {
        soluongnhiemvu = 3;
      });
    } else if (khuvuc == 'miennam' &&  (caDangKiAdmin == '8h' || caDangKiAdmin == '10h')) {
      setState(() {
        soluongnhiemvu = 3;
      });
    } else {
      setState(() {
        soluongnhiemvu = 4;
      });
    }
  }








  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            splashColor: DailozColor.transparent,
            highlightColor: DailozColor.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height/20,
              width: height/20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: DailozColor.white,
                  boxShadow: const [
                    BoxShadow(color: DailozColor.textgray,blurRadius: 5)
                  ]
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width/56),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: DailozColor.black,
                ),
              ),
            ),
          ),
        ),
        title:  Text("Work".tr,style: hsSemiBold.copyWith(fontSize: 18),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width/1.35,
                    child: TextFormField(
                        cursorColor: DailozColor.black,
                        style: hsMedium.copyWith(fontSize: 16,color: DailozColor.textgray),
                        decoration: InputDecoration(
                          hintText: 'Search for task'.tr,
                          filled: true,
                          fillColor: DailozColor.bggray,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 22,
                            color: DailozColor.grey,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Container(
                              height: height/96,
                              width: height/96,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: DailozColor.textgray
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 12,
                                color: DailozColor.white,
                              ),
                            ),
                          ),
                          hintStyle: hsMedium.copyWith(fontSize: 16,color: DailozColor.textgray),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                        )),
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: DailozColor.transparent,
                    highlightColor: DailozColor.transparent,
                    onTap: () {
                      // filter();
                    },
                    child: Container(
                        height: height/13,
                        width: height/13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: DailozColor.bggray,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Image.asset(DailozPngimage.filter,height: height/36,),
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/36,),
              ListView.builder(
                itemCount: soluongnhiemvu, // Hiển thị tối đa 4 dữ liệu gần đây nhất
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // Lấy dữ liệu từ cơ sở dữ liệu (sử dụng FutureBuilder)


                  return FutureBuilder<Map<String, dynamic>>(
                    future: DatabaseHelper().laydulieunhiemvuhanoi(index),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data = snapshot.data!;
                          int id = data['id']; // Lấy ID của mục
                          print('ID của mục thứ $index: $id'); // In ID của mục vào log

                          String date = data['ca_dangki'] ?? '';
                          String thu = data['muc'] ?? '';
                          String diemtrungbinh = data['diemtrungbinh'] ?? '';
                          String activityDuration = data['diemthuong'] ?? '';
                          String caDangKi = data['ca_dangki'] ?? '';
                          String muocthuongvnd = data['muocthuongvnd'] ?? '';
                          String yato_3 = data['yato_3'] ?? '';
                          if (date.isNotEmpty) {
                            return InkWell(
                              splashColor: DailozColor.transparent,
                              highlightColor: DailozColor.transparent,
                              onTap: () async {
                                // Lấy id của item được bấm
                                int id = data['id'];
                                print('Item được bấm: $id');

                                await DatabaseHelper().capNhatYato3(id, 'dadangki');
                                print('yato_3 của item được bấm đã được cập nhật thành dadangki');

// Lấy số lượng mục trong cơ sở dữ liệu
                                int itemCount = 11; // Đặt số lượng mục tương ứng với số lượng mục trong cơ sở dữ liệu

// Cập nhật yato_3 của tất cả các mục ngoại trừ mục được bấm thành 'chuadangki'
                                for (int i = 1; i <= itemCount; i++) {
                                  if (i != id) {
                                    await DatabaseHelper().capNhatYato3(i, 'chuadangki');
                                    print('yato_3 của item $i đã được cập nhật thành chuadangki');
                                  }
                                }

                                setState(() {});


                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: height / 46),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: DailozColor.bggray,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width / 36,
                                    vertical: height / 66,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Thưởng Điểm Tuần $thu ${yato_3 == 'dadangki' ? ' - Đã đăng kí' : ''}",
                                            style: hsMedium.copyWith(fontSize: 16, color: DailozColor.black),
                                          ),                                          const Spacer(),
                                          Image.asset(DailozPngimage.dot, height: height / 36),
                                        ],
                                      ),
                                      SizedBox(height: height / 200),
                                      Text("Yêu cầu : $activityDuration", style: hsRegular.copyWith(fontSize: 14, color: DailozColor.textgray)),
                                      SizedBox(height: height / 66),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x338F99EB),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 120),
                                              child: Text("Đại sứ $caDangKi", style: hsMedium.copyWith(fontSize: 10, color: DailozColor.red)),
                                            ),
                                          ),
                                          SizedBox(width: width / 36),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x338F99EB),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 120),
                                              child: Text("$muocthuongvnd/Tuần", style: hsMedium.copyWith(fontSize: 10, color: DailozColor.tim)),
                                            ),
                                          ),

                                          SizedBox(width: width / 36),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x338F99EB),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 120),
                                              child: Text("$diemtrungbinh/Ngày", style: hsMedium.copyWith(fontSize: 10, color: DailozColor.xanh)),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(); // Trả về một Container rỗng nếu không có dữ liệu
                          }
                        } else {
                          return Container(); // Trả về một Container rỗng nếu không có dữ liệu
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  );





                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DailozColor.appcolor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DailozAddPersonal("work");
          },));
        },
        child: const Icon(Icons.add,size: 22,color: DailozColor.white,),
      ),
    );
  }




}
