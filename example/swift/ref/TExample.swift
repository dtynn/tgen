/**
 * This file is auto-generated by tgen
 * Don't change manually
 */

import Foundation

class TRExample: EzObject {
    var amountAvailable: Double = 0.0

    var rebateAmountAvailable: String?

    var amountPendingVerification: Bool = false

    var pendingWithdrawAmount: Int = 0

    var unpaidAmount: Int64 = 0

    var fooes: [TRFoo]?

    var strs: [String]?

    var ints: [Int]?

    override var allKeys: Set<String> {
        return ["amountAvailable", "rebateAmountAvailable", "amountPendingVerification", "pendingWithdrawAmount", "unpaidAmount", "fooes", "strs", "ints"]
    }

    override func fromJSON(jsonObject: AnyObject?) -> Bool {
        guard super.fromJSON(jsonObject) else { return false }

        guard let dict = jsonObject as? [String: AnyObject] else { return false }
        amountAvailable = dict["amountAvailable"] as? Double ?? 0.0
        rebateAmountAvailable = dict["rebateAmountAvailable"] as? String
        amountPendingVerification = dict["amountPendingVerification"] as? Bool ?? false
        pendingWithdrawAmount = dict["pendingWithdrawAmount"] as? Int ?? 0
        unpaidAmount = dict["unpaidAmount"] as? Int64 ?? 0
        fooes = [TRFoo](jsonObject: dict["fooes"])
        strs = dict["strs"] as? [String]
        ints = dict["ints"] as? [Int]

        return true
    }

    override func toJSON() -> AnyObject {
        var dict = [String: AnyObject]()
        dict["amountAvailable"] = amountAvailable
        dict["rebateAmountAvailable"] = rebateAmountAvailable
        dict["amountPendingVerification"] = amountPendingVerification
        dict["pendingWithdrawAmount"] = pendingWithdrawAmount
        dict["unpaidAmount"] = NSNumber(longLong: unpaidAmount)
        dict["fooes"] = fooes?.toJSON()
        dict["strs"] = strs
        dict["ints"] = ints

        return dict
    }
}