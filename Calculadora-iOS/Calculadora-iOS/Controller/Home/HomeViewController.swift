//
//  HomeViewController.swift
//  Calculadora-iOS
//
//  Created by Benjamín on 03-10-23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    // Resultado
    @IBOutlet weak var resultLabel: UILabel!
    
    // Numeros
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    // Operadores
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlus: UIButton!
    @IBOutlet weak var operatorPorcen: UIButton!
    @IBOutlet weak var operatorDivisor: UIButton!
    @IBOutlet weak var operatorMult: UIButton!
    @IBOutlet weak var operatorSubtraction: UIButton!
    @IBOutlet weak var operatorAdition: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    
    // MARK: - Variables
    
    private var total: Double = 0 // Total
    private var temp: Double = 0 // Valor por pantalla
    private var operating = false // Estado de seleccion de un operador
    private var decimal = false // Estado si el valor es decimal
    private var operation: OperationType = .none
    
    // MARK: - Constantes
    
    private let decimalSeparator = Locale.current.decimalSeparator!
    private let maxLength = 9
    private let maxValue: Double = 999999999
    private let minValue: Double = 0.00000001
    
    private enum OperationType {
        case none, addiction, substraction, multiplication, division, percent
    }
    
    // Formateo de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    //Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 9
        
        return formatter
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlus.round()
        operatorMult.round()
        operatorPorcen.round()
        operatorDivisor.round()
        operatorAdition.round()
        operatorSubtraction.round()
        operatorResult.round()
        
        numberDecimal.setTitle(decimalSeparator, for: .normal)
        
        result()
    }

    // MARK: - Button Action
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func operatorPlusAction(_ sender: UIButton) {
        temp *= (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func operatorPorcenAction(_ sender: UIButton) {
        if operation != .percent {
            result()
        }
        
        operating = true
        operation = .percent
        result()
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .division
        sender.shine()
    }
    
    @IBAction func operatorMultAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .multiplication
        sender.shine()
    }
    
    @IBAction func operatorSusAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .substraction
        sender.shine()
    }
    
    @IBAction func operatorAddAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .addiction
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= maxLength {
            return
        }
        
        resultLabel.text = resultLabel.text! + decimalSeparator
        decimal = true
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        operatorAC.setTitle("C", for: .normal)
        
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= maxLength {
            return
        }
        
        // Selección de operación
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        // Selección de decimal
        if decimal {
            currentTemp = "\(currentTemp)\(decimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    // Limpia los valores
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
        }
    }
    
    // Obtiene el resultado final
    private func result() {
        switch operation {
            
        case .none:
            break
        case .addiction:
            total += temp
            break
        case .substraction:
            total -= temp
            break
        case .multiplication:
            total *= temp
            break
        case .division:
            total /= temp
            break
        case .percent:
            temp /= 100
            total = temp
            break
        }
        
        // Formateo en pantalla
        if total <= maxValue || total >= minValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        print(total)
    }
    
}
