# app/assets/javascript/components/images.js.coffee
# @cjsx React.DOM

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
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Title'
              React.DOM.th null, 'Link'
          React.DOM.tbody null,
            for img in @state.images
              React.createElement Image, key: img.id, image: img
      React.createElement SideNav
        