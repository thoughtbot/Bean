
import Foundation

extension URL {
    var isDirectory: Bool! {
        return (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory
    }
    
    var isDSFile: Bool! {
        return self.lastPathComponent == ".DS_Store"
    }
    
    var creationDate: Date? {
        return (try? resourceValues(forKeys: [.creationDateKey]))?.creationDate
    }
    
    var name: String? {
        return (try? resourceValues(forKeys: [.nameKey]))?.name
    }
    
}
