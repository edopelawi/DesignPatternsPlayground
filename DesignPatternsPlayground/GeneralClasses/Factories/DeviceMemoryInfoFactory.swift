//
//  DeviceMemoryInfoFactory.swift
//  DesignPatternsPlayground
//
//  Created by Ricardo Pramana Suranta on 1/27/16.
//  Copyright © 2016 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

enum DeviceMemoryInfoUsageType {
    case virtualMemory
    case residentMemory
}

class DeviceMemoryInfoFactory {
    
    /// Retrieves currently used memory with passed `usageType`. Returns `Int64` value.
    /// - note: Will return -1 if fails.
    static func currentUsedMemory(_ usageType: DeviceMemoryInfoUsageType) -> Int64 {
        
        var info = task_basic_info()
        let infoSize = MemoryLayout.size(ofValue: info)

        // TODO: Research on why it should be divided by 4.
        var count = mach_msg_type_number_t(infoSize)/4
        
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &info) {
			
			$0.withMemoryRebound(to: integer_t.self, capacity: 1) {
				task_info(mach_task_self_,
				          task_flavor_t(MACH_TASK_BASIC_INFO),
				          $0,
				          &count)
			}
			
			
//            task_info(
//                mach_task_self_,
//                task_flavor_t(TASK_BASIC_INFO),
//                task_info_t($0),
//                &count
//            )
            
        }
        
        if kerr != KERN_SUCCESS {
            return -1
        }
        
        var usedMemory: vm_size_t
        
        switch usageType {
        case .virtualMemory: usedMemory = info.virtual_size
        case .residentMemory: usedMemory = info.resident_size
        }
        
        return Int64(usedMemory)
    }
    
    /// Returns `Int64` representation of current device's total memory.
    /// - note: Will return -1 if fails.
    static func totalMemory() -> Int64 {
        
        var requestedInfo = [CTL_HW, HW_MEMSIZE]
        var size = Int64(0)
        var len = MemoryLayout<Int64>.size
        
        let result = sysctl(&requestedInfo, 2, &size, &len, nil, 0)
        let resultRetrieved = result == 0
        
        if resultRetrieved {
            return size
        } else {
            return -1
        }
    }
    
}
