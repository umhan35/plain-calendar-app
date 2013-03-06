# Plain ajax calendar web app

This app allow any user to add/modify/delete/show events of a calendar. It also show the events for the last user selected when returning to the site. 

## Plain

It's called **plain** calendar because it uses

 - **plain** JavaScript to perform AJAX requests and DOM manipulation
 - **plain** ruby to handle HTTP requests, including http method and query string
 - **plain** text file as database

Those plain features are required by my Distributed Computing course and I learned a lot.

## Good

Plain is good sometimes. There are more good things:

 - Nice architecture: client(browser) <-> server(CGI scripts <-> API <-> App)
 - The server understands http method(GET, POST, DELETE) & returns fat-free JSON
 - the API has 2 versions: read only & r/w


## Other

It works on Chrome/Safari/Firefox but probably not on old IE