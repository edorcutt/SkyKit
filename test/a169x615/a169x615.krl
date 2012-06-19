ruleset a169x615 {
	meta {
		name "SkyKit Watch Demo App"
		description <<
			Kynetx Form Submit Watch for Sky Event API Demo
		>>

		use module a169x610 alias SkyKit

		author "Ed Orcutt"
		logging off
	}

	rule formTest {
	  select when web formTest
		pre {
		  eci = "f6511bf0-9ba1-012f-7a7a-00163e64d091";
			firstName = ent:firstName || "";
			lastName  = ent:lastName || "";
		}
		{
  		notify("SkyKit Watch Demo App", "Set watch_submit") with sticky = true;
			SkyKit:watch_submit("#formDemo", eci);
			emit <<
			  $K('#firstName').val(firstName);
			  $K('#lastName').val(lastName);
			>>;
		}
	}

	rule formSubmit {
	  select when web submit "#formDemo"
		pre {
		  firstName = event:attr("firstName");
			lastName  = event:attr("lastName");
		}
		{
		  notify("SkyKit Watch Demo App", "Form Submitted") with sticky = true;
		}
		fired {
		  set ent:firstName firstName;
			set ent:lastName lastName;
		}
	}

  // ------------------------------------------------------------------------
  // Beyond here there be dragons :)
  // ------------------------------------------------------------------------
}
