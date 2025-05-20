import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/core/networking/dio_exception_extention.dart';
import 'package:rick_and_morty_app/core/networking/local_statuscode.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(Object error) {
    if (error is Exception) {
      if (error is DioException) {
        return error.when(
            connectionError: () => ApiErrorModel(
                  message:
                      "No internet connection. Please check your Wi-Fi or mobile data.",
                  icon: Icons.wifi_off,
                  statusCode: LocalStatuscode.connectionError,
                ),
            connectionTimeout: () => ApiErrorModel(
                  message:
                      "The connection took too long. Try checking your internet or try again later.",
                  icon: Icons.timer_off,
                  statusCode: LocalStatuscode.connectionTimeout,
                ),
            sendTimeout: () => ApiErrorModel(
                  message:
                      "Request timed out while sending data. Please try again.",
                  icon: Icons.send,
                  statusCode: LocalStatuscode.sendTimeout,
                ),
            receiveTimeout: () => ApiErrorModel(
                  message:
                      "Server took too long to respond. Please try again later.",
                  icon: Icons.downloading,
                  statusCode: LocalStatuscode.receiveTimeout,
                ),
            badCertificate: () => ApiErrorModel(
                  message:
                      "Security issue detected with the server. Connection not secure.",
                  icon: Icons.security,
                  statusCode: LocalStatuscode.badCertificate,
                ),
            badResponse: () => ApiErrorModel(
                message:
                    "Server returned an unexpected response. Please try again.",
                icon: Icons.warning,
                statusCode:
                    error.response?.statusCode ?? LocalStatuscode.badResponse),
            cancel: () => ApiErrorModel(
                  message: "The request was cancelled. Please try again.",
                  icon: Icons.cancel,
                  statusCode: LocalStatuscode.cancel,
                ),
            unknown: () => ApiErrorModel(
                  message:
                      "Something went wrong. Please check your connection and try again.",
                  icon: Icons.error_outline,
                  statusCode: LocalStatuscode.unknown,
                ));
      }
      return ApiErrorModel.defaultError();
    }
    return ApiErrorModel.defaultError();
  }
}
