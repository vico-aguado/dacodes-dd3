class Env {
  final String endpoint;
  final String publicKey;
  final String privateKey;
  final int limit;

  Env(
    this.endpoint,
    this.publicKey,
    this.privateKey,
    this.limit,
  );
}

final prodEnv = Env(
  'https://gateway.marvel.com:443/v1/public/',
  'fea4ddbf370376865724c2b03db5ffef',
  'dcca949708ec8a3a3b97cf51cacf65cd98a314c4',
  20,
);
