import 'package:app/src/Widgets/profile_settings_button.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 12, 12),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Профиль",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.settings, color: Colors.white, size: 35),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  border: Border.all(
                    color: const Color.fromARGB(150, 255, 17, 0),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(180),
                  child: Image.network(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuBKTn_XsB2wRn8FbjhZZyK8XM3w4j2hSW8R43owjAHQqIKM07gSYteUaAIzsV9ioFaRTL0BY-_JlqYNAD9lmWdBYpszh6XZ6BLmhn7zropIqI-sjhpIhwiGC2kglG992qvNcg2zJpD8M5zX8vj6lm2J52o3y7KDz6oan7j4uJ7DSoujyFSiPdF4cErI-A5DcASrgdGeGp-p5kjHRGthP-qzmZa1_onicAUyfEosKQgt5-juileDwI0S8DWZR75Mp3iDrl6xeIw8b02F",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                "CyberNinja_77",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "Уровень 5 - Кофейный Архимаг",
                style: TextStyle(fontSize: 25, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 8, 8, 8),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 82, 82, 82),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "128",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          "Всего кофе",
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 114, 114, 114),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 8, 8, 8),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 82, 82, 82),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "2560",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          "очков",
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 114, 114, 114),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 8, 8, 8),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 82, 82, 82),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Неон Латте",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          "Любимый",
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 114, 114, 114),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 8, 8, 8),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromARGB(255, 82, 82, 82),
                ),
              ),
              child: Column(
                children: [
                  ProfileSettingsButton(
                    icon: Icons.person_outline,
                    text: "Редактировать профиль",
                    radius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey[800],
                  ),
                  ProfileSettingsButton(
                    icon: Icons.receipt,
                    text: "История заказов",
                    radius: BorderRadius.zero,
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey[800],
                  ),
                  ProfileSettingsButton(
                    icon: Icons.notifications_none_outlined,
                    text: "Настройка уведомлений",
                    radius: BorderRadius.zero,
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey[800],
                  ),
                  ProfileSettingsButton(
                    icon: Icons.payment,
                    text: "Способы оплаты",
                    radius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 8, 8, 8),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromARGB(255, 82, 82, 82),
                ),
              ),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      // Ваш обработчик нажатия
                    },
                    borderRadius: BorderRadius.circular(15),
                    hoverColor: const Color.fromARGB(255, 29, 29, 29),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                                Icons.exit_to_app_outlined,
                                color: const Color.fromARGB(255, 255, 0, 0),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "Выйти из аккаунта",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                        ],
                      ),
                    ),
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
