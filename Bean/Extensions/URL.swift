
import Foundation

extension URL {
    var isDirectory: Bool! {
        return (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory
    }
    
    var isDSFile: Bool! {
        return self.lastPathComponent == ".DS_Store"
    }
    
}
