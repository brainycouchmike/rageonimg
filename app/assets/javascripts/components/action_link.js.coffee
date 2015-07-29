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
    btn_props = @props
    if !btn_props.data.url
      return btn_props.callback null
    if btn_props.data.url == "/download"
      $('.image-row').each (dex, elem) ->
        $.ajax
          url:  btn_props.data.url
          data: img:
            id: $(elem).find('td:first').text()
          type: 'GET'
          dataType: 'JSON'
          success: (data) ->
            console.info data
    else
      $.get btn_props.data.url, btn_props.reqData, (data) ->
        console.debug data
        btn_props.callback data
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
