abstract class PaymentStates {}

class PaymentInitialStates extends PaymentStates {}

class PaymentAuthLoadingStates extends PaymentStates {}

class PaymentAuthSuccessStates extends PaymentStates {}

class PaymentAuthErrorStates extends PaymentStates {
  final String error;
  PaymentAuthErrorStates(this.error);
}

// for order id
class PaymentOrderIdLoadingStates extends PaymentStates {}

class PaymentOrderIdSuccessStates extends PaymentStates {}

class PaymentOrderIdErrorStates extends PaymentStates {
  final String error;
  PaymentOrderIdErrorStates(this.error);
}

// for request token
class PaymentRequestTokenLoadingStates extends PaymentStates {}

class PaymentRequestTokenSuccessStates extends PaymentStates {}

class PaymentRequestTokenErrorStates extends PaymentStates {
  final String error;
  PaymentRequestTokenErrorStates(this.error);
}

// for ref code
class PaymentRefCodeLoadingStates extends PaymentStates {}

class PaymentRefCodeSuccessStates extends PaymentStates {}

class PaymentRefCodeErrorStates extends PaymentStates {
  final String error;
  PaymentRefCodeErrorStates(this.error);
}


// for wallet
class PaymentWalletLoadingStates extends PaymentStates {}

class PaymentWalletSuccessStates extends PaymentStates {}

class PaymentWalletErrorStates extends PaymentStates {
  final String error;
  PaymentWalletErrorStates(this.error);
}


class PaymentWalletOrderLoadingStates extends PaymentStates {}

class PaymentWalletOrderSuccessStates extends PaymentStates {}

class PaymentWalletOrderErrorStates extends PaymentStates {
  final String error;
  PaymentWalletOrderErrorStates(this.error);
}


class PaymentRequestWalletTokenLoadingStates extends PaymentStates {}

class PaymentRequestWalletTokenSuccessStates extends PaymentStates {}

class PaymentRequestWalletTokenErrorStates extends PaymentStates {
  final String error;
  PaymentRequestWalletTokenErrorStates(this.error);
}