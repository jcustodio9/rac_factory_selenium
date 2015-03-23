Feature: As a RAC website visitor
  I would like to navigate the website
  And visit all links
  And verify that all links are active

  
@navigation_pc
Scenario: Verify nav menu in the home page
  Given I navigate to RAC home page
  Then I mouse over the navigation menu:        
    | menu              | submenu                   |  link                             |  
    | motoring          | Roadside Assistance       |  Join Roadside Assistance         |
    | motoring          | Roadside Assistance       |  Pricing                          |
    | motoring          | Roadside Assistance       |  For business                     |
    | motoring          | Roadside Assistance       |  free2go for 17-19 year olds      |
    | motoring          | Roadside Assistance       |  Upgrade                          |
    | motoring          | Roadside Assistance       |  Gift card                        |
    | motoring          | Roadside Assistance       |  Change my address                |
    | motoring          | Roadside Assistance       |  Change vehicle details           |
    | motoring          | Auto Services             |  Book a service                   |
    | motoring          | Auto Services             |  Car servicing                    |
    | motoring          | Auto Services             |  Repairs                          |
    | motoring          | Auto Services             |  Locations                        |
    | motoring          | Auto Services             |  Make an enquiry                  |
    | motoring          | Auto Services             |  Special offers                   |
    | motoring          | Batteries                 |  Car battery replacement          |
    | motoring          | Batteries                 |  Our battery prices               |
    | motoring          | Batteries                 |  Motorbike batteries              |
    | motoring          | DTEC                      |  Driving courses                  |
    | motoring          | DTEC                      |  Performance driving              |
    | motoring          | DTEC                      |  Venue information & maps         |
    | motoring          | Motoring advice           |  Breakdown safety                 |
    | motoring          | Motoring advice           |  Ask us for motoring advice       |
    | motoring          | Motoring advice           |  Approved repairers               |
    | motoring          | Motoring advice           |  Fuel prices                      |
    | motoring          | Motoring advice           |  How safe is your car?            |
    | motoring          | Motoring advice           |  Australia's Best Cars 2014       |          
    | insurance         | Insurance Quick Links     |  Pay a bill                       |
    | insurance         | Insurance Quick Links     |  Make a claim                     |
    | insurance         | Insurance Quick Links     |  Retrieve a quote                 |
    | insurance         | Insurance Quick Links     |  Insurance tips                   |
    | insurance         | Car insurance             |  Car insurance quote              |
    | insurance         | Car insurance             |  Comprehensive car insurance      |
    | insurance         | Car insurance             |  Fire and theft car insurance     |
    | insurance         | Car insurance             |  Third party car insurance        |
    | insurance         | Car insurance             |  Compare car insurance            |
    | insurance         | Car insurance             |  Motorcycle insurance             |
    | insurance         | Car insurance             |  Caravan insurance                |
    | insurance         | Car insurance             |  Low emissions discount           |
    | insurance         | Home insurance            |  Home insurance quote             |
    | insurance         | Home insurance            |  Contents insurance               |
    | insurance         | Home insurance            |  Building insurance               |
    | insurance         | Home insurance            |  Renters insurance                |
    | insurance         | Home insurance            |  Landlords insurance              |
    | insurance         | Home insurance            |  Personal valuables insurance     |
    | insurance         | Home insurance            |  Home insurance calculators       |
    | insurance         | Home insurance            |  Boat insurance                   |
    | insurance         | Life insurance            |  Life insurance quote             |
    | insurance         | Life insurance            |  Life protect insurance           |
    | insurance         | Life insurance            |  Accident protect insurance       |
    | insurance         | Life insurance            |  Life insurance claims            |
    | travel            | Travel deals              |  Flights                          |
    | travel            | Travel deals              |  Domestic packages                |
    | travel            | Travel deals              |  International packages           |
    | travel            | Travel deals              |  Rail                             |
    | travel            | Travel deals              |  Star rated accommodation         |
    | travel            | Travel deals              |  Discount tickets and attractions |
    | travel            | Contact us                |  RAC Travel Centres               |
    | travel            | Contact us                |  RAC Travel Insurance             |
    | travel            | Travel insurance          |  Get a quote                      |
    | travel            | Travel insurance          |  Plan types                       |
    | travel            | Travel insurance          |  Make a claim                     |
    | travel            | Travel quick links        |  Travel information sessions      |
    | travel            | Travel quick links        |  Member weekend events            |
    | travel            | Travel quick links        |  Travel member benefits           |
    | travel            | Travel quick links        |  Subscribe to Travel eNews        |
    | travel            | Travel quick links        |  Competitions                     |
    | travel            | Travel quick links        |  Gotta Go WA                      |
    | travel            | Driving holidays          |  International Drivers Permits    |
    | travel            | Driving holidays          |  Thrifty car hire deals           |
    | travel            | Driving holidays          |  Campervan hire                   |
    | travel            | Driving holidays          |  Maps & Guides                    |
    | travel            | Driving holidays          |  Trip planner                     |
    | travel            | Driving holidays          |  Suggested self-drives            |
    | travel            | Driving holidays          |  Drive Australia                  |
    | finance           | RAC Finance               |  Get a loan quote                 |
    | finance           | RAC Finance               |  How to apply for a loan          |
    | finance           | RAC Finance               |  Our loan features                |
    | finance           | RAC Finance               |  Loan interest rates              |
    | finance           | RAC Finance               |  Loan calculator                  |
    | finance           | RAC Finance               |  Frequently asked questions       |
    | finance           | RAC Finance               |  Loan Application Process         |
    | finance           | RAC Finance               |  Resource Centre                  |
    | finance           | Loans                     |  Car loans                        |
    | finance           | Loans                     |  Personal loans                   |
    | finance           | Loans                     |  Travel loans                     |
    | finance           | Loans                     |  Debt consolidation               |
    | finance           | Loans                     |  Property development finance     |
    | finance           | Investments               |  Investment interest rates        |
    | finance           | Investments               |  Investment application           |
    | homeSec           | Securing your home        |  Home alarm systems               |
    | homeSec           | Securing your home        |  Home alarm monitoring            |
    | homeSec           | Securing your home        |  Security film                    |
    | homeSec           | Securing your home        |  Special offers                   |
    | homeSec           | Security advice           |  How secure is your home?         |
    | homeSec           | Security advice           |  Security video                   |
    | community         | Road safety & transport   |  Safe roads                       |
    | community         | Road safety & transport   |  Safe drivers                     |
    | community         | Road safety & transport   |  Safe cars                        |
    | community         | Road safety & transport   |  Don't pay too much for fuel      |
    | community         | Road safety & transport   |  Public transport                 |
    | community         | Road safety & transport   |  Motorcycle and Scooter safety    |
    | community         | Road safety & transport   |  Cycling                          |
    | community         | Road safety & transport   |  About RAC advocacy               |
    | community         | News & Reports            |  Latest news                      |
    | community         | News & Reports            |  Publications                     |
    | community         | News & Reports            |  Horizons Magazine                |
    | community         | News & Reports            |  Campaigns                        |
    | community         | News & Reports            |  Media releases                   |
    | community         | Sponsorship               |  Major Sponsorships               |
    | community         | Sponsorship               |  Community Sponsorships           |
    | community         | Community education       |  RAC bstreetsmart                 |
    | community         | Community education       |  For Schools                      |
    | community         | Community education       |  For Community Groups             |
    | community         | Environment               |  Less Emissions Mission           |
    | community         | RAC Blog                  |                                   |
    | about             | Contact RAC               |  Contact us                       |
    | about             | Contact RAC               |  Phone us                         |
    | about             | Contact RAC               |  Change your address              |
    | about             | Contact RAC               |  Find an RAC branch               |
    | about             | Contact RAC               |  Our product brochures            |
    | about             | Contact RAC               |  Competitions                     |
    | about             | Contact RAC               |  Terms and conditions             |
    | about             | Contact RAC               |  RAC eNewsletters                 |
    | about             | Contact RAC               |  About this site                  |
    | about             | Contact RAC               |  Compliments and complaints       |
    | about             | Contact RAC               |  Careers                          |
    | about             | Our history & values      |  Our history                      |
    | about             | Our history & values      |  Our vision and values            |
    | about             | Our history & values      |  Councillors                      |



@navigation_mobile
Scenario: Verify nav menu in the home page
  Given I navigate to RAC home page
  Then I mouse over the navigation menu:        
    | menu                  | submenu                       |  link                         |  
    | Roadside Assistance   | Join Roadside Assistance      |                               |  
    | Roadside Assistance   | Join free2go                  |                               |      
#    | Roadside Assistance   | Compare cover                 |                               | 
    | Insurance             | Car Insurance                 |                               |  
    | Insurance             | Home Insurance                |                               | 
#    | Insurance             | Travel Insurance              |                               | 
#    | Insurance             | Insurance Claims              |                               | 
#    | Insurance             | New policies                  |                               | 
    | Motoring              | Roadside Assistance           |  Join Roadside Assistance     |
    | Motoring              | Roadside Assistance           |  Join free2go                 |
    | Motoring              | Auto services                 |  Find a location              |
    | Motoring              | Auto services                 |  Car servicing                |
    | Motoring              | Batteries                     |  Our battery prices           |
#    | Motoring              | Driving Centre                |                               |
#    | Travel                | Travel Service Centres        |                               |
#    | Finance               | Online quote                  |                               |
#    | Finance               | Interest rates                |                               |
#    | Pay a bill            |                               |                               |
    | Online shop           |                               |                               |