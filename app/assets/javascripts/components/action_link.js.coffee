# app/assets/javascripts/sideNav.js.jsx.coffee

# @jsx React.DOM

@ActionLink = React.createClass
  getInitialState: ->
    active: @props.is_active
    data: @props.data
    response: {}
    className: if !@props.is_active then "" else "active"
    reqData: {}
  getDefaultProps: ->
    is_active: false
    className: ""
    reqData: {}
    data: {}
    callback: (data) ->
      console.log data
  handleClick: (e) ->
    e.preventDefault()
    $.get @props.data.href, @props.reqData, (data) ->
      @props.callback data
      @setState active: true, response: data
    , 'JSON'
  render: ->
    React.DOM.li
      role: "presentation"
      className: "#{@state.className}"
      React.DOM.a
        href: @state.data.url
        onClick: @handleClick
        " #{@state.data.anchor_text} "
