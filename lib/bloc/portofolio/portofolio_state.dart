import 'package:my_portofolio_flutter/models/portofolio.dart';

abstract class PortofolioState {
  bool isLoading;
  Portofolio? portofolio;
  Exception? exception;

  PortofolioState(
      {required this.isLoading,
      required this.portofolio,
      required this.exception});
}

class PortofolioLoadingState extends PortofolioState {
  PortofolioLoadingState()
      : super(isLoading: true, portofolio: null, exception: null);
}

class PortofolioErrorState extends PortofolioState {
  final Exception exception;

  PortofolioErrorState({required this.exception})
      : super(isLoading: false, portofolio: null, exception: null);
}

class PortofolioSuccessState extends PortofolioState {
  final Portofolio portofolio;

  PortofolioSuccessState({required this.portofolio})
      : super(isLoading: false, portofolio: portofolio, exception: null);
}
