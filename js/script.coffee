(($) ->
    $.fn.lockMenu = (options) ->
      settings = $.extend(
        full:  'full'     # classname for displaying full menu
        fixed: 'fixed'    # classname for displaying fixed menu
        active: 'active'  # classname for active menu
      , options)

      @.each ->
        $self = ($ @)
        $parent = settings.parent || ($ @).parent()
        menuTop = ($ @).position().top - parseInt($parent.css('padding-top').replace('px',''))

        ($ window).scroll ->
          scrollTop = ($ window).scrollTop()

          if scrollTop > menuTop
            # Hide full menu if we scrolled down enough
            $parent.removeClass(settings.full).addClass(settings.fixed)
          else
            $parent.removeClass(settings.fixed).addClass(settings.full)

          # Highlight corresponding menu if we've scrolled to section
          ($ 'a', $self).each ->
            section = ($ @).attr('href')

            if scrollTop >= ($ section).offset().top
              ($ 'a', $self).removeClass(settings.active)
              ($ @).addClass(settings.active)

            # Last section might be less than a page, show highlight explicitly
            if scrollTop + ($ window).height() == ($ document).height()
              ($ 'a', $self).removeClass(settings.active)
              ($ 'a:last', $self).addClass(settings.active)

) jQuery

$ ->
  ($ '#menu').lockMenu()
  ($ '.flexslider').flexslider
    animation: 'slide'
    # slideshow: false
    controlNav: false
    directionNav: false
    randomize: true
