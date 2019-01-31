import 'package:flutter/material.dart';
import 'package:driverapp/services/authentication.dart';

class LoginForm extends StatefulWidget {

  LoginForm({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;


  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _minimumPadding = 5.0;

  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  // Initial form is login form
  bool _isIos;
  bool _isLoading;



  bool _validateAndSave() {
    final form = _formKey.currentState;


    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        userId = await widget.auth.signIn(_email, _password);
        print('Signed in: $userId');

        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          widget.onSignedIn();
        }

      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Driver Login'),
//        backgroundColor: Colors.transparent,
      ),
      body: _showBody(),
    );

  }
  Widget _showBody(){
    return Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
    child: new Form(
    key: _formKey,
    child: ListView(
    children: <Widget>[
    _showLogo(),
    _showEmailInput(),
    _showPasswordInput(),
    _showPrimaryButton()
    ],
    ),
    ),
    );
  }
  Widget _showLogo(){
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(_minimumPadding * 10),
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              color: Colors.red),
          child: new Icon(
            Icons.directions_bus,
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ],
    );
  }
  Widget _showEmailInput() {
    return  Padding(
      padding: EdgeInsets.all(_minimumPadding),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Enter your username',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }
  Widget _showPasswordInput() {
    return Padding(
      padding: EdgeInsets.all(_minimumPadding),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    );
  }
  Widget _showPrimaryButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('Login',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: _validateAndSubmit,

        )
      ],
    );
  }
}
