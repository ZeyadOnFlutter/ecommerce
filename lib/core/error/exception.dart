class EcommerceAppExceptions implements Exception {
  final String message;
  const EcommerceAppExceptions(this.message);
}

class RemoteException extends EcommerceAppExceptions {
  const RemoteException(super.message);
}

class LocalException extends EcommerceAppExceptions {
  const LocalException(super.message);
}
