ruleset a169x614 {
	meta {
		name "SkyKit Watch Demo"
		description <<
			Kynetx Sky Event API Toolkit Demo
		>>

		use module a169x610 alias SkyKit

		author "Ed Orcutt"
		logging off
	}

	global {

	}

	rule testme {
		select when pageview
		pre {
		  eci = "f6511bf0-9ba1-012f-7a7a-00163e64d091";
		}
		{
		  notify("SkyKit Watch Demo", "Hello, World!") with sticky = true;
			SkyKit:raise_delegate("formTest", eci);
		}
	}

  // ------------------------------------------------------------------------
  // Beyond here there be dragons :)
  // ------------------------------------------------------------------------
}
