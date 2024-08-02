import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fall Detection System Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const primaryColor = Color.fromARGB(255, 0, 0, 0);
const canvasColor = Color.fromARGB(255, 205, 147, 93);
const scaffoldBackgroundColor = Color.fromARGB(255, 255, 255, 255);

class _MyHomePageState extends State<MyHomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    title: const Text('AI Fall Detection System'),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SideBarXExample(
              controller: _controller,
            ),
            body: Row(
              children: [
                if (!isSmallScreen) SideBarXExample(controller: _controller),
                Expanded(
                    child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (_controller.selectedIndex) {
                        case 0:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'View All Cameras',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40),
                            ),
                          );
                        case 1:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Alert Email Registeration',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40),
                            ),
                          );
                        case 2:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Alert Email Information',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40),
                            ),
                          );
                        case 3:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40),
                            ),
                          );
                        default:
                          return const Center(
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40),
                            ),
                          );
                      }
                    },
                  ),
                ))
              ],
            ));
      }),
    );
  }
}

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0), bottomRight: Radius.circular(0))),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedTextStyle: const TextStyle(color: Colors.white),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 1),
      headerBuilder: (context, extended) {
        return const SizedBox(
          height: 100,
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.white,
          ),
        );
      },
      items: const [
        SidebarXItem(
          icon: Icons.view_agenda,
          label: 'View All Cameras',
        ),
        SidebarXItem(icon: Icons.add, label: 'Alert Email Registeration'),
        SidebarXItem(icon: Icons.info, label: 'Alert Email Information'),
        SidebarXItem(icon: Icons.settings, label: 'Settings'),
      ],
    );
  }
}
