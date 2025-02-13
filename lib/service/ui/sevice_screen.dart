import 'package:flutter/material.dart';
import 'package:untitled/service/ui/widgets/multi_image_piker.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/problem_description_text_filed.dart';

class ServiceScreen extends StatelessWidget {
  ServiceScreen({super.key});

  var timecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          color: const Color(0xFF45404a),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              children: [
                MultiImagePickerBox(),
                SizedBox(height: 15.0),
                ProblemDescriptionTextField(
                  maxLines: 5,
                  hint: 'تفاصيل المشكلة',
                ),
                SizedBox(height: 15.0),
                ProblemDescriptionTextField(
                  hint: 'وقت حدوث المشكله',
                  controller: timecontroller,
                  ontap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      timecontroller.text = value!.format(context).toString();
                      print(value.format(context).toString());
                    });
                  },
                  suffix: Icon(Icons.watch_later_outlined),
                  suffixcolor: Colors.red,
                ),
                SizedBox(height: 15.0),
                ProblemDescriptionTextField(
                  hint: 'العنوان الى حدث فيه المشكلة',
                  suffix: Icon(Icons.maps_home_work_outlined),
                  suffixcolor: Colors.red,
                ),
                SizedBox(height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: MaterialButton(
                    onPressed: () {},
                    height: 50.0,
                    child: Text(
                      'تأكيد الطلب ',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Navigator.push(context,
//    MaterialPageRoute(
//      builder:(context)=>
//
//      ) ,
//   ),
// )
