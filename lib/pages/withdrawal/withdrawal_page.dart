part of 'wprovider.dart';

class WithdrawalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text('Preview'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    KeyValue('Referral-Code', 'gagner-ref'),
                    // keyValue('Account No.', '0096363800'),
                    // keyValue('Bank', 'Access Bank (Diamond)'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: provider.controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Account No.',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Consumer<WProvider>(
                      builder: (context, provider, child) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DropdownButton<Bank>(
                                items: provider.banks
                                    .map((bank) => DropdownMenuItem<Bank>(
                                          child: Text(bank.name),
                                          value: bank,
                                        ))
                                    .toList(),
                                onChanged: provider.onChange,
                                value: provider.value,
                                underline: SizedBox(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          provider.show
                              ? provider.isVerified == Verify.unverified
                                  ? OutlineButton(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      child: Text('verify'),
                                      onPressed: () =>
                                          provider.resolveAccountNumber(
                                              provider.controller.text,
                                              provider.value.code),
                                    )
                                  : provider.isVerified == Verify.verifying
                                      ? CircularProgressIndicator()
                                      : Icon(Icons.verified,
                                          color: Colors.green)
                              : SizedBox(),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Consumer<WProvider>(
                      builder: (context, provider, child) => KeyValue(
                          'Name', provider.accName ?? 'Gagner Referral',
                          color: provider.isVerified == Verify.verified
                              ? Colors.white
                              : Colors.grey),
                    ),
                    KeyValue('Withdrawal Amount', '12,400'),
                    KeyValue('Withdrawal Charge', '186'),
                    KeyValue('Amount You\'ll Receive', '12,214'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 64.0),
                child: Container(
                  // color: Colors.red,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Hero(
                      tag: 'button',
                      child: RaisedButton(
                        child: Text('Withdraw'),
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                      create: (_) => PayStackProvider(),
                                      child: WithdrawalProcessingPage(),
                                    ))),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
