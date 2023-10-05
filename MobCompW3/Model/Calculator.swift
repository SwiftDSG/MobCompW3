//
//  Calculator.swift
//  MobCompW3
//
//  Created by MacBook Pro on 05/10/23.
//

import Foundation

var calculator = Calculator()

enum CalculatorOperator {
    case Add
    case Subtract
    case Multiply
    case Divide
    case Root
    case Power
}

class Calculator: ObservableObject {
    @Published var input: String
    @Published var chain: [String]
    
    private var clearable = false
    
    func add_input_point() {
        if input.firstIndex(of: ".") == nil {
            input += "."
        }
        clearable = false
    }
    func add_input_number(number: String) {
        if input == "0" || clearable {
            input = number
        } else {
            input += number
        }
        clearable = false
    }
    func add_operator(name: String) {
        if let last = chain.last {
            if Float(last) == nil {
                chain.removeLast()
            }
        }
        
        chain.append(name)
    }
    func calculate(final: Bool) {
        chain.append(input)
        
        if chain.count == 1 {
            input = chain[0]
        } else {
            var command_chain = chain
            var value = ""
            print("START!")
            while command_chain.count > 1 {
                var priority = -1
                var priority_index = -1
                for (i, command) in command_chain.enumerated() {
                    if command == "power" || command == "root" {
                        priority = 2
                        priority_index = i
                        break
                    } else if (command == "multiply" || command == "divide") && priority < 1 {
                        priority = 1
                        priority_index = i
                    } else if (command == "add" || command == "subtract") && priority < 0 {
                        priority = 0
                        priority_index = i
                    }
                }
                print(priority)
                print(command_chain)
                if priority_index >= 1 {
                    let start = priority_index - 1
                    let end = priority_index + 1
                    if let start_value = Float(command_chain[start]), let end_value = Float(command_chain[end]) {
                        
                        if command_chain[priority_index] == "power" {
                            value = String(pow(start_value, end_value))
                        } else if command_chain[priority_index] == "root" {
                            value = String(start_value < 0 ? -pow(-start_value, 1 / end_value) : pow(start_value, 1 / end_value))
                        } else if command_chain[priority_index] == "multiply" {
                            value = String(start_value * end_value)
                        } else if command_chain[priority_index] == "divide" {
                            value = String(start_value / end_value)
                        } else if command_chain[priority_index] == "add" {
                            value = String(start_value + end_value)
                        } else {
                            value = String(start_value - end_value)
                        }
                        command_chain.replaceSubrange(start...end, with: [value])
                    } else {
                        clear()
                        break
                    }
                }
            }
            
            if let index = value.firstIndex(of: ".") {
                if value[index..<value.endIndex] == ".0" {
                    value.replaceSubrange(index..<value.endIndex, with: "")
                }
            }
            
            if final {
                chain = []
            }
            input = value
            print("\n")
        }
        clearable = true
    }
    func clear() {
        if input != "0" {
            input = "0"
        } else {
            chain = []
        }
    }
    
    init() {
        input = "0"
        chain = []
    }
}
