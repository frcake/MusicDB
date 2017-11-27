window.tinymce = window.tinymce || {
  base:   '/assets/tinymce',
  suffix: ''
};

if (typeof Turbolinks != 'undefined' && Turbolinks.supported) {
  document.addEventListener('turbolinks:before-render', function() {
    tinymce.remove();
  });
}
;
