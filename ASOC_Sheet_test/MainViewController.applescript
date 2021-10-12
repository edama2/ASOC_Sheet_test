#MARK: 
script MainViewController
	property parent : class "NSViewController"
	
	#MARK: IBOutlets
	--property mainWindow : missing value
	
	#MARK: Buinding
	--property isBusy : false
	
	#MARK: 
	--global _wgetObj
	
	
	#MARK: 
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
			
			--setAccessoryView_(theView) --�A�N�Z�T���[�r���[
			--setAccessoryViewDisclosed_(true) --�A�N�Z�T���[�r���[��\�����邩
			setCanCreateDirectories_(not true) --�t�H���_�쐬�{�^����\�����邩
			--setDirectoryURL_(myPath)--�\���t�H���_
			setCanSelectHiddenExtension_(true) --�g���q�̕\��
			setMessage_("Save your file.") --������
			setPrompt_("�I��") --ok�{�^���̖��O
			setShowsHiddenFiles_(not true) --�s���̕\��
			setTitle_("SavePanel Test") --�^�C�g��
			setTreatsFilePackagesAsDirectories_(not true) --�p�b�P�[�W���f�B���N�g���Ƃ��Ĉ�����
			setNameFieldStringValue_("saveFileName") --�ۑ��t�@�C����
			--setNameFieldLabel_("nameFieldLabel") --�ۑ��t�@�C�����̍��̃��x��
			
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
			
			--setAccessoryView_(theView) --�A�N�Z�T���[�r���[
			--setAccessoryViewDisclosed_(true) --�A�N�Z�T���[�r���[��\�����邩
			--setAllowedFileTypes_(current application's NSArray's arrayWithArray:{"app"}) --�I���\�t�@�C���^�C�v
			setAllowsMultipleSelection_(not true) --�����I��
			setCanChooseDirectories_(not true) --�t�H���_��I��
			setCanChooseFiles_(true) --�t�@�C����I��
			setCanCreateDirectories_(not true) --�t�H���_�쐬�{�^����\�����邩
			--setDirectoryURL_(myPath)--�\���t�H���_
			setCanSelectHiddenExtension_(true) --�g���q�̕\��
			setMessage_("Choose files.") --������
			setPrompt_("�I��") --ok�{�^���̖��O
			--setResolvesAliases_(true) --�G�C���A�X��Ԃ����A�I���W�i����Ԃ���
			setShowsHiddenFiles_(not true) --�s���̕\��
			setTitle_("OpenPanel Test") --�^�C�g��
			setTreatsFilePackagesAsDirectories_(not true) --�p�b�P�[�W���f�B���N�g���Ƃ��Ĉ�����
			
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


