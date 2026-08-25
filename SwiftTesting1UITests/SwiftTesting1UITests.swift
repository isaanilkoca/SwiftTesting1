//
//  SwiftTesting1UITests.swift
//  SwiftTesting1UITests
//
//  Created by İsa Anıl Koca on 25.08.2026.
//

import XCTest
// XCUITest ve assertion (doğrulama) API'lerini kullanmak için gerekli framework

final class SwiftTesting1UITests: XCTestCase { // UI testleri bu sınıfta; XCTestCase'den türeyerek test fonksiyonlarını çalıştırır
    @MainActor // UI ile etkileşimler ana aktörde (main thread) çalışmalı

    func testToDoItem() throws {
        // 1) Uygulamayı başlat: UI testleri çalıştırılacak uygulamayı açmalı
        // Test edeceğimiz uygulama nesnesini oluşturur
        let app = XCUIApplication() // Uygulama referansı
        app.launch() // Uygulamayı başlatır

        // Navigation bar içindeki "Add" butonunu erişilebilirlik etiketleriyle bul
        let addButton = app.navigationBars["SwiftTesting1.View"].buttons["Add"] // Yeni öğe eklemek için dokunacağımız buton

        // "Add Item" başlıklı alert'in iç hiyerarşisine eriş
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements // Alert içindeki ortak kök
        let textField = elementsQuery.collectionViews.textFields["Enter Item"] // Kullanıcıdan yeni to-do girdisini alacağımız metin alanı
        let okButton = elementsQuery.buttons["OK"] // Alert'i onaylayıp ekleme işlemini tamamlar

        // Ekleme sonrası tabloda görünmesini beklediğimiz hücre tanımı
        let addedCell = app.tables.cells.containing(.staticText, identifier: "my to do").element // Doğrulamada kullanılacak hedef öğe

        // — Kullanıcı akışını simüle et —
        addButton.tap() // Add butonuna dokunur, alert açılır
        textField.tap() // Metin alanını odaklar
        textField.typeText("my to do") // Metni yazar
        okButton.tap() // Onaylar ve öğeyi ekler

        XCTAssertTrue(addedCell.exists) // Hücre görünüyorsa test geçer

        // Not: Daha sağlamlık için waitForExistence(timeout:) kullanılabilir
    }

    func testDeleteItem() throws {
        // 1) Uygulamayı başlat ve silme senaryosu için gerekli öğeleri hazırla
        // Yeni bir test olduğu için uygulamayı temiz başlangıçla açarız
        let app = XCUIApplication() // Uygulama referansı
        app.launch() // Uygulamayı başlatır
        
        let addButton = app.navigationBars["SwiftTesting1.View"].buttons["Add"] // Silmeden önce eklenecek öğe için Add butonu
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements // Alert içeriğine erişim kökü
        let textField = elementsQuery.collectionViews.textFields["Enter Item"] // Eklenecek metni yazacağımız alan
        let okButton = elementsQuery.buttons["OK"] // Ekleme onayı
        let addedCell = app.tables.cells.containing(.staticText, identifier: "my to do").element // Silinecek öğeyi temsil eden hücre
        
        // Tablo ve kaydırarak silme (swipe-to-delete) öğeleri
        let tablesQuery = app.tables // Tablo hiyerarşisi
        let deleteButton = tablesQuery.buttons["Delete"] // Sola kaydırınca çıkan Delete butonu
        
        // — Önce öğeyi ekle (setup) —
        addButton.tap() // Alert'i aç
        textField.tap() // Metin alanını odakla
        textField.typeText("my to do") // Metni yaz
        okButton.tap() // Ekleme işlemini tamamla
         
        // — Sonra silme adımı —
        addedCell.swipeLeft() // Hücreyi sola kaydırarak Delete'i görünür yap
        deleteButton.tap() // Delete'e dokunarak sil
        
        XCTAssertFalse(addedCell.exists) // Hücre artık yoksa test geçer
    }
}

