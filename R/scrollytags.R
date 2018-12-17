#' Sticky graph
#'
#' `scrolly_graph` should be used within a `scrolly_container`
#' This will be the "sticky" part that remains in view until the user scrolls beyond the end of
#' the container
#' @param ... elements that will be part of the sticky graph
#' @param width Width of the graph in the `scrolly_container`
#' @param class The css class of the container element (do not remove)
#' @export
scrolly_graph <- function(... , width = "60%", class = "scrolly-graph"){
  #
  style = paste0("width:", width)
  htmltools::div(class = class, style = style, ...)
}

#' container for \code{scrolly_section}s.
#'
#' The non-sticky part of a `scrolly_container`.
#' Contains the text `section`s that will scroll when a user scrolls the `scrolly_container`.
#' @param ... section elements
#' @param width Width of the non-sticky part
#' @param class css class used
#' @export
scrolly_sections <- function(..., width = "40%", class="scrolly-sections"){
  style = paste0("width:", width)
  htmltools::div(class = class, style = style, ...)
}

#' Section element
#'
#' section element of the scrolly container. When the section element is selected, the value of the container is equal
#' to the section id.
#' @param id ID of scrolly_section.
#' @param ... elements that are part of the section
#' @param css class, do not remove
#' @export
scrolly_section <- function(id, ..., class="scrolly-section"){  # TODO maybe prefix id with container id?
  htmltools::div(id=id, class = class, ...)
}
