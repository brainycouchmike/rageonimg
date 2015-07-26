# app/assets/javascripts/sideNav.js.coffee

@SideNav = React.createClass
  getInitialState: ->
    links: @props.data
  getDefaultProps: ->
    links: []
  render: ->
    React.DOM.nav
      className: "sideNav", role: "nav"
      React.DOM.ul
        className: "nav nav-pills nav-stacked"
        for link in @state.links
          React.DOM.li
            role: "presentation"
            React.DOM.a
              href: "#"
              className: "active" if !link.is_active
              link.anchor_text
