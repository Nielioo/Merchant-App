part of 'pages.dart';

class FormBuyPage extends StatefulWidget {
  const FormBuyPage({Key? key}) : super(key: key);
  static const String routeName = "/formbuy";

  @override
  State<FormBuyPage> createState() => _FormBuyPageState();
}

class _FormBuyPageState extends State<FormBuyPage> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isHide = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buy Item",
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  startt
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          // InputDecoration.collapsed(hintText: "Email Address"),
                          InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.mail),
                      ),
                      controller: ctrlEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return !EmailValidator.validate(value.toString())
                            ? "Email tidak valid"
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          // InputDecoration.collapsed(hintText: "Email Address"),
                          InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHide = !isHide;
                                  });
                                },
                                child: (isHide)
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              )),
                      controller: ctrlPass,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        // return value.toString().length < 8
                        //     ? "Password at least 8 characters"
                        //     : null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text('AlertDialog Title'),
                                      content: Text(ctrlEmail.text.toString()),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Fluttertoast.showToast(
                                                msg: "email:" +
                                                    ctrlEmail.text.toString(),
                                                toastLength: Toast.LENGTH_SHORT,
                                                fontSize: 14,
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                textColor: Colors.white);
                                            Navigator.pop(context, 'OK');
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ));

                          } else {
                            Fluttertoast.showToast(
                                msg: "Please fill all fields!",
                                toastLength: Toast.LENGTH_SHORT,
                                fontSize: 14,
                                backgroundColor: Colors.redAccent,
                                textColor: Colors.white);
                          }
                        },
                        child: Text("Buy"))
                  ],
                ),
              ),
              // endd
            ],
          ),
        ),
      ),
    );
  }
}
