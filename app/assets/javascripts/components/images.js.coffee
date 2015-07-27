# app/assets/javascript/components/images.js.jsx.coffee

# @jsx React.DOM

@Images = React.createClass
  getInitialState: ->
    images: @props.data
  getDefaultProps: ->
    images: []
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
      React.createElement SideNav
        