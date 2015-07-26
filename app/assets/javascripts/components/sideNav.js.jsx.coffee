# app/assets/javascripts/sideNav.js.jsx.coffee

# @jsx React.DOM

@SideNav = React.createClass
  getInitialState: ->
    links: @props.data
  getDefaultProps: ->
    links: []
  render: ->
    `<Nav bsStyle='pills' stacked activeKey={1} onSelect={handleSelect}>
      <NavItem eventKey={1} href='/home'>NavItem 1 content</NavItem>
    </Nav>`
