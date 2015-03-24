ruleset see_songs {
	meta {
		name "see the songs"
		description <<
The hills are alive
>>
		author "Erik Donohoo"
		logging on
		sharing on
	}

	rule songs is active {
		select when echo message msg_type re#song# input "(.*)" setting (val)
		send_directive("sing") with
			song = val

		fired {
			raise explicit event 'sung' with song = val
		}
	}

	rule find_hymn is active {
		select when explicit sung song re#god#

		fired {
			raise explicit event 'generic';
			raise found_hymn event 'generic';
		}
	}
}
