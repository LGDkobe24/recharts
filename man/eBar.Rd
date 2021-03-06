% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eBar.R
\name{eBar}
\alias{eBar}
\title{Create an HTML bar charts widget using the ECharts(version:3.2.2) library}
\usage{
eBar(dat, xvar = NULL, yvar = NULL, series = NULL, size = NULL,
  horiz = FALSE, stackGroup = NULL, theme = "default", title = NULL,
  subtitle = NULL, title.x = "center", title.y = "top", legend = TRUE,
  legend.x = "left", legend.y = "top", legend.orient = "horizontal",
  toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right",
  toolbox.y = "top", dataView = TRUE, readOnly = FALSE, mark = TRUE,
  dataZoom = FALSE, magicType = TRUE, tooltip = TRUE,
  tooltip.trigger = "axis", tooltip.formatter = "", axis.scale = TRUE,
  axis.line = TRUE, axis.tick = FALSE, axis.lable = TRUE,
  axis.splitLine = TRUE, axis.splitArea = FALSE, axis.boundaryGap = TRUE,
  xlab = TRUE, xlab.type = "category", xlab.data = NULL,
  xlab.position = "bottom", xlab.name = "", xlab.namePosition = "start",
  xlim = NULL, ylab = TRUE, ylab.type = "value", ylab.data = NULL,
  ylab.position = "left", ylab.name = "", ylab.namePosition = "start",
  ylim = NULL, calculable = TRUE, showLabel = TRUE, opt = list())
}
\arguments{
\item{dat}{a data object (a matrix, a data frame or a factor array)}

\item{xvar, yvar}{objects of class "formula" (or one that can be coerced 
to that class):  x,y coordinates of the given data.frame colnames, e.g. 
\code{xvar = ~xAxisName}; \code{yvar = ~yAxisName}. xvar, yvar only needed for the 
data.frame data input.}

\item{series}{an "formula" object: Associates the levels of variable
with symbol color, e.g. \code{series = ~groupName}}

\item{size}{an array of html widget width and height(either numeric pixels 
or percentage could be accepted): e.g. size = c(1024, 768).}

\item{horiz}{logical. If FALSE, the bars are drawn vertically with the 
first bar to the left.}

\item{stackGroup}{list object, used to make series pre-stacked before rendering
whole bar chart, if \code{unique(df[["groupName"]])} = c("a", "b", "c", "d", 
"e", "f") and an example legal input for stackGroup should be: 
\code{stackGroup = list(c("a","b"), c("e","f"))}. And the c("a","b") and 
c("e","f") will be stacked into two bar, and the "c" and "d" will account 
two seperated bars.}

\item{theme}{an object of theme name. see(\url{http://datatables.net/extensions/index}) for detail.
supported theme: \code{c("default", "vintage", "dark", "westeros", "essos", "wonderland", "walden",
"chalk", "infographic", "macarons", "roma", "shine", "purple-passion")}}

\item{title}{an overall title for the plot. you can modify title widget after chart has been
generated: barEchart + eTitle(title = "your title.")}

\item{title.x, title.y}{the xy coordinates of main title, besides the excat exact pixels value, 
x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
you can modify title widget after chart has been generated: 
\code{barEchart + eTitle(title="main title", x = "left", y=10)}}

\item{legend}{logical whether the legend widget show or not, default is TRUE.
you can modify legend widget after chart has been generated, the legend position and 
legend orientation are available at present.
\code{barEchart + eLegend(show = TRUE)}}

\item{legend.x, legend.y}{the xy coordinates of legend, besides the excat exact pixels value, 
x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
you can modify legend widget after chart has been generated: 
\code{barEchart + eLegend(x = "right", y="top")}}

\item{legend.orient}{an element of c("horizontal", "vertical"), default is "horizontal"
you can modify legend widget after chart has been generated: 
\code{barEchart + eLegend(orient = "vertical")}}

\item{toolbox}{logical whether the toolbox widget show or not, default is TRUE.
you can modify toolbox widget after chart has been generated, the toolbox position, toolbox 
element and toolbox orientation are available at present.  
\code{barEchart + eToolbox(show = TRUE)}}

\item{toolbox.orient}{an element of c("horizontal", "vertical"), default is "horizontal"
you can modify toolbox widget after chart has been generated: 
\code{barEchart + eToolbox(orient = "vertical")}}

\item{toolbox.x, toolbox.y}{the xy coordinates of toolbox, besides the excat exact pixels value, 
x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
you can modify toolbox widget after chart has been generated: 
\code{barEchart + eToolbox(x = "right", y="top")}}

\item{tooltip}{logical whether the tooltip widget for front-end interactive chart
show or not. default is TRUE. you can modify tooltip widget after chart has been generated, 
the tooltip trigger and tooltip formatter is available at present.  
\code{barEchart + eTooltip(show = FALSE)}}

\item{tooltip.trigger}{an element of c("axis", "item"), default is "axis" for bar chart.
"axis" option for trigger will show all the information of mouse;
"item" option for tirgger will only show the given item information of mouse.
you can modify tooltip widget after chart has been generated: 
\code{barEchart + eTooltip(trigger = "axis")}}

\item{tooltip.formatter}{the information formatter for tooltip widget, 
default is "<a>:<b><c>" for bar chart.
you can modify tooltip widget after chart has been generated: 
\code{barEchart + eTooltip(formatter = "<a><b>:<c>")}}

\item{calculable}{logical whether the front-end interactive chart will 
support the drag-recalculable feature.
the size and calculable option can be setted after bar chart has been 
generated through eOption: \code{barEchart + eOption(calculable = TRUE)}}

\item{dataview, mark, restore, dataZoom, magicType}{logical variable whether the dataview
, mark, restore, dataZoom or magicType tool in toolbox widget show or not, 
default is TRUE. you can modify toolbox widget after chart has been generated, 
the toolbox position, toolbox element and toolbox orientation are available at present.  
\code{barEchart + eToolbox(dataView = FALSE)}}
}
\description{
This function creates an HTML widget to display matrix, data.frame and 
factor array, using the JavaScript library ECharts3.
}
\note{
You are recommended to use lazyPlot function for interactive chart
  option set through "shiny" server.
}
\examples{
require(plyr)
dat = ddply(iris, .(Species), colwise(mean))  
rownames(dat) = dat[,1]
dat = dat[, -1]
dat
eBar(dat)
eBar(dat, horiz = TRUE)
#mode 2 input.
df2 <- data.frame(
 saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85),
 seller=c(rep("Yellow",7), rep("Red",7), rep("White",7)),
 weekDay = c(rep(c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"),3)),
 stringsAsFactors =FALSE
)
dat <- df2
xvar=~weekDay; yvar= ~saleNum; series=~seller
eBar(df2, xvar = ~seller, ~saleNum, ~weekDay )
dat <- df2[1:7,]
eBar(dat, ~weekDay, ~saleNum)
dat <- cut(rnorm(1000), -4:4)
eBar(dat)

}

