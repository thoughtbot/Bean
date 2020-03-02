
import UIKit
import MobileCoreServices

@available(iOS 13.0, *)
class AlertPresenter {
    
    var alert: UIAlertController!
    var controller: UIViewController!

    init(title: String, message: String, on controller: UIViewController) {
        self.controller = controller
        alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        addActions(alert)
    }

    func present() {
        controller.present(alert, animated: true)
    }
    
    private func addActions(_ alert: UIAlertController) {
        alert.addAction(fileAction(title: "Files"))
        alert.addAction(folderAction(title: "Folders"))
        alert.addAction(cancelAction())
    }

    private func folderAction(title: String) -> UIAlertAction {

        return UIAlertAction(title: title, style: .default) { _ in
            self.handler(documentType: [kUTTypeFolder as String], sourceType: .folders)
        }
    }

    private func fileAction(title: String) -> UIAlertAction {

        return UIAlertAction(title: title, style: .default) { _ in
            self.handler(documentType: [kUTTypeMovie as String, kUTTypeImage as String, kUTTypeText as String, kUTTypeAudio as String], sourceType: .files)
        }
    }
    
    private func cancelAction() -> UIAlertAction {
        return UIAlertAction(title: "Cancel", style: .destructive)
    }

    private func handler(documentType: [String], sourceType: SourceType) {
        let pickerController = DocumentPicker(documentTypes: documentType, in: .open, sourceType: sourceType)
        controller.present(pickerController, animated: true)
    }

}

