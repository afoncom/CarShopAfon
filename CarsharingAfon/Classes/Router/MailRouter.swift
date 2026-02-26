//
//  MailRouter.swift
//  CarsharingAfon
//
//  Created by afon.com on 25.02.2026.
//

//import UIKit
import MessageUI

protocol MailRouter {
    func sendFeedback()
}

final class MailRouterImpl: NSObject, MailRouter, MFMailComposeViewControllerDelegate {
    func sendFeedback() {
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
