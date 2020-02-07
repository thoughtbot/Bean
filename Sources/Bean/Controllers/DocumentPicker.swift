
import UIKit

@available(iOS 13.0, *)
class DocumentPicker: UIDocumentPickerViewController, UIDocumentPickerDelegate {
    
    var sourceType: SourceType!
        
    init(documentTypes allowedUTIs: [String], in mode: UIDocumentPickerMode, sourceType: SourceType) {
        super.init(documentTypes: allowedUTIs, in: mode)
        self.sourceType = sourceType
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("documentPicker was cancelled")
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            return
        }
        
        BFileManager.current?.start(selectedURL: url, sourceType: sourceType)
    }

}

