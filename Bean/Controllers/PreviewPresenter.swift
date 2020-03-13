
import QuickLook

@available(iOS 11.0, *)
class PreviewPresenter: QLPreviewControllerDataSource {
    
    var bean: Bean!
    var controller: UIViewController!
    
    init(bean: Bean, presenting controller: UIViewController) {
        self.bean = bean
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
        bean.fileURL as QLPreviewItem
    }

}
