import 'package:flutter/material.dart';

class Telegram extends StatefulWidget {
  const Telegram({super.key});

  @override
  State<Telegram> createState() => _TelegramState();
}

class _TelegramState extends State<Telegram> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blueGrey,
        colorSchemeSeed: Color(0xFF2AABEE),
        drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF121212),
        colorSchemeSeed: Color(0xFF2AABEE),
      ),
      home: HomePage(
        isDarkMode: themeMode == ThemeMode.dark,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Telegram')),
      drawer: AppDrawer(isDarkMode: isDarkMode, onToggleTheme: onToggleTheme),
      body: ChatsPage1()
    );
  }
}

class AppDrawer extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const AppDrawer({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final telegramBlue = Color(0xFF2AABEE);
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 170,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: telegramBlue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 34, color: Color(0xFF2AABEE)),
                ),
                SizedBox(height: 12),
                Text(
                  'Кубанычбеков Талгар',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('+996 755 100 302', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          drawerItem(
            context,
            icon: Icons.chat,
            title: 'Чаты',
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (_) => const ChatsPage())
              );
            }
          ),
          drawerItem(
            context,
            icon: Icons.call,
            title: 'Звонки',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CallPage()),
              );
            },
          ),
          drawerItem(
            context,
            icon: Icons.person,
            title: 'Контакты',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ContactsPage()),
              );
            },
          ),

          Divider(),

          SwitchListTile(
            secondary: Icon(Icons.dark_mode),
            title: Text('Темная тема'),
            value: isDarkMode,
            onChanged: (_) => onToggleTheme(),
          ),

          drawerItem(
            context,
            icon: Icons.settings,
            title: 'Настройки',
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SettingsPage())
              );
            },
          ),

          drawerItem(
            context,
            icon: Icons.help_outline,
            title: 'Помощь',
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SupportPage())
              );
            },
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.onSurface),
      title: Text(title),
      onTap: onTap,
      horizontalTitleGap: 8,
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Чаты')),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('П')
            ),
            title: Text('Папа'),
            subtitle: Text('Сынок приезжай домой тут торт'),
            trailing: Text('10:42'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text('М')
            ),
            title: Text('Мама'),
            subtitle: Text('Сынок я тут испекла твой любимый десерт'),
            trailing: Text('09:18'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text('Б') 
            ),
            title: Text('Брат'),
            subtitle: Text('Брат тут менты'),
            trailing: Text('Вчера'),
          ),
        ],
      ),
    );
  }
}

class ChatsPage1 extends StatelessWidget {
  const ChatsPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('П')
            ),
            title: Text('Папа'),
            subtitle: Text('Сынок приезжай домой тут торт'),
            trailing: Text('10:42'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text('М')
            ),
            title: Text('Мама'),
            subtitle: Text('Сынок я тут испекла твой любимый десерт'),
            trailing: Text('09:18'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text('Б') 
            ),
            title: Text('Брат'),
            subtitle: Text('Брат тут менты'),
            trailing: Text('Вчера'),
          ),
        ],
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Звонки'), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.call_received, color: Colors.green),
            ),
            title: Text('Папа'),
            subtitle: Text('Входящий · +996 555 123 456'),
            trailing: Text('10:42'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.call_made, color: Colors.blue),
            ),
            title: Text('Мама'),
            subtitle: Text('Исходящий · +996 700 234 567'),
            trailing: Text('09:18'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.call_missed, color: Colors.red),
            ),
            title: Text('Брат'),
            subtitle: Text('Пропущенный · +996 777 345 678'),
            trailing: Text('Вчера'),
          ),
        ],
      ),
    );
  }
}

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Контакты'), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(child: Text('А')),
            title: Text('Папа'),
            subtitle: Text('+996 555 123 456'),
          ),Divider(),
          ListTile(
            leading: CircleAvatar(child: Text('М')),
            title: Text('Мама'),
            subtitle: Text('+996 700 234 567'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(child: Text('Д')),
            title: Text('Брат'),
            subtitle: Text('+996 777 345 678'),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(child: Text('А')),
            title: Text('Айгуль Токтосунова'),
            subtitle: Text('+996 550 456 789'),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget{

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),
        actions: [IconButton(onPressed: (){},
        icon: Icon(Icons.search )),
        IconButton(onPressed: (){},
        icon: Icon(Icons.more_vert))
        ]
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 24,),
            CircleAvatar(
               radius: 80,
              backgroundImage: AssetImage('images/Satoru.jpg'),
            ),
            SizedBox(height: 16,),
            Title(color: Colors.white, child: Text('Tempest',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),)),
            SizedBox(height: 8,),
            Title(color: Colors.grey, child: Text('online',style: TextStyle(
              color: Colors.grey.shade400
            ),),),
            ListTile(
              leading: CircleAvatar(child: 
              Icon(Icons.call,color: Colors.white,),),
              title: Text("+996 755 100 302"),
              subtitle: Text('Phone'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: 
              Icon(Icons.alternate_email,color: Colors.white,),),
              title: Text("Tempest228"),
              subtitle: Text('Username'),
            ),
          ],
        ),
      ),
    );
  }
}

class SupportPage extends StatefulWidget{
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage>{

  final TextEditingController firstController = TextEditingController();

  double get firstValue => double.tryParse(firstController.text) ?? 0;
  

  void resetCalculator() {
    setState(() {
      firstController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Поддержка', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Если у вас есть какие-то проблемы , пожалуйста сообщите нам о них! ',style: 
            TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 24,),
            SizedBox(child: 
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 200),
                labelText: "Введите текст",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.tealAccent, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 32,),
          SizedBox(height: 50,
            child: ElevatedButton(onPressed: () {
               resetCalculator();
               ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Отправлено!')));
            },
            child: Text('Отправить')),
          )
        ],
      )
      )
    );
  }
}