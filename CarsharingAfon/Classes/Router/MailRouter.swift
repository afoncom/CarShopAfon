//
//  MailRouter.swift
//  CarsharingAfon
//
//  Created by afon.com on 25.02.2026.
//

import UIKit
import MessageUI

protocol MailRouter {
    func presentMailComposer(
        recipients: [String],
        subject: String,
        body: String,
        delegate: MFMailComposeViewControllerDelegate
    )
}

final class MailRouterImpl: NSObject, MailRouter {
    func presentMailComposer(
        recipients: [String],
        subject: String,
        body: String,
        delegate: MFMailComposeViewControllerDelegate
    ) {
        guard MFMailComposeViewController.canSendMail() else {
            print("Mail services are not available")
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.setToRecipients(recipients)
        composer.setSubject(subject)
        composer.setMessageBody(body, isHTML: false)
        composer.mailComposeDelegate = delegate
        
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
           let rootVC = scene.windows.first?.rootViewController {
            rootVC.present(composer, animated: true)
        }
    }
}
