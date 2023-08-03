//
//  swift
//  FUSHENG
//
//  Created by JmoVxia on 2019/12/24.
//  Copyright © 2019 FuSheng. All rights reserved.
//

import DateToolsSwift
import UIKit

extension CLPopoverManager {
    @discardableResult static func showCalendar(configCallback: ((CLPopoverConfig) -> Void)? = nil) -> String {
        return mainSync {
            let controller = CLPopupCalendarController()
            configCallback?(controller.config)
            controller.show()
            return controller.key
        }
    }
}
