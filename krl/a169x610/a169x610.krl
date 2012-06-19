ruleset a169x610 {
	meta {
		name "SkyKit"
		description <<
			Kynetx Sky Event API Toolkit

			use module a169x610 alias SkyKit
		>>

		provides raise_delegate

		author "Ed Orcutt"
		logging off
	}

	global {
		// --------------------------------------------
		raise_delegate = defaction(type, token) {
		  configure using attrs = {}

			dom = "web";
			eid = math:random(9999999);
			arg = attrs.keys().map(function(x) {
			        uri:escape(x) + "=" + uri:escape(attrs{x});
						}).join("&");
    	esl = "http://cs.kobj.net/sky/event/" +
			      "#{token}/#{eid}/#{dom}/#{type}?#{arg}";
			{
  			emit <<
	  		  var r = document.createElement("script");
		  		r.src = esl;
			  	r.type = "text/javascript";
				  r.onload = r.onreadystatechange = KOBJ.url_loaded_callback;
  				var body = document.getElementsByTagName("body")[0] ||
                     document.getElementsByTagName("frameset")[0];
  				body.appendChild(r);
			>>;
			}
		};
	}

  // ------------------------------------------------------------------------
  // Beyond here there be dragons :)
  // ------------------------------------------------------------------------
}
