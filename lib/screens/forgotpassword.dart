import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final ThemeData? themeData;
  ForgotPasswordScreen({this.themeData});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.themeData?.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: widget.themeData?.colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Forgot Password',
          style: widget.themeData?.textTheme.headline5,
        ),
      ),
      body: Container(
        color: widget.themeData?.scaffoldBackgroundColor,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your email to receive a password reset link.',
              style: widget.themeData?.textTheme.bodyText1,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
              ),
              style: widget.themeData?.textTheme.bodyText1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // Puedes agregar validaciones adicionales para el formato del correo
                return null;
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aquí podrías enviar el enlace de restablecimiento de contraseña
                // Simulando que el enlace se envió correctamente
                bool linkSent = true; // Cambia esto según tu lógica de envío de enlaces

                if (linkSent) {
                  Fluttertoast.showToast(
                    msg: 'Reset link sent successfully!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  );

                  // Puedes realizar otras acciones aquí, como navegar a la pantalla de inicio de sesión, por ejemplo
                  Navigator.pop(context); // Vuelve a la pantalla anterior
                } else {
                  Fluttertoast.showToast(
                    msg: 'Failed to send reset link',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}
