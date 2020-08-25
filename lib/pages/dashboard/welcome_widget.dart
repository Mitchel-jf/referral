part of 'dashboard_page.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Center(
          // alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Welcome', style: Theme.of(context).textTheme.headline5),
              Text('Gagner Referral',
                  style: Theme.of(context).textTheme.headline4),
              Text('Code: gagner-ref', style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ],
    );
  }
}
