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
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlAddress = TextEditingController();
  final ctrlQuantity = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Purchase Item",
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFFCCB6FF),
                Color(0xFFE0FFFC),
              ]),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              //  startt
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        hintText: "Enter your name here",
                        prefixIcon: Icon(Icons.person),
                      ),
                      controller: ctrlName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return (value.toString() == null ||
                                value.toString().isEmpty)
                            ? "Name field cannot be empty"
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        border: OutlineInputBorder(),
                        hintText: "Enter your email address here",
                        prefixIcon: Icon(Icons.mail),
                      ),
                      controller: ctrlEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return !EmailValidator.validate(value.toString())
                            ? "Invalid email"
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        labelText: "Shipping Address",
                        border: OutlineInputBorder(),
                        hintText: "Enter your shipping address here",
                        prefixIcon: Icon(Icons.house),
                      ),
                      controller: ctrlAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return (value.toString() == null ||
                                value.toString().isEmpty)
                            ? "Shipping address field cannot be empty"
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Item Quantity",
                        border: OutlineInputBorder(),
                        hintText: "Enter item quantity you wanna buy",
                        prefixIcon: Icon(Icons.table_rows),
                      ),
                      controller: ctrlQuantity,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return (value.toString() == null ||
                                value.toString().isEmpty)
                            ? "Item quantity field cannot be empty"
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00AAA6),
                          minimumSize: const Size.fromHeight(36),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text(
                                        'Purchase Confirmation',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Text("Name: " +
                                          ctrlName.text.toString() +
                                          "\nEmail: " +
                                          ctrlEmail.text.toString() +
                                          "\n\n" +
                                          ctrlQuantity.text.toString() +
                                          " item(s) will be send to " +
                                          ctrlAddress.text.toString()),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Item Successfuly Purchased')),
                                            );
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
                        child: Text("Buy", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),))
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
