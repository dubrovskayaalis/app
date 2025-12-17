import 'package:app/src/ViewModel/authorization_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthorizationView extends StatefulWidget {
  const AuthorizationView({super.key});

  @override
  State<AuthorizationView> createState() => _AuthorizationViewState();
}

class _AuthorizationViewState extends State<AuthorizationView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthorizationVm>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 12, 12),
      body: Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_esports,
              size: 130,
              color: const Color.fromARGB(255, 255, 17, 0),
              shadows: [
                Shadow(
                  color: Colors.red,
                  blurRadius: 3,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            Text(
              "Вход в аккаунт",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            SizedBox(height: 50),
            Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 105, 105, 105),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 105, 105, 105),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 26, 26, 26),
                        labelText: "Логин или Email",
                        errorText: viewModel.loginError,
                        floatingLabelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.person),
                      ),
                      cursorColor: Colors.grey,
                      style: TextStyle(color: Colors.grey),
                      onChanged: viewModel.setLogin,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 105, 105, 105),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 105, 105, 105),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 26, 26, 26),
                        labelText: "Пароль",
                        errorText: viewModel.pwdError,
                        floatingLabelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: viewModel.togglePasswordVisibility,
                        ),
                      ),
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.grey,
                      obscureText: !viewModel.passwordVisible,
                      obscuringCharacter: "*",
                      onChanged: viewModel.setPassword,
                      
                    ),
                    SizedBox(height: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => {},
                        child: Text(
                          "Забыли пароль?",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 17, 0),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Material(
                      color: const Color.fromARGB(255, 255, 0, 0),
                      borderRadius: BorderRadius.circular(15),                      
                      child: InkWell(
                        onTap: () async {
                          bool isValid = _formKey.currentState!.validate();
                          if(isValid) {
                            if(viewModel.isLoading){
                              
                            }
                            else{
                              await viewModel.login(context);
                            }
                          }
                        },
                        borderRadius: BorderRadius.circular(15),
                        hoverColor: const Color.fromARGB(34, 0, 0, 0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "Войти",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Еще нет аккаунта?",
              style: TextStyle(color: Colors.grey[500], fontSize: 16),
            ),
            SizedBox(width: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => {},
                child: Text(
                  "Зарегистрироваться",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 17, 0),
                    fontSize: 16,
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
