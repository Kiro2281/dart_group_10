 
import 'package:flutter/material.dart';

class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameContoller = TextEditingController();
  final surenameContoller = TextEditingController();
  final phoneContoller = TextEditingController();
  final emailContoller = TextEditingController();
  final loginContoller = TextEditingController();
  final passwordContoller = TextEditingController();
  final passwordagainContoller = TextEditingController();

  @override
  void dispose() {
    nameContoller.dispose();
    surenameContoller.dispose();
    phoneContoller.dispose();
    emailContoller.dispose();
    loginContoller.dispose();
    passwordContoller.dispose();
    passwordagainContoller.dispose();
    super.dispose();
  }

  void submitForm(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text('Успешно заркгистрирован!')),
      );
      Navigator.push(context,
      MaterialPageRoute(builder: (_) => ResultPage(
        name: nameContoller.text, 
        surname: surenameContoller.text, 
        phone: phoneContoller.text, 
        email: emailContoller.text, 
        login: loginContoller.text, 
        password: passwordContoller.text, 
        passwordAgain: passwordagainContoller.text,
      )));
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Форма регистрарации'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              buildTextFeild(
                contoller: nameContoller, 
                label: 'Имя', 
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Введите имя';
                  }
                  if(!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)){
                    return 'Только буквы';
                  }
                  return null;
                }),
                buildTextFeild(
                contoller: surenameContoller, 
                label: 'Фамилия', 
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Введите фамилию';
                  }
                  if(!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)){
                    return 'Только буквы';
                  }
                  return null;
                }),
                buildTextFeild(
                contoller: phoneContoller, 
                label: 'Номер', 
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Введите номер телефона';
                  }
                  if(!RegExp(r'^\+?\d+$').hasMatch(value)){
                    return 'Неверный номер телефон';
                  }
                  return null;
                }),
                buildTextFeild(
                contoller: emailContoller, 
                label: 'Почта', 
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Введите электронные почту';
                  }
                  if(!RegExp(r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$').hasMatch(value)){
                    return 'Неверная почта';
                  }
                  return null;
                }),
                buildTextFeild(
                contoller: loginContoller, 
                label: 'Логин', 
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Введите логин';
                  }
                  if(!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)){
                    return 'Неверный логин';
                  }
                  return null;
                }),
                buildTextFeild(
                contoller: passwordContoller, 
                label: 'Пароль', 
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Введите пароль';
                  }
                  if(!RegExp(r'^(?=.*[A-ZА-ЯЁ])(?=.*[a-zа-яё])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>_\-+=]).{8,}$').hasMatch(value)){
                    return 'Пароль должен иметь заглавную букву и маленькую(A-ZA-ЯЕ),символы(+,#,&),цифры(123)';
                  }
                  return null;
                }),
                buildTextFeild(
                contoller: passwordagainContoller, 
                label: 'Повтор пароля', 
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Введите повторно пароль';
                  }
                  if(value != passwordContoller.text){
                    return 'Пароль должен совпадать';
                  }
                  return null;
                }),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: submitForm, 
                  child: Text('Зарегистрироваться')),
                ),
            ],
          )
        ),
      ),
    );   
  }

  Widget buildTextFeild({
    required TextEditingController contoller,
    required String label,
    String? hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator
  }){
    return Padding(padding: EdgeInsets.only(bottom: 16),
    child: TextFormField(
      controller: contoller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
      ),
      validator: validator,
      ), 
    ); 
  }
}

class ResultPage extends StatelessWidget{
  final String name;
  final String surname;
  final String phone;
  final String email;
  final String login;
  final String password;
  final String passwordAgain;

  const ResultPage({
    super.key,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.login,
    required this.password,
    required this.passwordAgain,
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Данные пользователя'),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Center(child:
          CircleAvatar( radius: 80,
              backgroundImage: AssetImage('images/Satoru.jpg'),
              ),
              ),
          ListTile(
          leading: Icon(Icons.person,color: Colors.tealAccent,),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Имя: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: name),
              ],
            ),
          ),
        ),
          ListTile(
          leading: Icon(Icons.family_restroom,color: Colors.tealAccent,),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Фамилия: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: surname),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.phone,color: Colors.tealAccent,),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Телефон: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: phone),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.email,color: Colors.tealAccent,),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Email: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: email),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle,color: Colors.tealAccent,),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Логин: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: login),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.password,color: Colors.tealAccent,),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Пароль: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: password),
              ],
            ),
          ),
        ),
        ],
      ),
      ),
    );    
  }
}