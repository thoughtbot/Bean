
import MobileCoreServices
import QuickLookThumbnailing
import UIKit

@available(iOS 13.0, *)
class BFileManager {
    
    public class unowned var current: BFileManager? {
        struct Static {
            static var instance = BFileManager()
        }
        return Static.instance
    }
    
    private(set) var status: Status = .notStarted
    
    public var pickedDocument: ((_ document: Bean?) -> ())?
    private(set) var numberOfFiles: Int = 0
    
    func start(selectedURL: URL, sourceType: SourceType) {
        status = .inProgress
        self.readURL(url: selectedURL, with: sourceType) { status in
            self.status = status
        }

    }
    
    private func documentFromURL(url: URL, completion: @escaping((Status, Bean)->())) {
        generateThumbnailRepresentations(url: url) { (thumbnail, icon) in
            let image = thumbnail != nil ? thumbnail : icon
            let bean = Bean(url: url, thumbnail: image)
            url.stopAccessingSecurityScopedResource()
            completion(.completed, bean)
        }
    }
    
    private func readURL(url: URL, with sourceType: SourceType, completion: @escaping((Status)->())) {
        
        _ = url.startAccessingSecurityScopedResource()
        
        NSFileCoordinator().coordinate(readingItemAt: url, error: NSErrorPointer.none) { (fileUrl) in
            
            let keys: [URLResourceKey] = [.nameKey, .isDirectoryKey]
            let fileList = FileManager.default.enumerator(at: url, includingPropertiesForKeys: keys)
            
            // This looks redundant but it is done because you lose access to the property once read
            let filesToCount = FileManager.default.enumerator(at: fileUrl, includingPropertiesForKeys: keys)
            
            
            switch sourceType {
            case .files:
                numberOfFiles = 1
                documentFromURL(url: url) { status, bean in
                    DispatchQueue.main.async {
                        self.numberOfFiles -= 1
                        self.pickedDocument?(bean)
                        if self.numberOfFiles == 0 {
                            completion(.completed)
                        }
                    }
                }
            case .folders:
                numberOfFiles = (filesToCount!.allObjects.count - 1)
                
                for case let fileURL as URL in fileList! {
                    if !fileURL.isDirectory && !fileURL.isDSFile {
                        documentFromURL(url: fileURL) { status, bean in
                            DispatchQueue.main.async {
                                self.numberOfFiles -= 1
                                self.pickedDocument?(bean)
                                if self.numberOfFiles == 0 {
                                    completion(.completed)
                                }
                            }
                        }
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.status = .completed
            }
            
        }
    }
    
    private func generateThumbnailRepresentations(url: URL?, completion: @escaping ((UIImage?, UIImage?) -> ())) {
        
        guard let url = url else {
            completion(nil, nil)
            return
        }
        
        var counter = 0

        var thumbnailImages: (thumbnail: UIImage?, Icon: UIImage?)
        thumbnailImages = (thumbnail: nil, Icon: nil )
        
        let size: CGSize = CGSize(width: 60, height: 90)
        let scale = UIScreen.main.scale
        
        let request = QLThumbnailGenerator.Request(fileAt: url,
                                                   size: size,
                                                   scale: scale,
                                                   representationTypes: .all)
        
        let generator = QLThumbnailGenerator.shared
        generator.generateRepresentations(for: request) { (thumbnail, type, error) in
            counter += 1

            if thumbnail == nil || error != nil {
                print("error getting thumbnail")
            } else {
                if thumbnail?.type == .thumbnail {
                    thumbnailImages.thumbnail = thumbnail!.uiImage
                }
                if thumbnail?.type == .icon {
                    thumbnailImages.Icon = thumbnail!.uiImage
                }
            }
            if counter == 2 {
                completion(thumbnailImages.thumbnail, thumbnailImages.Icon)
            }
          
        }
    }
    
}

