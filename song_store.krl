ruleset song_store {
	meta {
		name "Store Songs"
		description <<
Dont drop the song store data BASS
>>
		author "Erik Donohoo"
		logging on
		sharing on
		provides songs, hymns, secular_music
	}

	global {
		songs = function() {
			ent:songs
		};
		hymns = function() {
			ent:hymns
		};
		secular_music = function() {
			songs = ent:songs.map(function(x) {
				x{"song"}
			});
			hymns = ent:hymns.map(function(x) {
				x{"hymn"}
			});
			songs.difference(hymns);
		}
	}

	rule collect_songs is active {
		select when explicit sung song "(.*)" setting(val)

		pre {
			songs = ent:songs || [];
			new_song = {"song":val, "timestamp":time:now()};
			songs = songs.append(new_song);
		}

		fired {
			set ent:songs songs;
			log "added song: " + val;
		}
	}

	rule collect_hymns is active {
		select when explicit found_hymn "(.*)" setting(val)

		pre {
			hymns = ent:hymns || [];
			new_hymn = {"hymn":val, "timestamp":time:now()};
			hymns = hymns.append(new_song);
		}

		fired {
			set ent:hymns hymns;
			log "added hymn: " + val;
		}
	}

	rule clear_songs is active {
		select when song reset

		fired {
			set ent:hymns [];
			set ent:songs [];
			log "you cleared em good";
		}
	}
}
