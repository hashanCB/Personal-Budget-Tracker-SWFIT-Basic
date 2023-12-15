import UIKit

struct Expense {
    var name : String
    var amount : Double
    var category : expensecate
    var date : Date?
    
    
}
enum expensecate {
    case groceries
    case utilities
    case enterinment
    
}
class BudgetManager {
    
    var Pepenses : [Expense] = []
    
    func addbudget (toinput : Expense){
        Pepenses.append(toinput)
    }
    
    func removebudget (index : Int){
        if( index > 0 && Pepenses.count >= index ){
            Pepenses.remove(at: index)
        }
    }
    
    func displaycategorize () {
        for value in Pepenses {
            var dateString : String
            
            if let expectdate = value.date {
                 
                var dateFomant = DateFormatter()
                dateFomant.dateFormat = "yyyy-MM"
                dateString = dateFomant.string(from: expectdate)
                
            }
            else {
                dateString = "No Enter Date "
            }
            
            
            
            print("user budget \(value.name) , \(value.category ) , \(dateString) ")
        }
    }
    
    
    func calculateTotalExpenditure() -> Double {
          return Pepenses.reduce(0, { $0 + $1.amount } )
      }
    
    func calculateToalExpenCata (tocat : expensecate) -> Double {
        var calex = Pepenses.filter {$0.category ==  tocat}.reduce( 0 , { $0 + $1.amount})
        return calex
    }
    
    func calculateTotalByCategory(category: expensecate) -> Double {
          return Pepenses.filter { $0.category == category }.reduce(0) { $0 + $1.amount }
      }
}


var newexpress = BudgetManager()

var bug1 = Expense(name: "laptop", amount: 120.30, category: .enterinment, date: Date())
var bug2 = Expense(name: "iphone", amount: 500, category: .enterinment)

newexpress.addbudget(toinput: bug2)
newexpress.addbudget(toinput: bug1)
newexpress.displaycategorize()
let total = newexpress.calculateTotalExpenditure()
print (total)

let totalcat = newexpress.calculateTotalByCategory(category :  expensecate.enterinment)
print (totalcat)

