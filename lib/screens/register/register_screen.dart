import 'package:flutter/material.dart';

import '../../routes/index.dart';
import 'components/register_form.dart';

class RegisterScreen extends StatelessWidget {

  void selectContinue(BuildContext context){
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return BooksForSale();
    //     }
    //   )
    // );

    Navigator.of(context).pushNamed(RouteManager.ROUTE_HOME_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text("Register Account",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
                ),
                ),
                SizedBox(height: 10),
                RegisterForm(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.apple),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.flutter_dash),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  
                  ),
                  onPressed: () => selectContinue(context),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
          
    );
  }
}
