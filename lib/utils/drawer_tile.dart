import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_chop/theme/theme_provider.dart';

class DrawerTile extends StatefulWidget {
  const DrawerTile({super.key});

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

bool dark = false;

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Dark mode'),
      trailing: Switch(
          value: dark,
          onChanged: (val) {
            setState(() {
              ThemeProvider themeProvider =
                  Provider.of<ThemeProvider>(context, listen: false);
              themeProvider.toggleTheme();
              dark = !dark;
            });
          }),
    );
  }
}
