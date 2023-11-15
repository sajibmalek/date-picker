import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  
  final _dateOfBirthTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              width: double.infinity,
              height: 60,
              child: TextFormField(
                controller: _dateOfBirthTEController,
                onTap: () {
                  selectDate();
                },
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.only(left: 16, right: 12),
                  border: InputBorder.none,
                  prefixIcon:  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_month)
                    ),
                  ),
                  suffixIcon: IconButton(onPressed: (){
                    _dateOfBirthTEController.clear();
                  }, icon: const Icon(Icons.cancel_outlined)),
                  hintText: '01/01/2000',
                  hintStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w200),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color:Colors.black
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                        color:Colors.black
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              if(_dateOfBirthTEController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Select you date first')));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_dateOfBirthTEController.text)));

              }

            }, child: const Text('show date'))
          ],
        ),
      ),
    );
  }
  void selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        _dateOfBirthTEController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {
      //error message
    }
  }
}
