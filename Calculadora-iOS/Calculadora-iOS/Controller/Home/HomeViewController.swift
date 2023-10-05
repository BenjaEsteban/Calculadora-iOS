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
    private var operation OperationType = .none
    
    // MARK: - Constantes
    
    private enum OperationType {
        case none, addiction, substraction, multiplication, division, percent
             
    }
    
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
    }

    // MARK: - Button Action
    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorPlusAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorPorcenAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorMultAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorSusAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorAddAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func operatorResultAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    
}
