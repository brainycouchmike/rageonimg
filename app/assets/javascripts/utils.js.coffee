# app/assets/javascripts/utils.js.coffee

###
# Create HTML anchor for url string
###
@linkifyURL = (url, anchor = null) ->
  React.DOM.a
    href: url
    anchor || url
