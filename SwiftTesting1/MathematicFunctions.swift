//
//  MathematicFunctions.swift
//  SwiftTesting
//
//  Created by İsa Anıl Koca on 25.08.2026.
//

import Foundation
// Basit aritmetik işlemlerini sağlayan sınıf

class MathematicFunctions { // Üretim kodu: testlerde kullanılacak fonksiyonlar burada
    
    // Not: Bu fonksiyonların doğruluğu birim testlerle (XCTest) kontrol edilir
    
    // Toplama: x + y
    func addInteger(x: Int, y: Int) -> Int {
        return x + y // Sonucu döner
    }
    
    // Çıkarma: x - y
    func subInteger(x: Int, y: Int) -> Int {
        return x - y // Sonucu döner
    }
    
    // Çarpma: x * y
    func multiplyInteger(x: Int, y: Int) -> Int {
        return x * y // Sonucu döner
    }
    
    // Bölme: x / y (Not: y'nin 0 olmamasına dikkat edin)
    func divideInteger(x: Int, y: Int) -> Int {
        return x / y // Tamsayı bölme yapar
    }
    
}
