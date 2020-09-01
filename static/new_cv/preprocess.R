library(bibtex)
my_name <- person(family = "Hickey", given = c("Peter", "F"))

check_entries <- function(paper) {
  if(is.null(paper$pubmed)) {
    cat("paper missing pubmed\n")
    print(paper)
    cat("\n")
  }
  if(is.null(paper$pmcid)) {
    cat("paper missing pmcid\n")
    print(paper)
    cat("\n")
  }
  if(!is.null(paper$pmid)) {
    cat("paper has pmid instead of pubmed\n")
    print(paper)
    cat("\n")
  }
  invisible(NULL)
}

fix_entries <- function(paper) {
  if(!is.null(paper$corresponding_authors)) {
    cor_authors <- strsplit(paper$corresponding_authors, ",")[[1]]
    cor_authors <- gsub(" ", "", cor_authors)
  } else cor_authors <- ""
  if(!is.null(paper$first_authors)) {
    fir_authors <- strsplit(paper$first_authors, ",")[[1]]
    fir_authors <- gsub(" ", "", fir_authors)
  } else fir_authors <- ""
  if(!is.null(paper$students)) {
    stud_authors <- strsplit(paper$students, ",")[[1]]
    stud_authors <- gsub(" ", "", stud_authors)
  } else stud_authors <- ""
  paper$author <- person(authors)
  paper
}

hickey_papers <- c(
  read.bib(file = "papers.bib"),
  read.bib(file = "consortia_papers.bib"))
invisible(sapply(as.list(hickey_papers), check_entries))
hickey <- c(
  hickey_papers,
  read.bib(file = "preprints.bib"),
  read.bib(file = "published_preprints.bib"),
  read.bib(file = "others.bib"))

write.bib(hickey, file = "hickey.bib")
