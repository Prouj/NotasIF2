//
//  NotaIF2UITests.swift
//  NotaIF2UITests
//
//  Created by Paulo Uchôa on 08/02/21.
//

import XCTest
import ToastUI

class NotaIF2UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
                
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Matérias"].buttons["plus"].tap()
        app.textFields["Entre com o nome da matéria aqui ..."].tap()

        let app2 = app
        app2/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        let rkey = app.keys["r"]
        rkey.tap()
        
        let tkey = app.keys["t"]
        tkey.tap()
        
        let eKey = app.keys["e"]
        eKey.tap()
        

        app2/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"retorno\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()

        let staticText = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .staticText).matching(identifier: "0.00").element(boundBy: 0)
        staticText.tap()

        let key = app2/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        staticText.tap()

        let key2 = app2/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        app.staticTexts["0.00"].tap()

        let key3 = app2/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        app.navigationBars["Nova Matéria"].buttons["OK"].tap()
        
        
        XCUIApplication().scrollViews.otherElements.buttons["Arte, 0.02"].tap()

        let ttgc7swiftuip137fff57adc30428destinationhostingNavigationBar = app.navigationBars["_TtGC7SwiftUIP13$7fff57adc30428DestinationHosting"]
        ttgc7swiftuip137fff57adc30428destinationhostingNavigationBar.buttons["ellipsis"].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Editar"]/*[[".cells.buttons[\"Editar\"]",".buttons[\"Editar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["Arte"].tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["B"]/*[[".keyboards.keys[\"B\"]",".keys[\"B\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        
        staticText.tap()
        
        let key4 = app2/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        staticText.tap()
        
        let key5 = app2/*@START_MENU_TOKEN@*/.keys["8"]/*[[".keyboards.keys[\"8\"]",".keys[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        app.staticTexts["0.00"].tap()
        app/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Editar"].buttons["OK"].tap()
        
        ttgc7swiftuip137fff57adc30428destinationhostingNavigationBar.buttons["Matérias"].tap()
                
        XCUIApplication().scrollViews.otherElements.buttons["B, 0.07"].tap()
       
        ttgc7swiftuip137fff57adc30428destinationhostingNavigationBar.buttons["ellipsis"].tap()
        app.collectionViews.buttons["Deletar"].tap()
        
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
