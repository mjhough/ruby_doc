# NOTES:

### SEARCH BY METHOD FEATURE:
For now the search feature only searches all doc objects (iterating Doc.all)
I would like to improve this to also search through all Meth objects.
The issue here explained below...

Population of all methods can only be done through scraping each individual
doc page for all its meth urls. In this site, methods are spread out 
and not available in their entirety, in a singular container or list. 

Roadmap: In this CLI I pre-load all docs through Scraper.loadDOCS in 
environment.rb before my exec is ran. When user first lands at UI.greeting
all docs (objects) are already loaded.

To initiate the scrape I need to retrieve a method for instantiation, 
I pass in a Doc class object's url attribute. Since, as previously stated,
ALL methods do not live in one place... The logical solution would be to 
iterate through Doc.all, pass (obj).url to block and call Scraper.load_doc_page()
passing in every iteration. This would essentially instantiate meth objects 
for all methods included on all doc pages.

2 big issues arise with this fact. The first and most important URI will not 
let me iterate and open each page (redirection open loop error). 2nd, 
even if we did we would be opening, scraping, and iterating through 
2403 different site pages. As you can imagine this would not be practical

Plan for improvement:
I will be researching a way to patch this error so as to allow the iteration
and if successful decide on implementation based on run time.

If unsuccessful I will be looking into changing my scrapers to point to 
http://ruby-doc.org/ which was my initial plan with this CLI. As this is 
my very first CLI the layout of this site was a bit intimidating at first glance
as far as scraping successfully. At the completetion of this CLI I am now 
a lot more confident in my abilities so this will most likely be the way 
I go. 