//
//  SwiftTesting1Tests.swift
//  SwiftTesting1Tests
//
//  Created by İsa Anıl Koca on 25.08.2026.
//

import XCTest
// XCTest: birim testleri ve assertion fonksiyonları için temel framework
@testable import SwiftTesting1 // Üretim kodunu test edilebilir kılar (iç türlere erişim)

final class SwiftTesting1Tests: XCTestCase { // Birim testleri bu sınıfta toplanır

    let math = MathematicFunctions() // Testlerde kullanılacak hesaplama nesnesi (SUT: System Under Test)
    
    // Toplama fonksiyonunu test eder
    func testAddIntegerFunctions(){
        
        // 1) Hazırlık ve çağrı: 10 + 5 işlemini çalıştır
        let result = math.addInteger(x: 10, y: 5) // Sonucu result değişkenine al
        // 2) Doğrulama: Beklenen sonuç 15 olmalı
        XCTAssertEqual(result, 15) // result 15'e eşitse test geçer; değilse fail olur
        
        
    }
    // Çıkarma (subtraction) fonksiyonunu test eder
    func testsubIntegerFunctions(){
        
        // 1) 10 - 5 işlemini çalıştır
        let result = math.subInteger(x: 10, y: 5) // Sonucu al
        // 2) Beklenen sonuç 5 olmalı
        XCTAssertEqual(result, 5) // 5'e eşit değilse test fail olur
        
        
    }
    // Çarpma (multiplication) fonksiyonunu test eder
    func testmultiplyIntegerFunctions(){
        
        // 1) 10 * 5 işlemini çalıştır
        let result = math.multiplyInteger(x:10 , y: 5 ) // Sonucu al
        // 2) Beklenen sonuç 50 olmalı
        XCTAssertEqual(result, 50) // 50 değilse test fail olur
        
        
    }
    // Bölme (division) fonksiyonunu test eder
    func testdivideIntegerFunctions(){
        
        // 1) 10 / 5 işlemini çalıştır
        let result = math.divideInteger(x: 10, y: 5) // Sonucu al
        // 2) Beklenen sonuç 2 olmalı
        XCTAssertEqual(result, 2) // 2 değilse test fail olur
        
    }

}
