#MARK: NSUserDefaults keys
property _k_cache : "cache"
property _k_download_directory : "download_directory"
property _k_filetype : "filetype"
property _k_is_continue : "is_continue"
property _k_no_clobber : "no_clobber"
property _k_no_directory : "no_directory"
property _k_no_host_directory : "no_host_directory"
property _k_select_option : "select_option"
property _k_span_hosts : "span_hosts"
property _k_user_agent : "user_agent"
property _k_user_retry : "retry"
property _k_wait : "wait"
property _k_wget_log : "wget_log"
property _k_wget_path : "wget_path"
property _k_wget_time_out : "time_out"
property _k_window : "window"
property _k_when_done : "when_done"
property _k_quit_app : "quit_app"
property _k_depth_level : "depth_level"


script MainViewController
	property parent : class "NSViewController"
	
	#MARK: IBOutlets
	property textFieldTextPath : missing value --> ダウンロード用のテキストpath
	property textFieldURL : missing value --> ダウンロードURL
	property depthLevel : missing value --> ダウンロード階層
	property popUpRecursive : missing value --> 再帰ダウンロードのポップアップメニュー
	property comboBoxUserAgent : missing value --> ユーザーエージェントのコンボボックス
	--property mainWindow : missing value
	
	#MARK: Buinding
	property isComboBoxEnabled : true
	property isBusy : false
	property strVarsion : "" --> ダウンロードURL
	
	#MARK: 
	property _userAgents : {} --> ユーザーエージェントのコンボボックスのデータ
	global _wgetObj
	
	
	on viewDidLoad()
		continue viewDidLoad()
		
		log "viewDidLoad"
		current application's YKKZSheet's Test()
	end viewDidLoad
	
	
	on callAlert:sender
		
		tell current application's NSAlert's new()
			setMessageText_("callAlert")
			setInformativeText_("NSWarningAlertStyle Do you want to continue with delete of selected records?")
			addButtonWithTitle_("OK")
			addButtonWithTitle_("Cancel")
			setAlertStyle_(current application's NSCriticalAlertStyle)
			set aResult to runModal()
		end tell
		
		log aResult
	end callAlert:
	
	
	on callAlertSheet:sender
		
		set mainWindow to current application's NSApp's mainWindow()
		
		tell current application's NSAlert's new()
			setMessageText_("callAlertSheet")
			setInformativeText_((current date) as text)
			addButtonWithTitle_("OK")
			addButtonWithTitle_("Cancel")
			setAlertStyle_(current application's NSCriticalAlertStyle)
			set alert to it
		end tell
		
		current application's YKKZSheet's beginSheetModalForWindow:mainWindow withPanel:alert
		log result
	end callAlertSheet:
	
	on callSavePanel:sender
		
		tell current application's NSSavePanel's savePanel()
			
			--setAccessoryView_(theView) --アクセサリービュー
			--setAccessoryViewDisclosed_(true) --アクセサリービューを表示するか
			setCanCreateDirectories_(not true) --フォルダ作成ボタンを表示するか
			--setDirectoryURL_(myPath)--表示フォルダ
			setCanSelectHiddenExtension_(true) --拡張子の表示
			setMessage_("Save your file.") --説明文
			setPrompt_("選択") --okボタンの名前
			setShowsHiddenFiles_(not true) --不可視の表示
			setTitle_("SavePanel Test") --タイトル
			setTreatsFilePackagesAsDirectories_(not true) --パッケージをディレクトリとして扱うか
			setNameFieldStringValue_("saveFileName") --保存ファイル名
			--setNameFieldLabel_("nameFieldLabel") --保存ファイル名の左のラベル
			
			set thePanel to it
		end tell
		
		set mainWindow to current application's NSApp's mainWindow()
		set aResult to current application's YKKZSheet's beginSheetModalForWindow:mainWindow withPanel:thePanel
		log result
		
		if aResult is not (current application's NSFileHandlingPanelOKButton) then return
		
		log thePanel's |URL|()
		
	end callSavePanel:
	
	on callOpenPanel:sender
		
		tell current application's NSOpenPanel's openPanel()
			
			--setAccessoryView_(theView) --アクセサリービュー
			--setAccessoryViewDisclosed_(true) --アクセサリービューを表示するか
			--setAllowedFileTypes_(current application's NSArray's arrayWithArray:{"app"}) --選択可能ファイルタイプ
			setAllowsMultipleSelection_(not true) --複数選択
			setCanChooseDirectories_(not true) --フォルダを選択
			setCanChooseFiles_(true) --ファイルを選択
			setCanCreateDirectories_(not true) --フォルダ作成ボタンを表示するか
			--setDirectoryURL_(myPath)--表示フォルダ
			setCanSelectHiddenExtension_(true) --拡張子の表示
			setMessage_("Choose files.") --説明文
			setPrompt_("選択") --okボタンの名前
			--setResolvesAliases_(true) --エイリアスを返すか、オリジナルを返すか
			setShowsHiddenFiles_(not true) --不可視の表示
			setTitle_("OpenPanel Test") --タイトル
			setTreatsFilePackagesAsDirectories_(not true) --パッケージをディレクトリとして扱うか
			
			set thePanel to it
		end tell
		
		set mainWindow to current application's NSApp's mainWindow()
		set aResult to current application's YKKZSheet's beginSheetModalForWindow:mainWindow withPanel:thePanel
		log result
		
		if aResult is not (current application's NSFileHandlingPanelOKButton) then return
		
		
		## retrieve data
		set pathList to {}
		set theURLs to thePanel's URLs() as list
		(*
		repeat with aURL in theURLs
			--log aURL's POSIX path
			--set aPath to aURL's |path|() as text
			set pathList's end to (aURL's POSIX path) --as alias
		end repeat
		*)
		
		log theURLs
		
	end callOpenPanel:
	
	
	#MARK: - 
	on raisePrefsWindow:sender
		my performSegueWithIdentifier:"ShowPrefsView" sender:me
	end raisePrefsWindow:
	
end script


