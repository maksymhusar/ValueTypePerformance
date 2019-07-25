//
//  ValueTypePerformanceTests.swift
//  ValueTypePerformanceTests
//
//  Created by Maksym Husar on 7/26/19.
//  Copyright © 2019 MaksymHusar. All rights reserved.
//

import XCTest
@testable import ValueTypePerformance

class ValueTypePerformanceTests: XCTestCase {
    static let iterationCount = 10_000_000
    
    // ======= Performance Tests ========
    func testPerformanceIntStruct() {
        self.measure {
            runIntStruct()
        }
    }
    
    func testPerformanceStringStruct() {
        self.measure {
            runStringStruct()
        }
    }
    
    func testPerformanceIntClass() {
        self.measure {
            runIntClass()
        }
    }
    
    func testPerformanceStringClass() {
        self.measure {
            runStringClass()
        }
    }
    
    func testPerformanceEnumStruct() {
        self.measure {
            runEnumStruct()
        }
    }
    func testPerformanceEnumStringStruct() {
        self.measure {
            runEnumStringStruct()
        }
    }
    
    // ======= Loop copy Methods ========
    @inline(never) func runIntStruct() {
        let obj = IntStruct()
        var res = 0
        for i in 0..<ValueTypePerformanceTests.iterationCount {
            var copy = obj
            copy.i = i
            res += calculate(copy)
        }
        print(res)
    }
    @inline(never) func runIntClass() {
        let obj = IntClass()
        var res = 0
        for i in 0..<ValueTypePerformanceTests.iterationCount {
            var copy = obj
            copy.i = i
            res += calculate(copy)
        }
        print(res)
    }
    @inline(never) func runStringStruct() {
        let obj = StringStruct()
        var res = 0
        for i in 0..<ValueTypePerformanceTests.iterationCount {
            var copy = obj
            copy.i = i
            res += calculate(copy)
        }
        print(res)
    }
    @inline(never) func runStringClass() {
        let obj = StringClass()
        var res = 0
        for i in 0..<ValueTypePerformanceTests.iterationCount {
            var copy = obj
            copy.i = i
            res += calculate(copy)
        }
        print(res)
    }
    
    @inline(never) func runEnumStruct() {
        let obj = EnumStruct()
        var res = 0
        for i in 0..<ValueTypePerformanceTests.iterationCount {
            var copy = obj
            copy.i = i
            res += calculate(copy)
        }
        print(res)
    }
    @inline(never) func runEnumStringStruct() {
        let obj = EnumStringStruct()
        var res = 0
        for i in 0..<ValueTypePerformanceTests.iterationCount {
            var copy = obj
            copy.i = i
            res += calculate(copy)
        }
        print(res)
    }
    
    // ======= Calculation Methods ======
    @inline(never) func calculate(_ value: IntStruct) -> Int {
        return value.i ^ 0x746f
    }
    @inline(never) func calculate(_ value: IntClass) -> Int {
        return value.i ^ 0x746f
    }
    @inline(never) func calculate(_ value: StringStruct) -> Int {
        return value.i ^ 0x746f
    }
    @inline(never) func calculate(_ value: StringClass) -> Int {
        return value.i ^ 0x746f
    }
    @inline(never) func calculate(_ value: EnumStruct) -> Int {
        return value.i ^ 0x746f
    }
    @inline(never) func calculate(_ value: EnumStringStruct) -> Int {
        return value.i ^ 0x746f
    }
}

