import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:unit9_1/model/student.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input temp.'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form( key: formKey,
          child: 
         SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ชื่อ', style: TextStyle(fontSize: 20),),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนชื่อ"),
                onSaved: (value){
                  myStudent.fname =value;
                },
              ),
              SizedBox(height: 15,),
              Text('นามสกุล', style: TextStyle(fontSize: 20),),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนนามสกุล"),
                onSaved: (value){
                  myStudent.lname =value;
                },
              ),
              SizedBox(height: 15,),
              Text('อีเมล', style: TextStyle(fontSize: 20),),
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: "กรุณาป้อนอีเมล"),
                  EmailValidator(errorText: "อีเมลไม่ถูกต้อง")
                ]) ,
                
                onSaved:  (value){
                  myStudent.email = value;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15,),
              Text('อุณหภูมิ', style: TextStyle(fontSize: 20),),
              TextFormField(
                validator: RequiredValidator(errorText: "กรุณาป้อนอุณหภูมิ"),
                onSaved: (value){
                  myStudent.temp = value;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('บันทึก'),
                  style: ElevatedButton.styleFrom(
                    
                  textStyle: TextStyle(fontSize: 20)
                  ),
                  onPressed: () {
                   if (formKey.currentState!.validate()) {
                    print("${myStudent.fname}");
                    print("${myStudent.lname}");
                    print("${myStudent.email}");
                    print("${myStudent.temp}");
                   };
                    
                  },
                ),
              ),
              
            ],
          ),
        )),
      ),
    );
  }
}