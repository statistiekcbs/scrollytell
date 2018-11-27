#' Sticky graph
#'
#' Creates a part of a graph that will stay in screen, until the end of the container
#' @export
scrolly_graph <- function(... , width = "60%", class = "scrolly-graph"){
  style = paste0("width:", width)
  htmltools::div(class = class, style = style, ...)
}

#' container for \code{scrolly_section}s.
#'
#' Creates a part of a graph that will stay in screen, until the end of the container
#' @export
scrolly_sections <- function(..., width = "40%", class="scrolly-sections"){
  style = paste0("width:", width)
  htmltools::div(class = class, style = style, ...)
}

#' @export
scrolly_section <- function(id, ..., class="scrolly-section"){  # TODO maybe prefix id with container id?
  htmltools::div(id=id, class = class, ...)
}
