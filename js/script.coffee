(($) ->
    $.fn.lockMenu = (options) ->
      settings = $.extend(
        full:  'full'
        fixed: 'fixed'
      , options)

      @.each ->
        $parent = settings.parent || ($ @).parent()
        menuTop = ($ @).position().top - parseInt($parent.css('padding-top').replace('px',''))

        ($ window).scroll ->
          if ($ @).scrollTop() > menuTop
            $parent.removeClass(settings.full).addClass(settings.fixed)
          else
            $parent.removeClass(settings.fixed).addClass(settings.full)
) jQuery

$ ->
  ($ '#menu').lockMenu()
