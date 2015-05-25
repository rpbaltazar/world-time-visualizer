ko.bindingHandlers.materializeSelect =
  init: (element) ->
    ko.bindingHandlers.options.init element
    $(element).material_select()

  update: (element, valueAccessor, allBindings) ->
    ko.bindingHandlers.options.update element, valueAccessor, allBindings
    $(element).material_select()
