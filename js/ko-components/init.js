(function() {
  this.KoComponents = {
    ViewModels: {}
  };

  this.KoComponents.registerComponents = function(arr) {
    return _.each(arr, function(component) {
      return ko.components.register(component, {
        viewModel: KoComponents.ViewModels[_.chain("" + component).camelCase().capitalize().value()],
        template: JST["ko_components/templates/" + component]()
      });
    });
  };

}).call(this);
