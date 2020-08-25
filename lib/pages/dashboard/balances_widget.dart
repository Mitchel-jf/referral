part of 'dashboard_page.dart';

class Balances extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            balanceCard(
              title: 'Withdrawal Balance',
              amount: '12,400',
            ),
            balanceCard(
              title: 'No. of Referrals Gotten',
              amount: '62',
            ),
          ],
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Withdrawal Charge (1.5%)'),
                Text('186', style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget balanceCard({String title, String amount}) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 8.0, top: 16.0),
              child: Text('$title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
            child: Center(
              child: Text(
                '$amount',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
