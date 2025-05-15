class EcommerceAppExceptions implements Exception {
  final String message;
  const EcommerceAppExceptions(this.message);
}

class RemoteExpetion extends EcommerceAppExceptions {
  const RemoteExpetion(super.message);
}

class LocalExpetion extends EcommerceAppExceptions {
  const LocalExpetion(super.message);
}
