import 'package:flutter/material.dart';

Widget buildFormField(
    {  TextEditingController? controller,
       required Function functionValidate,
    String ?label,
    TextInputType ?inputType,
    IconData ?icon ,
    bool password  = false ,
    Function ?function,
      required Function onTap ,
      IconData ?iconPassword ,
      required Function  changed} ){
  return TextFormField(
    onChanged: (s){
      changed(s)!;
    },
    validator: (s){
      functionValidate(s);
    },

    controller: controller,
    keyboardType: inputType,
    obscureText: password,
    onTap: (){
      onTap();
    },
    decoration: InputDecoration(
      labelText: label,
      prefix: Icon(
          icon
      ),
      suffixIcon: (iconPassword != null) ?
      IconButton( onPressed: (){
        function!();
      },
        icon:Icon(iconPassword) ,
      ) : null,
      border: OutlineInputBorder(),
    ),
  );
}
