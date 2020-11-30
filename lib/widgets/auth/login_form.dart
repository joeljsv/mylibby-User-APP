import 'package:flutter/material.dart';
import 'package:mylibby/Provider/user_provider.dart';
import 'package:mylibby/utils/theme.dart';
import 'package:mylibby/utils/widgets/essentials.dart';
import 'package:provider/provider.dart';

import '../../index.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    login() async {
      try {
        print(_email.text.toString());
        await Provider.of<AuthUser>(context, listen: false)
            .loginUser(_email.text.toString(), _password.text.toString());
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>Index()));
      } catch (e) {
        Navigator.pop(context);
        showMyDialog(context, title: "Opps!", sub: e.toString());
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 62),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FormField(TextFormField(
              controller: _email,
              validator: (val) {
                if (!val.contains("@"))
                  return "Enter Valid Email";
                else
                  return null;
              },
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.mail,
                  color: AppTheme.appColor.primary,
                ),
                hintText: 'Email',
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: FormField(
                TextFormField(
                  controller: _password,
                  validator: (val) {
                    if (val.length < 5)
                      return "Enter Valid Password";
                    else
                      return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.vpn_key,
                      color: AppTheme.appColor.primary,
                    ),
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 32),
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                if (_formKey.currentState.validate())
                  showMyDialog(context, isloding: true);
                login();
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.appColor.primary,
                        AppTheme.appColor.primaryVariant,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Text(
                    'Login'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  final Widget textBox;
  const FormField(
    this.textBox, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: textBox,
    );
  }
}
