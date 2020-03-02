
import QuickLook

@available(iOS 11.0, *)
class PreviewPresenter: QLPreviewControllerDataSource {
    
    var doument: Bean!
    var controller: UIViewController!
    
    init(document: Bean, presenting controller: UIViewController) {
        self.doument = document
        self.controller = controller
    }
 
    public func present() {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        controller.present(previewController, animated: true)
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        doument.fileURL as QLPreviewItem
    }

}
