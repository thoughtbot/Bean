
import UIKit

@available(iOS 11.0, *)
public protocol DocumentPickable: class {
    func pickDocuments()
    func didPickDocument(document: Bean?)
    func presentPreview(document: Bean)
}

@available(iOS 13.0, *)
public extension DocumentPickable where Self: UIViewController {

    func pickDocuments() {
        let presenter = AlertPresenter(title: "Select From", message: "", on: self)
        presenter.present()
        BFileManager.current?.pickedDocument = self.didPickDocument
    }
    
    func presentPreview(document: Bean) {
        let previewPresenter = PreviewPresenter(document: document, presenting: self)
        previewPresenter.present()
    }
}
