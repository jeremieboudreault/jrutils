# render_md_github.R

#' Function to convert a Markdown document into a html document with the style of Github.
#'
#' @param file : File to be converted (default to `README.md`)

#' @return The `file.html` with Github template.

#' @export

render_md_github <- function(file = "README.md") {

    # Rename the file to a temporary name.
    file_tmp_md <- gsub(".md", "2.md", file)

    # Set names for the .html output.
    file_tmp_html <- gsub(".md", "2.html", file)
    file_html <- gsub(".md", ".html", file)

    # Render Markdown in .html and .md using "github_document" option of Rmarkdown.
    rmarkdown::render(
        input         = file,
        output_dir    = dirname(file_tmp_md),
        output_format = "github_document",
        output_file   = file_tmp_md,
        quiet         = TRUE
    )

    # Remove temporary .md file.
    file.remove(file_tmp_md)

    # Rename .html file to the correct name.
    file.rename(file_tmp_html, file_html)

    # Return null.
    return(message("File successfully converted."))

}
