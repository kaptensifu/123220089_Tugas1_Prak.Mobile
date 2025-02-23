import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController nameController = TextEditingController();
  String? displayName;
  bool isButtonClicked = false;

void _showSettingsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pengaturan"),
              Divider(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Akun"),
                onTap: () {},
              ),              
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        leading: Icon(Icons.home),
        title: Center(child: Text("Khodamers")),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
               _showSettingsMenu(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Center(
            child: Text(
              "Aplikasi Cek Khodam",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ywwRoOAjRCCJCbnJUk-WL1ObB-VpvL6yHg&s",
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 10),

          Text(
            "Aplikasi ini membantu anda menemukan jati diri anda, dengan cara mengecek khodam yang ada di dalam diri anda.",
            softWrap: true,
            style: TextStyle(fontSize: 16),
          ),

          SizedBox(height: 30),

          Center(
            child: Text("Siapakah namamu anak muda?",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),

          SizedBox(height: 10),

          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              
              hintText: 'Masukkan nama',
            ),
          ),

          SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              setState(() {
                displayName = nameController.text;
                isButtonClicked = true;
              });
            },
            child: Text("Cek Khodammu"),
          ),
          if (isButtonClicked && displayName != null)
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "$displayName! Ini adalah khodammu:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Center(child: Text("Dino Kuning")),
                SizedBox(height: 10),
                Image.network(
                  "https://i.pinimg.com/736x/41/2e/02/412e022a2ecfd75cf2b1d93183cf70f9.jpg",
                  width: 200,
                  height: 200,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
