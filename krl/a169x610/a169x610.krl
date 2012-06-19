ruleset a169x610 {
	meta {
		name "SkyKit"
		description <<
Kynetx Sky Event API Toolkit. This Kynetx module provides a toolkit for the Sky Event API

use module a169x610 alias SkyKit

Actions

raise_delegate(<event type>, <event channel identifer>)

Raise a Sky event into a Personal Cloud and evaluate the Javascript that is generated.
		>>

		provides raise_delegate, watch_submit

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

		// --------------------------------------------
		watch_submit = defaction(form, token) {
		  _form  = form;
			_token = token;
			{
		    emit <<
				  $K(_form).unbind('submit').submit(function(event) {
					  event.preventDefault();

					  var dom  = 'web';
						var type = 'submit';
						var eid  = Math.floor(Math.random()*9999999);
						var attr = $K(this).serialize();

						var esl = 'http://cs.kobj.net/sky/event/' +
						          _token + '/' + 	eid + '/' +
											dom + '/' +	type + '?' + attr +
											'&element=' + encodeURIComponent(_form);
	  		    var r = document.createElement('script');
		  		  r.src = esl;
			  	  r.type = 'text/javascript';
				    r.onload = r.onreadystatechange = KOBJ.url_loaded_callback;
  				  var body = document.getElementsByTagName('body')[0] ||
                       document.getElementsByTagName('frameset')[0];
  				  body.appendChild(r);
						//return false;
					});
			  >>;
			}
		};

	}

  // ------------------------------------------------------------------------
  // Beyond here there be dragons :)
  // ------------------------------------------------------------------------
}
