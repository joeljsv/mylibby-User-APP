import 'package:flutter/material.dart';

Center loading() {
    return Center(
          child: CircularProgressIndicator(),
        );
  }

  Center error() {
    return Center(
          child:Text("Opps! Somthing went Wrong"),
        );
  }

Future<void> showMyDialog(BuildContext context,{String title='',String sub,isloding=false}) async {
  return showDialog<void>(
    context: context,
    // barrierColor: Colors.transparent,
    barrierDismissible: !isloding, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        
        backgroundColor: isloding?Colors.transparent:Colors.white,
        title: Text('$title'),
        elevation: 0,
        content: SingleChildScrollView(
          
          child: ListBody(
            children: <Widget>[
             (sub!=null)?Text(sub):Center(
                child: CircularProgressIndicator(),
             )
            ],
          ),
        ),
        actions: <Widget>[
          if(!isloding)
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}