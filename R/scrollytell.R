#' scrollytell
#'
#' scrollytell
#' @import htmlwidgets
#' @export
scrollytell <- function(container_id = NULL, width = NULL, height = 0){
  params <- list(id = container_id, debug=TRUE)

  # create the widget
  htmlwidgets::createWidget( "scrollytell"
                           , params
                           , height = height
                           , width = width
                           , sizingPolicy = sizingPolicy( knitr.figure = FALSE
                                                        , viewer.suppress = TRUE
                                                        )
                           )
}

#' Container for scrollytelling
#'
#' Container element that contains a `scroll_graph` and
#' @export
scrolly_container <- function(outputId, ..., width = "100%", height=NULL) {
  # this is a special widget: it does not use render functions, but functions as a container
  # for scrolly_section etc.
  # TODO create a version that will set the step from other widgets
  # TODO add posiblity to set js events of scrollama
  widget <- htmlwidgets::shinyWidgetOutput(outputId, "scrollytell", width, height, package = "scrollytell")
  widget[[1]] <- htmltools::tagAppendAttributes(widget[[1]],class="scrolly-container")

  widget[[1]] <- htmltools::tagAppendChildren(widget[[1]],...)
  widget
}

##### Nope we don't need it, since it is not dependent on server input (only on client)
#'@export
renderScrollytell <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, scrolly_container, env, quoted = TRUE)
}

