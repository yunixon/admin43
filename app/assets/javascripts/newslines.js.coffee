$(document).ready ->
  $("#newslines .page").infinitescroll
    navSelector: "nav.pagination"
    nextSelector: "nav.pagination a[rel=next]"
    itemSelector: "#newslines .panel.panel-primary.element"