import 'package:flutter/material.dart';

 class VerificarNumberController {

   BuildContext? context;

   Future? init(BuildContext context){

    this.context = context;

   }

  
   void goToRegisterEmail(){
     
     Navigator.pushNamed(context!, '/registerEmail');
   }
 }