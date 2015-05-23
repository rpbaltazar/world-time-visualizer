ko.bindingHandlers.chosen = {
  init: function(element)  {
    ko.bindingHandlers.options.init(element);
    $(element).chosen({disable_search_threshold: 10});
  },
  update: function(element, valueAccessor, allBindings) {
    ko.bindingHandlers.options.update(element, valueAccessor, allBindings);
    $(element).trigger('chosen:updated');
  }
};
