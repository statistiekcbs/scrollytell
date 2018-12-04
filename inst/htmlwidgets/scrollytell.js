// code for scrollama
HTMLWidgets.widget({

  name: "scrollytell",

  type: "output",

  factory: function(el, width, height) {
    // move this to the initialized session...
    var el_id = el.id;
    var graphScroll = d3.graphScroll();

    var container, graph, sections;

    var initialized = false;

    function init(container_id, debug){
      if (initialized){
        return false;
      }

      container_id = container_id || el_id;
      debug = !!debug;

      is_fixed = false;

      id = "#" + container_id;
      console.log("container_id:", container_id);
      container = d3.select(id);
      graph = container.select(".scrolly-graph");
      Stickyfill.add(graph.node());
      Stickyfill.forceSticky(); // seems to solve problem in Shiny Bootstrap

      sections = container.selectAll(".scrolly-section");

      /*resize();
      */
      graphScroll
        .graph(graph)
        .container(container)
        .sections(sections)
        .on('active', function(i){
          var id = sections.nodes()[i].id;
          if (HTMLWidgets.shinyMode){
            Shiny.onInputChange(el_id, id);
          }
        })
      ;

      initialized = true;
      return initialized;
    }

    function resize(){
    }

    return {
      renderValue: function(params) {
        init(params.id);
      },

      resize: function(width, height) {
        resize();
      },

      // Make the graphScroll object available as a property on the widget
      // instance we're returning from factory(). This is generally a
      // good idea for extensibility--it helps users of this widget
      // interact directly with graphScroll, if needed.
      graphScroll: graphScroll
    };
  }
});
