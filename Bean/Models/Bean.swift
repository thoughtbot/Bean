
import UIKit

@available(iOS 11.0, *)
public class Bean: UIDocument {
    
    public private(set) var data: Data?
    public private(set) var fileName: String?
    public private(set) var typeName: String?
    public private(set) var thumbnail: UIImage?
    public private(set) var creationDate: Date?
    
    convenience init(url: URL, thumbnail: UIImage?) {
        self.init(fileURL: url)
        self.thumbnail = thumbnail
        fileName = self.fileURL.lastPathComponent
        creationDate = url.creationDate
    }
    
    override public var description: String {
        return fileURL.deletingPathExtension().lastPathComponent
    }
    
    override public func contents(forType typeName: String) throws -> Any {
        guard let data = data else { return Data() }
        
        return try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: true)
    }
    
    override public func load(fromContents contents: Any, ofType typeName: String?) throws {
        
        guard let data = contents as? Data else { return }
        self.data = data
        self.typeName = typeName
    }
    
}
