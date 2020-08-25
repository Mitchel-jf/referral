part of 'paystack_provider.dart';

class WithdrawalProcessingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Withdrawal'),
      ),
      body: Consumer<PayStackProvider>(
        builder: (context, provider, child) => Center(
          child: provider.progress == Progress.loading
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Processing'),
                  ],
                )
              : provider.progress == Progress.success
                  ? Success(provider)
                  : Failure(provider),
        ),
      ),
    );
  }
}
