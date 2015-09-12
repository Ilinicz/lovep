//= require_tree .

$container = $('.grid')
$container.imagesLoaded ->
  $container.masonry
    itemSelector: '.grid-item'
    #isFitWidth: true
    #columnWidth: 250
    gutter: 0
  return


onScroll = (event) ->
  scrollPos = $(document).scrollTop()
  $('#nav ul li a').each ->
    currLink = $(this)
    refElement = $(currLink.attr('href'))
    if refElement.position().top <= scrollPos and refElement.position().top + refElement.height() > scrollPos
      $('#nav ul li a').removeClass 'active'
      currLink.addClass 'active'
    else
      currLink.removeClass 'active'
    return
  return

$(document).ready ->
  $(document).on 'scroll', onScroll
  #smoothscroll
  $('a[href^="#"]').on 'click', (e) ->
    e.preventDefault()
    $(document).off 'scroll'
    $('a').each ->
      $(this).removeClass 'active'
      return
    $(this).addClass 'active'
    target = @hash
    menu = target
    $target = $(target)
    $('html, body').stop().animate { 'scrollTop': $target.offset().top + 2 }, 500, 'swing', ->
      window.location.hash = target
      $(document).on 'scroll', onScroll
      return
    return
  return

