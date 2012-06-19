SkyKit
======

This Kynetx module provides a toolkit for the [Sky Event API](http://developer.kynetx.com/display/docs/Sky+Event+API).

Using the Module
----------------

The Kynetx SkyKit Toolkit has been placed in the [Kynetx Public Module Directory](http://apps.kynetx.com/modules/a169x610). To use this module add the following `use module` pragma to the meta section of your ruleset:

    meta {
      ...
      use module a169x610 alias SkyKit
    }


Actions
-------

### raise_delegate(\<event type\>, \<event channel identifer\>)

Raise a Sky event into a Personal Cloud and evaluate the Javascript that is generated.

### watch_submit(\<selector\>, \<event channel identifier\>)

Sets a submit watch on the \<selector\> item in the current page. When the user performs a form submit and event will be fired for the submit in the web domain. \<selector\> is a jQuery selector such as (#formFoo).