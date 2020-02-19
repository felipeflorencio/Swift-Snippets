//
//  DeviceStatus.swift
//
//  Created by Felipe Florencio Garcia on 19/02/2020.
//  Copyright © 2020 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import AudioToolbox

class DeviceStatus {

    /*
        In order to use, make sure you added also the audio file
        'mute.aiff', it's a file that has a lenght but will not 
        actually play anything, but we can use to measure if was 
        played
    */
    
    static func isOnMuteState(muted: @escaping (Bool) -> Void) {
        var soundId: SystemSoundID = 1
        
        let mutedState: (Bool) -> Void = { isMuted in
            muted(isMuted)
        }
        
        if let customSoundUrl = Bundle.main.url(forResource: "mute", withExtension: "aiff") {
            if AudioServicesCreateSystemSoundID(customSoundUrl as CFURL, &soundId) == kAudioServicesNoError {
                var yes: UInt32 = 1
                AudioServicesSetProperty(kAudioServicesPropertyIsUISound,
                                         UInt32(MemoryLayout.size(ofValue: soundId)),
                                         &soundId,
                                         UInt32(MemoryLayout.size(ofValue: yes)),
                                         &yes)
                let interval = Date.timeIntervalSinceReferenceDate

                AudioServicesPlaySystemSoundWithCompletion(soundId, {
                    let elapsed = Date.timeIntervalSinceReferenceDate - interval
                    let isMuted = elapsed < 0.1
                    mutedState(isMuted)
                })
            } else {
                debugPrint("Failed to setup sound player, set as not muted")
                soundId = 0
                mutedState(false)
            }
        } else {
            mutedState(false)
        }
    }
}
