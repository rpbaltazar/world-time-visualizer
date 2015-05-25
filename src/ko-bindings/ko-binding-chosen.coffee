ko.bindingHandlers.chosen =
  init: (element) ->
    ko.bindingHandlers.options.init element
    $(element).chosen disable_search_threshold: 10

  update: (element, valueAccessor, allBindings) ->
    ko.bindingHandlers.options.update element, valueAccessor, allBindings
    $(element).trigger 'chosen:updated'
