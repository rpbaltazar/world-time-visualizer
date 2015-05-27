(function() {
  ko.bindingHandlers.materializeSelect = {
    init: function(element) {
      ko.bindingHandlers.options.init(element);
      return $(element).material_select();
    },
    update: function(element, valueAccessor, allBindings) {
      ko.bindingHandlers.options.update(element, valueAccessor, allBindings);
      return $(element).material_select();
    }
  };

}).call(this);
