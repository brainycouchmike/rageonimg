# app/assets/javascripts/sideNav.js.jsx.coffee

# @jsx React.DOM

@SideNav = React.createClass
  getInitialState: ->
    links: @props.data
  getDefaultProps: ->
    links: []
  render: ->
    React.DOM.nav
      role: "nav"
      React.DOM.h3
        className: "title"
        " Actions: "
      React.DOM.ul
        className: "nav nav-pills stacked"
        React.DOM.li
          role: "presentation"
          className: "active"
          React.DOM.a
            href: "#"
            "Home"
        React.DOM.li
          role: "presentation"
          className: ""
          React.DOM.a
            href: "#"
            "Update"
