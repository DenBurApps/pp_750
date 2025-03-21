import 'package:flutter/cupertino.dart';
import 'package:pp_750/core/services/main_mixin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../core/app_export.dart';


@RoutePage()
class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();

  static Widget builder(BuildContext context) {
    return GeneralScreen();
  }
}

class _GeneralScreenState extends State<GeneralScreen> with MainMixin {

  late final WebViewController _controller;

  bool _isAppInfoLoading = true;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() => _isAppInfoLoading = false);
          },
          onWebResourceError: (WebResourceError error) {
            if (error.errorCode == -1009) {}
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            if (change.url != null) {
              saveLastVisit(change.url!);
            }
          },
        ),
      );

    if (controller.platform is WebKitWebViewController) {
      (controller.platform as WebKitWebViewController)
          .setAllowsBackForwardNavigationGestures(true);
    }

    _controller = controller;

    final urlToLoad = loadUrl();

    _controller.loadRequest(Uri.parse(urlToLoad));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: _isAppInfoLoading
          ? const _Loading()
          : SafeArea(
              child: _AppInfoLoadedState(
                controller: _controller,
              ),
            ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F1023),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              'assets/images/icon.png',
              width: 120,
              height: 120,
            ),
          ),
          const SizedBox(height: 25),
          const CupertinoActivityIndicator(
            color: CupertinoColors.white,
            radius: 16,
          )
        ],
      ),
    );
  }
}

class _AppInfoLoadedState extends StatelessWidget {
  final WebViewController controller;
  const _AppInfoLoadedState({required this.controller});

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
