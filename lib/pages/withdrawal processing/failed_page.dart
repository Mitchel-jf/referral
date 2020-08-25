part of 'paystack_provider.dart';

class Failure extends StatelessWidget {
  final PayStackProvider provider;

  Failure(this.provider);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 200,
            height: 200,
            child: FlareActor(
              'assets/rive/failure dialog.flr',
              animation: 'failure',
            ),
          ),
          SizedBox(height: 10),
          KeyValue('',
              'There was an error while processing '
                  'your payment please try again',
              ),
          RaisedButton(
            color: Colors.blue,
            child: Text('Try Again'),
            onPressed: provider.mockWork,
          ),
        ],
      ),
    );
  }
}
