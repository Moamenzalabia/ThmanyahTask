//
//  HomeInteractorTests.swift
//  ThmanyahTaskTests
//
//  Created by Moamen on 25/11/2023.
//

import XCTest
@testable import ThmanyahTask

class HomeTableViewCellTests: XCTestCase {
    var tableViewCell: HomeTableViewCell?
    var mockDataService: MockPlayListDataService?
    var dataSource: HomePlayListEntity?
    
    override func setUp() {
        super.setUp()
        tableViewCell = HomeTableViewCell.loadXib()
        mockDataService = MockPlayListDataService()
    }
    
    override func tearDown() {
        tableViewCell = nil
        mockDataService = nil
        dataSource = nil
        super.tearDown()
    }
    
    func testFetchPlaylistSuccess() {
        mockDataService?.fetchPlaylist(id: "test", completion: { viewModel, error in
            self.dataSource = viewModel
        })
        let viewModel = HomePlaylistViewModel(entity: dataSource)
        tableViewCell?.dataSource = viewModel
                
        XCTAssertNil(tableViewCell?.playlistNameLable.text)
        XCTAssertNil(tableViewCell?.playlistDescriptionLable.text)
    }

}

extension UIView {
    public class func loadXib<T: UIView>(bundle: Bundle = Bundle.main, nibName: String = String("\(T.self)")) -> T? {
        return bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? T
    }
}
