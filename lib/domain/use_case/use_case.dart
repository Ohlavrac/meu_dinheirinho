abstract class UseCase<T> {
  T call(Parameters p);
}

class Parameters {
  Map<String, dynamic> data;
  Parameters(this.data);
}

class NoParameters extends Parameters {
  NoParameters() : super({});
}