// @dart=2.9
import 'package:blnk_demo/pages/custom_widget/custom_button.dart';
import 'package:blnk_demo/pages/register/ui/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children:  [
              SizedBox(height: MediaQuery.of(context).size.height *.15,),
              const Text(
                "Success!",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
               SizedBox(height: MediaQuery.of(context).size.height *.04,),
              const Text(
                "data uploaded successfully",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height *.15,),
              Container(
                height: MediaQuery.of(context).size.height *.15,
                width: MediaQuery.of(context).size.height *.2,
                decoration:  BoxDecoration(
                  // Circle shape
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  // The border you want
                  border: Border.all(
                    width: 2.0,
                    color: Colors.orange,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                    child: Icon(Icons.check,color: Colors.orange,size: 50,)
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height *.2,),
              CustomButton(
                text: "Continue",
                onPress: (){
                  Get.offAll(()=> RegisterView());
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
