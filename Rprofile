#' .Rprofile
#' Configure the R environment.
#'
#' @author Nathan Campos <nathanpc@dreamintech.net>

# Setup a local home library.
rhome <- paste("~/.R/", paste(R.version$major, R.version$minor, sep = "."),
               sep = "")
Sys.setenv(R_LIBS_USER = rhome)
.libPaths(c(rhome, "/usr/local/lib/R/site-library"))

# Import devtools when working from a REPL.
if (interactive()) {
    suppressMessages(require(devtools))
}

# Set some options.
options(editor = "emacs")          # Emacs is my default editor.
options(width = 80)                # 80 collumn mode.
options(warn = 2)                  # Warnings are errors.
options(useFancyQuotes = FALSE)    # Fancy quotes are stupid.
options(max.print = 100)           # Limit R printing.
Sys.setenv(R_HISTSIZE = "100000")  # Increase history.

# Warn about partial variable matches.
options(warnPartialMatchAttr = TRUE,
        warnPartialMatchDollar = TRUE,
        warnPartialMatchArgs = TRUE)

# enable autocompletions for package names in require and library().
utils::rc.settings(ipck = TRUE)

# Colored output when running a capable terminal.
if (Sys.getenv("TERM") == "xterm-256color") {
    library("colorout")
}

# Clean up.
rm(rhome)
