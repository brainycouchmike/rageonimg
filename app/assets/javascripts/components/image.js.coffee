# app/assets/javascripts/components/image.js.jsx.coffee

# @jsx React.DOM

@Image = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, (new Date(@props.image.date)).toLocaleString()
      React.DOM.td null, @props.image.title
      React.DOM.td null, linkifyURL "https://www.google.com/"