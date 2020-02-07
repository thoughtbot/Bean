import XCTest
@testable import Bean

@available(iOS 13.0, *)
final class BeanTests: XCTestCase {
    
    var sut: BFileManager!
    var testURL: URL!

    override func setUp() {
        super.setUp()
        sut = BFileManager.current
        testURL = Bundle(for: type(of: self)).url(forResource: "file01", withExtension: "png")!
        
    }

    override func tearDown() {
        sut = nil
        testURL = nil
        super.tearDown()
    }

    func testManager_whenStated_statusIsStarted() {
        sut.start(selectedURL: testURL, sourceType: .files)
        XCTAssertEqual(sut.status, .inProgress)
    }
    
    func testManager_withFile_createsThumbnail() {
        var thumbnailImage: UIImage?
        let expectation = self.expectation(description: "created thumbnail")
        sut.generateThumbnailRepresentations(url: testURL) { thumbnail, icon  in
            thumbnailImage = thumbnail != nil ? thumbnail : icon
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(thumbnailImage)
    }
    
    func testManager_whenURLread_statusIsCompleted() {
        let expectation = self.expectation(description: "status is completed")
        var status: Status = .inProgress
        sut.readURL(url: testURL, with: .files) { newStatus in
            status = newStatus
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(status, .completed)
    }

    static var allTests = [
        ("testManager_whenStated_statusIsStarted", testManager_whenStated_statusIsStarted),
        ("testManager_withFile_createsThumbnail", testManager_withFile_createsThumbnail),
        ("testManager_whenURLread_statusIsCompleted", testManager_whenURLread_statusIsCompleted),
        
    ]
}
