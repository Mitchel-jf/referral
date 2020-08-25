part of 'paystack_provider.dart';

class Success extends StatelessWidget {
  final PayStackProvider provider;

  Success(this.provider);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: FlareActor(
              'assets/rive/failure dialog.flr',
              animation: 'success',
            ),
          ),
          KeyValue('Ref Code', 'gagner-ref'),
          KeyValue('Account Number', '0096363800'),
          KeyValue('Name', 'FEBECHUKWU MITCHELL JIMBEH'),
          KeyValue('Amount Withdrawn', '12,400'),
          KeyValue('Withdrawal Charge', '186'),
          KeyValue('Amount You Received', '12,214'),
          KeyValue('Date', provider.date()),
          RaisedButton.icon(
            color: Colors.green,
            icon: Icon(Icons.share),
            label: Text('Share'),
            onPressed: () {},
          ),
        ],
      ),
      // child: FlareActor('Loading_Error_Success'),
    );
  }
}
