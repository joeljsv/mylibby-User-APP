import 'package:flutter/material.dart';
import 'package:mylibby/Provider/order_provider.dart';
import 'package:mylibby/Provider/user_provider.dart';
import 'package:mylibby/models/user.dart';
import 'package:mylibby/utils/theme.dart';
import 'package:mylibby/utils/widgets/appbar.dart';
import 'package:mylibby/utils/widgets/essentials.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;

//

class CodeScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<AuthUser>(context, listen: false).usr;
    bookAdd() async {
      String cameraScanResult = await scanner.scan();
      if (cameraScanResult != null) {
        try {
          showMyDialog(context, isloding: true);
          await Provider.of<OrderProvider>(context, listen: false).takeBook(
              bookId: cameraScanResult, uid: user.sId, userName: user.name);
          Navigator.pop(context);
          showMyDialog(context,
              title: "Succes", sub: "Book Order Succefuly added");
        } catch (e) {
          Navigator.pop(context);
          showMyDialog(context,
              title: "Opps!", sub: "An Error Occured try again!");
        }
      }
    }

    return Scaffold(
      appBar: appBar(title: "Scan Book"),
      body: Center(
        child: FlatButton.icon(
            color: AppTheme.appColor.primaryVariant,
            onPressed: () => bookAdd(),
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: Text(
              "Scan",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
