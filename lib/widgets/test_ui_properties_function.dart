import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final int day = 6;
  final String name = "Richu Antony";

  const TestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bool isDarkMode =
    //     MediaQuery.of(context).platformBrightness == Brightness.dark;
    // final size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: isDarkMode ? Colors.transparent : Colors.transparent,
    //   statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    //   systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
    //   systemNavigationBarDividerColor:
    //   isDarkMode ? Colors.transparent : Colors.transparent,
    //   systemNavigationBarIconBrightness:
    //   isDarkMode ? Brightness.light : Brightness.dark,
    // ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Testing Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Drawer Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Drawer Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Drawer Item 3'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .displayLarge,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .displaySmall,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,
            ),
            Text(
              'Text',
              style: Theme
                  .of(context)
                  .textTheme
                  .labelSmall,
            ),
            const SizedBox(height: 16.0),
            Card(
              color: Theme
                  .of(context)
                  .cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Card',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: Text(
                'List Item 1',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
              subtitle: Text(
                'Subtitle 1',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
              leading: const Icon(Icons.list),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'List Item 2',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
              subtitle: Text(
                'Subtitle 2',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
              leading: const Icon(Icons.list),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 100.0,
              color: Theme
                  .of(context)
                  .primaryColor,
              alignment: Alignment.center,
              child: Text(
                'Container',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Text Field',
              ),
            ),
            const SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            Center(
              child: Text(
                "${day}st Day Of Development by $name",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
