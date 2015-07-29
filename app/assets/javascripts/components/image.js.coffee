# app/assets/javascripts/components/image.js.coffee

# @jsx React.DOM

@Image = React.createClass
  render: ->
    React.DOM.tr
      className: "image-row"
      React.DOM.td null, @props.image.id
      React.DOM.td 
        className: "warning" if (new Date(@props.updated_at)).getMilliseconds() != (new Date(@props.image.lastmod)).getMilliseconds,
        (new Date(@props.image.lastmod)).toLocaleString()
      React.DOM.td null, linkifyURL(@props.image.src, React.DOM.img src: @props.image.src)
      React.DOM.td null, @props.image.path.split("/").slice(-2).join("/")