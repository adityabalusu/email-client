'use strict'

angular.module('emailClientApp')
  .directive('taggedInput',["$interpolate", ($interpolate) ->
    templateUrl: 'views/taggedinput.html'
    scope:{
        maillist:"=?"
    }
    restrict: 'E'
    compile:(element,attributes) ->
        {  
            pre:(scope,element,attrs)->
                ## Regular Expression for a valid email address. 
                REGEX_EMAIL = '([a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*@' + '(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)'
                
                # Taking the label text required from the wrapped directive.
                labelText = if attrs.labeltext then attrs.labeltext else "Label Text"

                ## Using the compile function to pass common configuration to all directive instances to achieve consistency 
                ## in behavior across all pages. 
                # Start of configuration
                scope.emailsConfig =
                  persist: true
                  labelText:labelText
                  maxItems: null
                  #Below regex splits only pasted tokens by either a comma, semicolon or 2+ consecutive spaces
                  splitOn:/[,;]|(\s{2,})/
                  valueField: 'email'
                  openOnFocus:false
                  closeAfterSelect: true
                  inputClass:"input-field tag-input chips selectize-input"
                  labelField: 'displayName'
                  dropdownContentClass:"selectize-dropdown-content  collection"
                  plugins: [ 'remove_button',"restore_on_backspace" ]
                  sortField:[
                    # Default sorting is with the string match. Subsequent tie breaking is done by comparing 'frequency' of use first. 
                    # If frequency is also a tie then the result with more recent usage based on higher lastUsed property comes first.
                    # A complex formula can also be used by passing a custom sort function. 
                    # Read further documentation at https://github.com/selectize/selectize.js/blob/master/docs/usage.md 
                    {field: "frequency","direction":"desc"}
                    {field: "lastUsed","direction":"desc"}
                    {field: "$score"}
                  ]
                  searchField: [
                    'displayName'
                    'email'
                  ]
                  render:
                    item: (item, escape) ->
                      # Markup for each tag is controlled from here.
                      '<div class="chip"><img src='+item.imgURL+'>' + (if item.displayName then '<span class="name">' + escape(item.displayName) + '</span>' else '') + (if item.email then '<span class="email">' + escape(item.email) + '</span>' else '') + '</div>'
                    option: (item, escape) ->
                      # markup for the dropdown is controlled from here. 
                      label = item.displayName or item.email
                      caption = if item.displayName then item.email else null
                      '<div class="collection-item avatar suggestion-dropdown-item">' + '<img class="circle" src='+item.imgURL+'><span class="title">' + escape(label) + '</span>' + (if caption then '<p class="caption">' + escape(caption) + '</p>' else '') + '</div>'
                    option_create:(item,escape)->
                      '<div class="create collection-item">Add <strong>' + escape(item.input) + '</strong>&hellip;</div>';
                    
                  createFilter: (input) ->
                    ###
                        This method is used to validate the input and check if it has the following patterns. 
                        On successful validation the entered string is passed to the 'create' callback below. 
                    ###

                    #Pattern: email@address.com
                    regexOnlyEmail = new RegExp('^' + REGEX_EMAIL + '$', 'i')
                    #Pattern: name <email@address.com>
                    regexIncludingName = new RegExp('([^<]*)<' + REGEX_EMAIL + '>', 'gi')
                    #regex = new RegExp(REGEX_EMAIL, 'gi')
                    match = input.match(regexOnlyEmail) or input.match(regexIncludingName)
                    if match
                      #Return true to ensure the input text
                      return  true
                    false
                  
                  create: (input) ->
                    currentTimeStamp = moment.now()
                    # Extracted mail address through regex if the entered string is only the email id eg: email@address.com
                    if new RegExp('^' + REGEX_EMAIL + '$', 'i').test(input)
                      return { 
                        email: input 
                        frequency:1
                        lastUsed:currentTimeStamp
                        imgURL:"https://cdn1.iconfinder.com/data/icons/big-rocket/80/BigRocket-1-01-128.png"
                      }
                    # Extracted mail address through regex if the entered string is name + email id eg: First Name<email@address.com>
                    match = input.match(new RegExp('^([^<]*)<' + REGEX_EMAIL + '>$', 'i'))
                    if match
                      return {
                        email: match[2]
                        displayName: $.trim(match[1])
                        frequency:1
                        lastUsed:currentTimeStamp
                        imgURL:"https://cdn1.iconfinder.com/data/icons/big-rocket/80/BigRocket-1-01-128.png"
                      }
                    alert 'Invalid email address.'
                    false

                ## end of configuration


        }
        
            
      
])
