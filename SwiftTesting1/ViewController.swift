//
//  ViewController.swift
//  SwiftTesting1
//
//  Created by İsa Anıl Koca on 25.08.2026.
//

import UIKit
// UIKit tabanlı arayüz: UIViewController ve UITableView kullanımı

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource { // Liste ekranı: tabloyu yönetir ve kullanıcı etkileşimlerini işler
    
    
    var toDoList = [String]()  // Model: yapılacaklar dizisi (en yeni öğe başa eklenir)


    @IBOutlet weak var tableView: UITableView!  // Arayüzdeki tabloya bağlanan IBOutlet
    
    // Yaşam döngüsü: görünüm yüklendiğinde tabloyu hazırla
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self  // Veri kaynağı: satır sayısı ve hücre içeriği
        tableView.delegate = self  // Davranış: seçim/silme gibi etkileşimler
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")  // Basit hücre kaydı (reuse identifier: "cell")
        // Do any additional setup after loading the view.
        
    }

    // Add butonuna basıldığında yeni öğe eklemek için alert göster
    @IBAction func addClicked(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Add Item", message: "Enter your todo item", preferredStyle: .alert)  // Başlık, mesaj ve stil ile alert oluştur
        
        // Kullanıcıdan metin almak için bir text field ekle
        alert.addTextField { textField in
            
            textField.placeholder = "Enter Item"  // Placeholder metni
            
            // OK eylemi: metni al, listeye ekle ve tabloyu güncelle
            let okButton = UIAlertAction(title: "OK", style: .default) { action in
                
                guard let textField = alert.textFields?[0], let inputText = textField.text, !inputText.isEmpty else {  // Boş metinleri engelle
                    
                    return
                    
                }
                self.toDoList.insert(inputText, at: 0)  // Yeni öğeyi listenin başına ekle
                self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)  // Tabloya yeni satır ekleme animasyonu
                        
            } // OK butonuna tıklandığında yapılacak işlemler handler içinde
            
            alert.addAction(okButton)  // Alert'e OK eylemini ekle
            self.present(alert, animated: true)  // Alert'i kullanıcıya göster
        }
        
    }

    // UITableViewDataSource: kaç satır gösterileceğini bildir
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count  // Liste uzunluğu kadar satır
    }
    
    // UITableViewDataSource: her satır için hücre oluştur/yeniden kullan
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)  // Kayıtlı hücreyi yeniden kullan
        var content = cell.defaultContentConfiguration()  // Varsayılan içerik yapılandırması
        content.text = toDoList[indexPath.row]  // Hücre metni: ilgili to-do
        cell.contentConfiguration = content  // İçeriği hücreye uygula
        return cell  // Hücreyi döndür
    }
    
    // Silme desteği: sola kaydırarak Delete ile öğe silme
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {  // Kullanıcı Delete'i tetiklediyse
            self.toDoList.remove(at: indexPath.row)  // Modelden öğeyi kaldır
            tableView.deleteRows(at: [indexPath], with: .automatic)  // Tablodan satırı sil ve animasyon uygula
        }
    }
    
    
}

