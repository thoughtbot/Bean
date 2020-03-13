
import UIKit

@available(iOS 11.0, *)
public protocol DocumentPickable: class {
    func pickDocuments()
    func didPickDocument(bean: Bean?)
    func presentPreview(bean: Bean)
}

@available(iOS 13.0, *)
public extension DocumentPickable where Self: UIViewController {

    func pickDocuments() {
        let presenter = AlertPresenter(title: "Select From", message: "", on: self)
        presenter.present()
        BFileManager.current?.pickedDocument = self.didPickDocument
    }
    
    func presentPreview(bean: Bean) {
        let previewPresenter = PreviewPresenter(bean: bean, presenting: self)
        previewPresenter.present()
    }
}
