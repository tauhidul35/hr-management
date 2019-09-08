$.rails.ajax = (options) => {
  let op = $.ajax(options);

  op.done((response) => {
    if (response.substring(0, 10) !== 'Turbolinks') {
      Turbolinks.clearCache();
      document.documentElement.innerHTML = response;
      Turbolinks.dispatch("turbolinks:load");
    }
  });
};
