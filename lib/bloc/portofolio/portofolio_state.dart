import 'package:my_portofolio_flutter/models/portofolio.dart';

abstract class PortofolioState {}

class PortofolioLoadingState extends PortofolioState {}

class PortofolioErrorState extends PortofolioState {
  final Exception exception;

  PortofolioErrorState({required this.exception});
}

class PortofolioSuccessState extends PortofolioState {
  final Portofolio portofolio;

  PortofolioSuccessState({required this.portofolio});
}
