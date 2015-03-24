ruleset echo {
	meta {
		name "echo"
		description <<
Echo all the things!
>>
		author "Erik Donohoo"
		logging on
		sharing on
		provides hello
	}

	rule hello is active {
    select when echo hello
    send_directive("say") with
      something = "Hello World"
  }

	rule message is active {
		select when echo message input "(.*)" setting (val)
		send_directive("say") with
			something = val
	}
}
