
import UIKit

@available(iOS 11.0, *)
public class Bean: UIDocument {
    
    public var data: Data?
    public var fileName: String?
    public var typeName: String?
    public var thumbnail: UIImage?
    
    convenience init(url: URL, thumbnail: UIImage?) {
        self.init(fileURL: url)
        self.thumbnail = thumbnail
        fileName = self.fileURL.lastPathComponent
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
