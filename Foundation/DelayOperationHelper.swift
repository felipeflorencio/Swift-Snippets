//
//  DelayOperationHelper.swift
//
//  Created by Felipe Florencio Garcia on 26/07/18.
//  Copyright © 2018 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

	/* Helper to have a delay to a specif need
	   It's happen for different reason's, some good some not that good, but, you need delay a operation
	   for this we have different approachs, but it's with this helper you will be able to do this in a
	   clean and easy way, and extend NSObject, so you can easy use this, or event implement in your class

	   How to use:

	   Just need to be inside any NSObject class type, and do like
	   self.delayOperation(delay: seconds, closure: {
	   		// Do the action that you intend too.
	   })

	   But, as I said, only to NSObject class, but for struct you just need to implement the protocol :D 

	*/

public protocol DelayOperation {
	func delayOperation(delay: Double, closure:@escaping () -> Void)
}

public extension DelayOperation {
	public func delayOperation(delay: Double, closure:@escaping () -> Void) {
		DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
			closure()
		}
	}
}

extension NSObject: DelayOperation {}