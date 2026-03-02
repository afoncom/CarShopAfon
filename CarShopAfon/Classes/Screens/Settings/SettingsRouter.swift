//
//  SettingsRouter.swift
//  CarShopAfon
//
//  Created by afon.com on 26.02.2026.
//

import StoreKit
import MessageUI

protocol SettingsRouter {
    func requestReview()
    func sendFeedback()
}

final class SettingsRouterImpl: NSObject, SettingsRouter, MFMailComposeViewControllerDelegate {
    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            AppStore.requestReview(in: scene)
        }
    }
    
    func sendFeedback() {
        guard MFMailComposeViewController.canSendMail() else {
            print("Mail services are not available")
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.setToRecipients(["support@afon.com"])
        composer.setSubject("Carsharing Afon Feedback")
        composer.setMessageBody("", isHTML: false)
        composer.mailComposeDelegate = self
        
        if let scene = UIApplication.shared.connectedScenes.first(
            where: { $0.activationState == .foregroundActive }
        ) as? UIWindowScene,
           let rootVC = scene.windows.first?.rootViewController {
            rootVC.present(composer, animated: true)
        }
    }
    
    // MARK: - MFMailComposeViewControllerDelegate
    
    func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        controller.dismiss(animated: true)
    }
}
