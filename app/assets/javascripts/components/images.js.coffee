# app/assets/javascript/components/images.js.jsx.coffee

# @jsx React.DOM

###
# Acts like a Pages Module for the images Management;
# @todo: Rename too Pages
###

@Images = React.createClass
  getInitialState: ->
    images: @props.data
    links: @props.links
  getDefaultProps: ->
    images: []
    links: []
  updateImageDatabase: (newData) ->
    @setState images: newData
  render: ->
    React.DOM.div
      className: "app"
      React.DOM.h1
        className: "page-title"
        " RageOn Shopify Product Image Manager "
      React.DOM.article
        role: "main"
        React.DOM.h2
          className: "title"
          " Image Database: "
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'ID'
              React.DOM.th null, 'Updated'
              React.DOM.th null, 'Modified'
              React.DOM.th null, 'URL'
              React.DOM.th null, 'Path'
          React.DOM.tbody null,
            for img in @state.images
              React.createElement Image, key: img.id, image: img
      React.DOM.nav
        role: "nav"
        React.DOM.h3
          className: "title"
          " Actions: "
        React.DOM.ul
          className: "nav nav-pills stacked"
          for link, i in @props.links
            React.createElement ActionLink,
              data: link
              is_active: i==0
              callback: @updateDatabase
        