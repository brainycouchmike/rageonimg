# app/assets/javascripts/sideNav.js.jsx.coffee

# @jsx React.DOM

@SideNav = React.createClass
  getInitialState: ->
    active: @props.is_active
    data: @props.data
    response: {}
    className: "{if !@props.is_active then '' else 'active'}"
    reqData: {}
  getDefaultProps: ->
    is_active: false
    className: ""
    data: {}
    callback: (data) ->
      e.preventDefault()
      console.log data
  handleClick: (e) ->
    e.preventDefault()
    $.get @props.data.href @props.reqData (data) ->
      @props.callback data
      @setState active: true, response: data
    , 'JSON'
  render: ->
    React.DOM.li
      role: "presentation"
      className: "{@state.className}"
      React.DOM.a
        href: @state.data.href
        onClick: @handleClick
        " {@state.data.anchor_text} "
