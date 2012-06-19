ruleset a169x612 {
	meta {
		name "SkyKit Demo App1"
		description <<
			Kynetx Sky Event API Toolkit Demo App1
		>>
		author "Ed Orcutt"
		logging off
	}

	rule sayHello {
		select when web sayHello
		{
		  notify("Kynetx SkyKit Demo", "Hi, I'm App #1") with sticky = true;
		}
	}

  // ------------------------------------------------------------------------
  // Beyond here there be dragons :)
  // ------------------------------------------------------------------------
}
