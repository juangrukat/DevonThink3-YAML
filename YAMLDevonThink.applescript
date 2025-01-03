tell application id "DNtp"
	repeat with theRecord in (selected records whose (type is markdown))
		-- First clear all existing custom metadata
		set custom meta data of theRecord to {}
		-- Clear existing tags
		set tags of theRecord to {}
		
		set src to plain text of theRecord
		set mdMarker to false
		set od to AppleScript's text item delimiters
		set foundTitle to "" -- Variable to hold the title for renaming
		set paraCount to count paragraphs of src
		set i to 1
		
		repeat until i > paraCount
			set theParagraph to paragraph i of src
			if (theParagraph is "---") and (not mdMarker) then
				set mdMarker to true
			else if (theParagraph is "---") and mdMarker then
				exit repeat
			else if mdMarker then
				if theParagraph contains ":" then
					set AppleScript's text item delimiters to ":"
					set {theKey, theValue} to (text items of theParagraph)
					log {theKey, theValue}
					if (theKey is "title") then
						set foundTitle to theValue
					end if
					if (theKey is not "Tags") then
						add custom meta data theValue for theKey to theRecord
					else
						set AppleScript's text item delimiters to ","
						set tagList to (text items of theValue)
						set tags of theRecord to tagList
					end if
					set AppleScript's text item delimiters to od
				end if
			end if
			set i to i + 1
		end repeat
		
		if (foundTitle is not "") then
			set name of theRecord to foundTitle
		end if
	end repeat
end tell
