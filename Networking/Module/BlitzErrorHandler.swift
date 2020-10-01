
//
//  Created by Saurabh on 24/09/20.
//  Copyright © 2020 Kiwi, Inc. All rights reserved.
//


@objc public  class BlitzErrorHandler:NSObject {
    
//    private var genericAlertPopup: GenericAlertPopup?
//    private var activityIndicator: UIView?
    let BI_VIEW_NAME_PROFILE_DATA_VALIDATION = "BI_VIEW_NAME_PROFILE_DATA_VALIDATION"
    let BI_VIEW_NAME_VIDEO_CHAT_SELF_ERROR = "alert_view_video_chat_self_error"
    let BI_VIEW_NAME_VIDEO_CHAT_ERROR = "alert_view_video_chat_error"
    let BI_VIEW_NAME_INTERNET_ERROR = "alert_view_internet_error"
    let BI_VIEW_NAME_SERVER_TIMEOUT = "alert_view_server_timeout"
    let BI_VIEW_NAME_AUTH_ERROR = "alert_view_auth_error"
    let BI_VIEW_NAME_MULTIPLE_USERS_IN_DEVICE = "alert_view_multiple_users_in_device"
    let BI_VIEW_NAME_UNAVAILABLE_ERROR = "alert_view_unavailable_error"
    let BI_VIEW_NAME_SERVER_ERROR = "alert_view_server_error"
    let BI_VIEW_NAME_DIGIT_INTERNET_ERROR = "alert_view_digit_internet_error"
    let BI_VIEW_NAME_DIGIT_SERVER_ERROR = "alert_view_digit_server_error"
    let BI_VIEW_NAME_TOKBOX_CONNECTIVITY_ERROR = "alert_view_tokbox_connectivity_error"
    let BI_PARAM_KEY_ERROR = "error"

    public override init() {
        super.init()
    }


    @objc public func showErrorAlert(_ errorType: BlitzErrorType, withError error: Error?) {
        //show error popup only in case the app is active
        DispatchQueue.main.async {
//            if UIApplication.shared.applicationState != .background && UIApplication.shared.applicationState != .inactive {
////                self.sendBIEvent(forAlert: errorType, withError: error != nil ? error?.localizedDescription : "")
//                self.showAlert(self.getTitle(errorType), withMessage: self.getMessage(errorType, error: error), withBtnText: self.getButtonText(errorType), errorType: errorType, withGif: nil)
//            }
        }
    }

    @objc public func showErrorAlert(_ errorType: BlitzErrorType, withError error: Error?, withResponse response: [AnyHashable : Any]?) {
        if response == nil {
            return showErrorAlert(errorType, withError: error)
        }
        //show error popup only in case the app is active
        DispatchQueue.main.async {
//            if UIApplication.shared.applicationState != .background && UIApplication.shared.applicationState != .inactive {
////                self.sendBIEvent(forAlert: errorType, withError: response?["biMessage"] != nil ? response?["biMessage"] as? String : (error != nil ? error?.localizedDescription : ""))
//
//
//                var message = self.getMessage(errorType, error: error)
//                if response?["message"] != nil {
//                    do {
//                        if let data = (response?["message"] as? String)?.data(using: .unicode) {
//                            message = try NSAttributedString(
//                                data: data,
//                                options: [
//                                    NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html
//                                ],
//                                documentAttributes: nil).string
//                        }
//                    } catch {
//                    }
//                }
//
//                self.showAlert(response?["title"] != nil ? response?["title"] as? String : self.getTitle(errorType), withMessage: message, withBtnText: response?["button"] != nil ? response?["button"] as? String : self.getButtonText(errorType), errorType: errorType, withGif: nil)
//            }
        }
    }

//    func sendBIEvent(forAlert errorType: Error, withError errorMessage: String?) {
//        var viewName = ""
//        switch errorType {
//            case ErrorTypeInternet:
//                viewName = BI_VIEW_NAME_INTERNET_ERROR
//            case ErrorTypeServerTimeout:
//                viewName = BI_VIEW_NAME_SERVER_TIMEOUT
//            case ErrorTypeAuth:
//                viewName = BI_VIEW_NAME_AUTH_ERROR
//            default:
//                break
//        }
//        print("ERROR HANDLER : Log BI event for error alert: \(viewName)")
//        var params: [AnyHashable : Any] = [:]
//
//        params[BI_PARAM_KEY_ERROR] = errorMessage
//
//        // [BiEventManager.biEventManager fireOpenViewEvent:viewName withParams:params andSourceParams:nil];
//    }

    private func getTitle(_ errorType: BlitzErrorType) -> String? {
        switch errorType {
        case .internet:
            return BlitzNetworkingConstants.INTERNET_ERROR_TITLE
        case .serverTimeout:
                return BlitzNetworkingConstants.SERVER_TIMEOUT_ERROR_TITLE
        case .auth:
                return BlitzNetworkingConstants.AUTH_ERROR_TITLE
            default:
                break
        }
        return BlitzNetworkingConstants.INTERNET_ERROR_TITLE
    }

    private func getGif(_ errorType: Error) -> URL? {
        return Bundle.main.url(forResource: "confetti1", withExtension: "png")
    }

    private func getButtonText(_ errorType: BlitzErrorType) -> String? {
//        switch errorType {
////            case ErrorTypeProfileDataValidation, ErrorTypeVideoChatSelf, ErrorTypeVideoChat, ErrorTypeYoutubeRateLimit, ErrorTypeForbidded, ErrorTypeMultipleUsersLogin, ErrorTypeUnavailable:
////                return OK
//            default:
//                return RETRY
//        }
        return nil
    }

    private func getMessage(_ errorType: Error) -> String? {
        return try? getMessage(errorType)
    }

    private func getMessage(_ errorType: BlitzErrorType, error: Error?) -> String? {
        switch errorType {
        case .internet:
            return BlitzNetworkingConstants.INTERNET_ERROR_MESSAGE
        case .serverTimeout:
            return BlitzNetworkingConstants.SERVER_TIMEOUT_ERROR_MESSAGE
        case .auth:
            return BlitzNetworkingConstants.AUTH_ERROR_MESSAGE
        default:
            break
        }
        return BlitzNetworkingConstants.INTERNET_ERROR_MESSAGE
    }

    private func handleClick(_ errorType: BlitzErrorType) {
        switch errorType {
        case .auth:
            handleLogout()
            
        default:
            handleRetryClick(errorType)
        }
    }

    private func handleLogout() {
    }

    private func showAlert(_ title: String?, withMessage message: String?, withBtnText btnTxt: String?, errorType: BlitzErrorType, withGif gif: URL?) {
//        if genericAlertPopup == nil {
//            //self.genericAlertPopup = [[GenericAlertPopup alloc ] init];
//
//            // BI event
//            var biInfo: [AnyHashable : Any] = [:]
//            biInfo[NetworkingConstants.GENERIC_POPUP_TYPE] = "error_popup"
//            biInfo[NetworkingConstants.GENERIC_POPUP_NAME] = title
//
//            genericAlertPopup = GenericAlertPopupBuilder.buildGenericAlertPopup(withPopUpType: 0, withPlaceHoldersInfo: nil, block: { builder in
//                builder?.title = title
//                builder?.message = message
//                builder?.mainButtonText = btnTxt
//                builder?.popupType = NetworkingConstants.ERROR_HANDLER_POPUP_VIEW_NAME
//                builder?.completionBlock = {
//                    self.handleClick(errorType)
//                }
//                builder?.gifUrl = gif
//                builder?.biInfo = biInfo
//            })
//
//            DispatchQueue.main.async(execute: {
//                self.genericAlertPopup?.show(nil, from: nil)
//            })
//        } else {
//            genericAlertPopup?.getController().enableAllStackButtons()
//            deactivateActivityIndicator()
//        }
    }

    private func handleRetryClick(_ errorType: BlitzErrorType) {
//        if Reachability().currentReachabilityStatus() == NotReachable {
//            return
//        }
//        if (errorType == .serverTimeout || errorType == .internet) {
//            genericAlertPopup?.getController().disableAllStackButtons()
//            activateActivityIndicator()
//        } else {
//            onErrorHandledSuccessfully()
//        }

//        ServerHandler.serverHandler.retryPendingCalls()

    }

    @objc func onErrorHandledSuccessfully() {
//        if let genericAlertPopup = genericAlertPopup {
//            DispatchQueue.main.async(execute: {
//                self.genericAlertPopup?.getController().disableAllStackButtons()
//                self.genericAlertPopup?.getController().dismiss(animated: true)
//
//                self.deactivateActivityIndicator()
//
//                self.activityIndicator = nil
//                self.genericAlertPopup = nil
//            })
//        }
    }

    private func activateActivityIndicator() {
//        if activityIndicator == nil {
//            activityIndicator = UIView(frame: genericAlertPopup?.getController().view.bounds ?? CGRect.zero)
//            activityIndicator?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//            let spinner = UIActivityIndicatorView(style: .whiteLarge)
//            spinner.center = activityIndicator?.center ?? CGPoint.zero
//            activityIndicator?.addSubview(spinner)
//            spinner.startAnimating()
//            spinner.isHidden = false
//
//            if let activityIndicator = activityIndicator {
//                genericAlertPopup?.getController().view.addSubview(activityIndicator)
//            }
//        }
//        activityIndicator?.isHidden = false
    }

    private func deactivateActivityIndicator() {
//        activityIndicator?.isHidden = true
    }
    
}

