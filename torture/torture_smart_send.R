#. Princípios do algoritmo:
#.. - Contagem de parenteses abertos e fechados
#.. - Ocorrência de vírgula iniciando ou finalizando linhas

#. Um caso bem simples
sd(rnorm(1e3,
         m=10))  #()

sd(rnorm(1e3,
#blablabla
#blebleble    #()
#)
#(
#bliblibli


         m=10))

sd(rnorm(1e3,
         m=10)  #()



)

v1 <- sd(rnorm(1e3,
               m=10))

v1 <- sd(rnorm(1e3,

               m=10)

)

sd(rnorm(1e3,

#)
#(


         m=10))

sd(rnorm(1e3,

         m=10    #()
)
)

#. Um caso simples
sd(rnorm(1e3,
         m=10,
         sd=2)
  )

sd(rnorm(1e3,
         m=10,
         sd=2
))

v1 <- sd(rnorm(1e3,
               m=10,
               sd=2)
)

#. Um caso bem simples, mas alterando a posição da vírgula
sd(rnorm(1e3
         ,m=10))

sd(rnorm(1e3
         ,m=10)    #()
)

v1 <- sd(rnorm(1e3
               ,m=10))

v1 <- sd(rnorm(1e3
               ,m=10)
)

#. Um caso simples, mas alterando a posição da vírgula
sd(rnorm(1e3,
         m=10
         ,sd=2)
)

sd(rnorm(1e3,
         m=10
         ,sd=2
)
)

v1 <- sd(rnorm(1e3
               ,m=10
               ,sd=2))

v1 <- sd(rnorm(1e1
               ,m=10

               ,sd=2)
)

#. Funções
myf <- function(a=1, b=2)
  return(a+b)


myf <- function(a=1,
                b=2,
                c=3)
{
  sum_ab <- sum(a, b)
  sum_to <- sum(sum_ab, c)       #!   ?
  return(sum_to)
}

myf <- function (formula,
                 data = NULL,
                 projections = FALSE,
                 qr = TRUE,
                 contrasts = NULL, ...)
{
    Terms <- if (missing(data))
        terms(formula, "Error")
    else terms(formula, "Error", data = data)
    indError <- attr(Terms, "specials")$Error
    if (length(indError) > 1L)
        stop(sprintf(ngettext(length(indError), "there are %d Error terms: only 1 is allowed",
            "there are %d Error terms: only 1 is allowed"), length(indError)),
            domain = NA)
    lmcall <- Call <- match.call()
    lmcall[[1L]] <- quote(stats::lm)
    lmcall$singular.ok <- TRUE
    if (projections)
        qr <- lmcall$qr <- TRUE
    lmcall$projections <- NULL
    if (is.null(indError)) {
        fit <- eval(lmcall, parent.frame())
        fit$call <- Call
        structure(fit, class = c(if (inherits(fit, "mlm")) "maov",
            "aov", oldClass(fit)), projections = if (projections)
            proj(fit))
    }
    else {
        if (pmatch("weights", names(Call), 0L))
            stop("weights are not supported in a multistratum aov() fit")
        deparseb <- function(expr) deparse(expr, width.cutoff = 500L,
            backtick = TRUE)
        opcons <- options("contrasts")
        options(contrasts = c("contr.helmert", "contr.poly"))
        on.exit(options(opcons))
        allTerms <- Terms
        errorterm <- attr(Terms, "variables")[[1L + indError]]
        intercept <- attr(Terms, "intercept")
        ecall <- lmcall
        ecall$formula <- as.formula(paste(deparseb(formula[[2L]]),
            "~", deparseb(errorterm[[2L]]), if (!intercept)
                "- 1"), env = environment(formula))
        ecall$method <- "qr"
        ecall$qr <- TRUE
        ecall$contrasts <- NULL
        er.fit <- eval(ecall, parent.frame())
        options(opcons)
        nmstrata <- attr(terms(er.fit), "term.labels")
        nmstrata <- sub("^`(.*)`$", "\\1", nmstrata)
        nmstrata <- c("(Intercept)", nmstrata)
        qr.e <- er.fit$qr
        rank.e <- er.fit$rank
        if (rank.e < NROW(er.fit$coefficients))
            warning("Error() model is singular")
        qty <- er.fit$residuals
        maov <- is.matrix(qty)
        asgn.e <- er.fit$assign[qr.e$pivot[1L:rank.e]]
        maxasgn <- length(nmstrata) - 1L
        nobs <- NROW(qty)
        len <- if (nobs > rank.e) {
            asgn.e[(rank.e + 1L):nobs] <- maxasgn + 1L
            nmstrata <- c(nmstrata, "Within")
            maxasgn + 2L
        }
        else maxasgn + 1L
        result <- setNames(vector("list", len), nmstrata)
        lmcall$formula <- form <- update(formula, paste(". ~ .-",
            deparseb(errorterm)))
        Terms <- terms(form)
        lmcall$method <- "model.frame"
        mf <- eval(lmcall, parent.frame())
        xlev <- .getXlevels(Terms, mf)
        resp <- model.response(mf)
        qtx <- model.matrix(Terms, mf, contrasts)
        cons <- attr(qtx, "contrasts")
        dnx <- colnames(qtx)
        asgn.t <- attr(qtx, "assign")
        if (length(wts <- model.weights(mf))) {
            wts <- sqrt(wts)
            resp <- resp * wts
            qtx <- qtx * wts
        }
        qty <- as.matrix(qr.qty(qr.e, resp))
        if ((nc <- ncol(qty)) > 1L) {
            dny <- colnames(resp)
            if (is.null(dny))
                dny <- paste0("Y", 1L:nc)
            dimnames(qty) <- list(seq(nrow(qty)), dny)
        }
        else dimnames(qty) <- list(seq(nrow(qty)), NULL)
        qtx <- qr.qty(qr.e, qtx)
        dimnames(qtx) <- list(seq(nrow(qtx)), dnx)
        for (i in seq_along(nmstrata)) {
            select <- asgn.e == (i - 1L)
            ni <- sum(select)
            if (!ni)
                next
            xi <- qtx[select, , drop = FALSE]
            cols <- colSums(xi^2) > 1e-05
            if (any(cols)) {
                xi <- xi[, cols, drop = FALSE]
                attr(xi, "assign") <- asgn.t[cols]
                fiti <- lm.fit(xi, qty[select, , drop = FALSE])
                fiti$terms <- Terms
            }
            else {
                y <- qty[select, , drop = FALSE]
                fiti <- list(coefficients = numeric(), residuals = y,
                  fitted.values = 0 * y, weights = wts, rank = 0L,
                  df.residual = NROW(y))
            }
            if (projections)
                fiti$projections <- proj(fiti)
            class(fiti) <- c(if (maov) "maov", "aov", oldClass(er.fit))
            result[[i]] <- fiti
        }
        structure(class = c("aovlist", "listof"), result[!vapply(result,
            is.null, NA)], error.qr = if (qr)
            qr.e, call = Call, weights = if (length(wts))
            wts, terms = allTerms, contrasts = cons, xlevels = xlev)
    }
}
