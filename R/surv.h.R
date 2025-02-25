
# This file is automatically generated, you probably don't want to edit this

survOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "survOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            elapsed = NULL,
            event = NULL,
            eventLevel = NULL,
            groups = NULL,
            tests = NULL,
            testspw = FALSE,
            sc = TRUE,
            chf = FALSE,
            ci = FALSE,
            cens = FALSE,
            risk = FALSE,
            median = FALSE,
            logscale = FALSE,
            units = "", ...) {

            super$initialize(
                package="deathwatch",
                name="surv",
                requiresData=TRUE,
                ...)

            private$..elapsed <- jmvcore::OptionVariable$new(
                "elapsed",
                elapsed,
                suggested=list(
                    "continuous"),
                permitted=list(
                    "numeric"))
            private$..event <- jmvcore::OptionVariable$new(
                "event",
                event,
                suggested=list(
                    "continuous",
                    "nominal"),
                permitted=list(
                    "factor",
                    "numeric"))
            private$..eventLevel <- jmvcore::OptionLevel$new(
                "eventLevel",
                eventLevel,
                variable="(event)")
            private$..groups <- jmvcore::OptionVariable$new(
                "groups",
                groups,
                suggested=list(
                    "nominal"),
                permitted=list(
                    "factor"))
            private$..tests <- jmvcore::OptionNMXList$new(
                "tests",
                tests,
                options=list(
                    "logrank",
                    "gehan",
                    "taroneware",
                    "petopeto"))
            private$..testspw <- jmvcore::OptionBool$new(
                "testspw",
                testspw,
                default=FALSE)
            private$..sc <- jmvcore::OptionBool$new(
                "sc",
                sc,
                default=TRUE)
            private$..chf <- jmvcore::OptionBool$new(
                "chf",
                chf,
                default=FALSE)
            private$..ci <- jmvcore::OptionBool$new(
                "ci",
                ci,
                default=FALSE)
            private$..cens <- jmvcore::OptionBool$new(
                "cens",
                cens,
                default=FALSE)
            private$..risk <- jmvcore::OptionBool$new(
                "risk",
                risk,
                default=FALSE)
            private$..median <- jmvcore::OptionBool$new(
                "median",
                median,
                default=FALSE)
            private$..logscale <- jmvcore::OptionBool$new(
                "logscale",
                logscale,
                default=FALSE)
            private$..units <- jmvcore::OptionString$new(
                "units",
                units,
                default="")

            self$.addOption(private$..elapsed)
            self$.addOption(private$..event)
            self$.addOption(private$..eventLevel)
            self$.addOption(private$..groups)
            self$.addOption(private$..tests)
            self$.addOption(private$..testspw)
            self$.addOption(private$..sc)
            self$.addOption(private$..chf)
            self$.addOption(private$..ci)
            self$.addOption(private$..cens)
            self$.addOption(private$..risk)
            self$.addOption(private$..median)
            self$.addOption(private$..logscale)
            self$.addOption(private$..units)
        }),
    active = list(
        elapsed = function() private$..elapsed$value,
        event = function() private$..event$value,
        eventLevel = function() private$..eventLevel$value,
        groups = function() private$..groups$value,
        tests = function() private$..tests$value,
        testspw = function() private$..testspw$value,
        sc = function() private$..sc$value,
        chf = function() private$..chf$value,
        ci = function() private$..ci$value,
        cens = function() private$..cens$value,
        risk = function() private$..risk$value,
        median = function() private$..median$value,
        logscale = function() private$..logscale$value,
        units = function() private$..units$value),
    private = list(
        ..elapsed = NA,
        ..event = NA,
        ..eventLevel = NA,
        ..groups = NA,
        ..tests = NA,
        ..testspw = NA,
        ..sc = NA,
        ..chf = NA,
        ..ci = NA,
        ..cens = NA,
        ..risk = NA,
        ..median = NA,
        ..logscale = NA,
        ..units = NA)
)

survResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "survResults",
    inherit = jmvcore::Group,
    active = list(
        summary = function() private$.items[["summary"]],
        medianestimates = function() private$.items[["medianestimates"]],
        tests = function() private$.items[["tests"]],
        testspw = function() private$.items[["testspw"]],
        sc = function() private$.items[["sc"]],
        chf = function() private$.items[["chf"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="Survival Analysis")
            self$add(jmvcore::Table$new(
                options=options,
                name="summary",
                title="Events Summary",
                clearWith=list(
                    "event",
                    "eventLevel",
                    "elapsed",
                    "groups"),
                columns=list(
                    list(
                        `name`="group", 
                        `title`="", 
                        `type`="text", 
                        `content`="($key)", 
                        `visible`="(groups)"),
                    list(
                        `name`="n", 
                        `title`="N", 
                        `type`="integer"),
                    list(
                        `name`="censored", 
                        `title`="Censored", 
                        `type`="integer"),
                    list(
                        `name`="obs", 
                        `title`="Observed Events", 
                        `type`="integer"),
                    list(
                        `name`="exp", 
                        `title`="Expected Events", 
                        `type`="number"))))
            self$add(jmvcore::Table$new(
                options=options,
                name="medianestimates",
                title="Median Estimates",
                clearWith=list(
                    "times",
                    "status"),
                columns=list(
                    list(
                        `name`="group", 
                        `title`="", 
                        `type`="text", 
                        `content`="($key)", 
                        `visible`="(groups)"),
                    list(
                        `name`="median", 
                        `title`="Median", 
                        `type`="number"),
                    list(
                        `name`="cilb", 
                        `title`="Lower", 
                        `type`="number"),
                    list(
                        `name`="ciub", 
                        `title`="Upper", 
                        `type`="number"))))
            self$add(jmvcore::Table$new(
                options=options,
                name="tests",
                title="Analysis of the differences",
                visible="(tests)",
                clearWith=list(
                    "event",
                    "eventLevel",
                    "elapsed",
                    "groups"),
                columns=list(
                    list(
                        `name`="stat[logrank]", 
                        `title`="Test", 
                        `type`="text", 
                        `refs`=list(
                            "survival1",
                            "survival2"), 
                        `content`="Log-rank", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="stat[gehan]", 
                        `title`="Test", 
                        `type`="text", 
                        `refs`=list(
                            "coin1",
                            "coin2"), 
                        `content`="Gehan", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="stat[taroneware]", 
                        `title`="Test", 
                        `type`="text", 
                        `refs`=list(
                            "coin1",
                            "coin2"), 
                        `content`="Tarone-Ware", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="stat[petopeto]", 
                        `title`="Test", 
                        `type`="text", 
                        `refs`=list(
                            "survival1",
                            "survival2"), 
                        `content`="Peto-Peto", 
                        `visible`="(tests:petopeto)"),
                    list(
                        `name`="chisqr[logrank]", 
                        `title`="\u03C7\u00B2", 
                        `type`="number", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="chisqr[gehan]", 
                        `title`="\u03C7\u00B2", 
                        `type`="number", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="chisqr[taroneware]", 
                        `title`="\u03C7\u00B2", 
                        `type`="number", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="chisqr[petopeto]", 
                        `title`="\u03C7\u00B2", 
                        `type`="number", 
                        `visible`="(tests:petopeto)"),
                    list(
                        `name`="df[logrank]", 
                        `title`="df", 
                        `type`="integer", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="df[gehan]", 
                        `title`="df", 
                        `type`="integer", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="df[taroneware]", 
                        `title`="df", 
                        `type`="integer", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="df[petopeto]", 
                        `title`="df", 
                        `type`="integer", 
                        `visible`="(tests:petopeto)"),
                    list(
                        `name`="pvalue[logrank]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="pvalue[gehan]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="pvalue[taroneware]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="pvalue[petopeto]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue", 
                        `visible`="(tests:petopeto)"))))
            self$add(jmvcore::Table$new(
                options=options,
                name="testspw",
                title="Pairwise Comparisons",
                visible="(testspw)",
                refs=list(
                    "multcomp"),
                clearWith=list(
                    "event",
                    "eventLevel",
                    "elapsed",
                    "groups"),
                columns=list(
                    list(
                        `name`="v1", 
                        `title`="", 
                        `type`="text", 
                        `content`="($key[1])"),
                    list(
                        `name`="v2", 
                        `title`="", 
                        `type`="text", 
                        `content`="($key[2])"),
                    list(
                        `name`="statpw[logrank]", 
                        `title`="Test", 
                        `type`="text", 
                        `content`="Log-rank", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="statpw[gehan]", 
                        `title`="Test", 
                        `type`="text", 
                        `content`="Gehan", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="statpw[taroneware]", 
                        `title`="Test", 
                        `type`="text", 
                        `content`="Tarone-Ware", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="statpw[petopeto]", 
                        `title`="Test", 
                        `type`="text", 
                        `content`="Peto-Peto", 
                        `visible`="(tests:petopeto)"),
                    list(
                        `name`="nupw[logrank]", 
                        `title`="\u03BD", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="nupw[gehan]", 
                        `title`="\u03BD", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="nupw[taroneware]", 
                        `title`="\u03BD", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="nupw[petopeto]", 
                        `title`="\u03BD", 
                        `visible`="(tests:petopeto)"),
                    list(
                        `name`="nusepw[logrank]", 
                        `title`="SE", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="nusepw[gehan]", 
                        `title`="SE", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="nusepw[taroneware]", 
                        `title`="SE", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="nusepw[petopeto]", 
                        `title`="SE", 
                        `visible`="(tests:petopeto)"),
                    list(
                        `name`="zpw[logrank]", 
                        `title`="z", 
                        `format`="zto,p", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="zpw[gehan]", 
                        `title`="z", 
                        `format`="zto,p", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="zpw[taroneware]", 
                        `title`="z", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="zpw[petopeto]", 
                        `title`="z", 
                        `visible`="(tests:petopeto)"),
                    list(
                        `name`="ppw[logrank]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue", 
                        `visible`="(tests:logrank)"),
                    list(
                        `name`="ppw[gehan]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue", 
                        `visible`="(tests:gehan)"),
                    list(
                        `name`="ppw[taroneware]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue", 
                        `visible`="(tests:taroneware)"),
                    list(
                        `name`="ppw[petopeto]", 
                        `title`="p", 
                        `type`="number", 
                        `format`="zto,pvalue", 
                        `visible`="(tests:petopeto)"))))
            self$add(jmvcore::Image$new(
                options=options,
                name="sc",
                title="Survival Curve",
                visible="(sc)",
                width=600,
                height=400,
                renderFun=".plot",
                clearWith=list(
                    "event",
                    "eventLevel",
                    "elapsed",
                    "groups",
                    "cens",
                    "ci",
                    "units",
                    "risk",
                    "median")))
            self$add(jmvcore::Image$new(
                options=options,
                name="chf",
                title="Cumulative Hazard Function",
                visible="(chf)",
                width=600,
                height=400,
                renderFun=".plot",
                clearWith=list(
                    "event",
                    "eventLevel",
                    "elapsed",
                    "groups",
                    "units",
                    "logscale")))}))

survBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "survBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "deathwatch",
                name = "surv",
                version = c(1,0,0),
                options = options,
                results = survResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE,
                weightsSupport = 'auto')
        }))

#' Survival Analysis
#'
#' 
#' @param data .
#' @param elapsed .
#' @param event .
#' @param eventLevel .
#' @param groups .
#' @param tests .
#' @param testspw .
#' @param sc .
#' @param chf .
#' @param ci .
#' @param cens .
#' @param risk .
#' @param median .
#' @param logscale .
#' @param units .
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$summary} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$medianestimates} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$tests} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$testspw} \tab \tab \tab \tab \tab a table \cr
#'   \code{results$sc} \tab \tab \tab \tab \tab an image \cr
#'   \code{results$chf} \tab \tab \tab \tab \tab an image \cr
#' }
#'
#' Tables can be converted to data frames with \code{asDF} or \code{\link{as.data.frame}}. For example:
#'
#' \code{results$summary$asDF}
#'
#' \code{as.data.frame(results$summary)}
#'
#' @export
surv <- function(
    data,
    elapsed,
    event,
    eventLevel,
    groups,
    tests,
    testspw = FALSE,
    sc = TRUE,
    chf = FALSE,
    ci = FALSE,
    cens = FALSE,
    risk = FALSE,
    median = FALSE,
    logscale = FALSE,
    units = "") {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("surv requires jmvcore to be installed (restart may be required)")

    if ( ! missing(elapsed)) elapsed <- jmvcore::resolveQuo(jmvcore::enquo(elapsed))
    if ( ! missing(event)) event <- jmvcore::resolveQuo(jmvcore::enquo(event))
    if ( ! missing(groups)) groups <- jmvcore::resolveQuo(jmvcore::enquo(groups))
    if (missing(data))
        data <- jmvcore::marshalData(
            parent.frame(),
            `if`( ! missing(elapsed), elapsed, NULL),
            `if`( ! missing(event), event, NULL),
            `if`( ! missing(groups), groups, NULL))

    for (v in groups) if (v %in% names(data)) data[[v]] <- as.factor(data[[v]])

    options <- survOptions$new(
        elapsed = elapsed,
        event = event,
        eventLevel = eventLevel,
        groups = groups,
        tests = tests,
        testspw = testspw,
        sc = sc,
        chf = chf,
        ci = ci,
        cens = cens,
        risk = risk,
        median = median,
        logscale = logscale,
        units = units)

    analysis <- survClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}

