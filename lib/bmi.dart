import 'package:flutter/material.dart';

class BMI extends StatefulWidget{
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double _bmi = 0.0;
  String result = "No Operation performed";
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              decoration: InputDecoration(
                hintText: "Enter Your Height in Meters",
                prefixIcon: Icon(Icons.height),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6)
                )
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: weightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: "Enter Your Weight in KG",
                prefixIcon: Icon(Icons.monitor_weight_outlined)
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {
              _calculatebmi(height: heightController.text.toString(), weight: weightController.text.toString());
            }, child: Text("Calculate", style: TextStyle(fontWeight: FontWeight.bold)), style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue),elevation: WidgetStatePropertyAll(12),)),
            SizedBox(
              height: 15,
            ),
            _bmi==0.0 ? Text("Enter your Height and Weight") : Text(_bmi.toStringAsFixed(2)),
            result=="" ? Text("NO Operations Performed") : Text(result)
          ],
        ),
      ),

    );
  }
  _calculatebmi({required String height,required String weight}){
    if(height=="" || weight==""){
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Enter your Height and Weight")
          ));
    }
    else{
      final double Height = double.parse(height);
      final double Weight = double.parse(weight);
      setState(() {
        _bmi = Weight/(Height*Height);
      });
      if(_bmi<18.5){
        result="UnderWeight";
      }
      else if(_bmi>=18.5 && _bmi<24.9){
        result="Normal Weight";
      }
      else if(_bmi>=25 && _bmi<=29.9){
        result="OverWeight";
      }
      else{
        result="Obese";
      }
    }
  }

}