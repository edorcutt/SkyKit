ruleset a169x613 {
	meta {
		name "SkyKit Demo App2"
		description <<
			Kynetx Sky Event API Toolkit Demo App2
		>>
		author "Ed Orcutt"
		logging off
	}

	rule sayHello {
		select when web sayHello
		{
		  notify("Kynetx SkyKit Demo", "Hi, I'm App #2") with sticky = true;
		}
	}

  // ------------------------------------------------------------------------
  // Beyond here there be dragons :)
  // ------------------------------------------------------------------------
}
