

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokemon/utils/app_colors.dart';

import '../utils/navigator/app_routes.dart';
import '../utils/text_styles.dart';

class AddPokemonScreen extends StatelessWidget {
   AddPokemonScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.5),
        title: const Text("Add Pokemon"),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: Column(

          children: [
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.withOpacity(0.5),),

                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: TextFormField(
                cursorColor: Colors.red.withOpacity(0.5),
                style:   TextStyle(
                  fontSize: 14,
                  color: primaryDark,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "pokemon name",
                    hintText: "enter pokemon name",
                    labelStyle: TextStyle(color: Colors.red.withOpacity(0.5),)),
                validator: (value) {
                  if(value?.isEmpty?? false){
                    return "Field can not be empty";
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 16,),

            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.withOpacity(0.5),),

                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: TextFormField(
                cursorColor: Colors.red.withOpacity(0.5),
                style:  TextStyle(
                  fontSize: 14,
                  color: primaryDark,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "pokemon height",
                    hintText: "enter pokemon height",
                    labelStyle: TextStyle(color: Colors.red.withOpacity(0.5),)),

                validator: (value) {
                  if(value?.isEmpty?? false){
                    return "Field can not be empty";
                  }
                  return null;
                },


              ),
            ),

            const SizedBox(height: 16,),

            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.withOpacity(0.5),),

                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: TextFormField(
                cursorColor: Colors.red.withOpacity(0.5),
                style:  TextStyle(
                  fontSize: 14,
                  color: primaryDark,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "pokemon weight",
                    hintText: "enter pokemon weight",
                    labelStyle: TextStyle(color: Colors.red.withOpacity(0.5),)),

                validator: (value) {
                  if(value?.isEmpty?? false){
                    return "Field can not be empty";
                  }
                  return null;
                },

              ),
            ),

            const SizedBox(height: 16,),

            ElevatedButton(

              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red.withOpacity(0.9))
            ),
              onPressed: (){

                if(_formKey.currentState!.validate()) {
                  Fluttertoast.showToast(msg: "Pokemon Added");
                  popPage();
                }
              },


              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                child: Text("Add pokemon", style: title3Bold?.copyWith(color: Colors.white),),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
