/**
 * This file is auto-generated by tgen
 * Don't change manually
 */

import Foundation

// structs

class TBasic: EZObject {

    override var allKeys: Set<String> {
        return []
    }

    override func fromJSON(jsonObject: AnyObject?) -> Bool {
        guard super.fromJSON(jsonObject) else { return false }

        guard let dict = jsonObject as? [String: AnyObject] else { return false }

        return true
    }

    override func toJSON() -> AnyObject {
        var dict = [String: AnyObject]()

        return dict
    }

}

// services

class BasicService: NSObject {

    class func getName(success: (String) -> Void, failure: ((NSError) -> Void)? = nil) -> String? {
        let params = [String: AnyObject]()
        let api = "BasicService.getName"

        debugPrint("api", " req: ", params)

        AreaService.current?.JSRONPRCClient.invokeMethod(api, withParameters: params, success: { (operation, responseObject) -> Void in
            debugPrint(api, " resp: ", responseObject);

            success(responseObject as? String ?? "")
            }, failure: { (operation, error) -> Void in
                failure?(error)
        })
    }

    class func getServiceName(id: Int64, success: (String) -> Void, failure: ((NSError) -> Void)? = nil) -> String? {
        var params = [String: AnyObject]()
        params["id"] = NSNumber(longLong: id)

        let api = "BasicService.getServiceName"

        debugPrint("api", " req: ", params)

        AreaService.current?.JSRONPRCClient.invokeMethod(api, withParameters: params, success: { (operation, responseObject) -> Void in
            debugPrint(api, " resp: ", responseObject);

            success(responseObject as? String ?? "")
            }, failure: { (operation, error) -> Void in
                failure?(error)
        })
    }

    class func getStruct(key: Int, id: Int64, success: (TBasic) -> Void, failure: ((NSError) -> Void)? = nil) -> TBasic? {
        var params = [String: AnyObject]()
        params["key"] = key
        params["id"] = NSNumber(longLong: id)

        let api = "BasicService.getStruct"

        debugPrint("api", " req: ", params)

        AreaService.current?.JSRONPRCClient.invokeMethod(api, withParameters: params, success: { (operation, responseObject) -> Void in
            debugPrint(api, " resp: ", responseObject);

            success(TBasic(jsonObject: responseObject)!)
            }, failure: { (operation, error) -> Void in
                failure?(error)
        })
    }

}
