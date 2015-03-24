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
		select when echo message input "(.*)" setting (val)
		send_directive("sing") with
			song = val
	}
}
