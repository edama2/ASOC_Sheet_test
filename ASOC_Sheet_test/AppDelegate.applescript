--
--  AppDelegate.applescript
--  ASOC_Sheet_test
--
--  Created by zzz on 2021/10/11.
--  Copyright � 2021 zzz. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property theWindow : missing value
	
	on applicationShouldTerminate:sender
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
	#MARK: window�������I��
	on applicationShouldTerminateAfterLastWindowClosed:sender
		return true
	end applicationShouldTerminateAfterLastWindowClosed:
	
	#MARK:
	on applicationWillFinishLaunching:aNotification
		log "applicationWillFinishLaunching"
		
	end applicationWillFinishLaunching:
	
end script
