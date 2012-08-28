#' Open graph in gml format
#'
#' This function is used to visualize relation between individual sequence clusters. Graph derived from groups of mutually connected 
#' clusters is loaded from .gml file. Layout is caclulated using Frucherman-Reingold algorithm and shown in interactive plot. 
#' Size of vertices is proportional tu cluster size. Width of edges is proportional to numbe of mutually similar reads
#' Function does not take any parameters.
#' @export 
#' @examples 
#' ## do nut run!
#' ## gmlView()
gmlView=function(){
	suppressPackageStartupMessages(library(igraph))
	suppressPackageStartupMessages(library(tcltk))
	filters=matrix(c("gml graph",".gml","gml graph",".GML","All files","*"),ncol=2,byrow=T)
	gmlFile=tk_choose.files(caption='Select graph files in .gml format',multi=F,filters=filters)
	gml=read.graph(gmlFile,format='gml')
	tkplot(gml,layout=layout.fruchterman.reingold,vertex.size=round(log2(V(gml)$size+5)),vertex.label=V(gml)$name,edge.width=(log2(E(gml)$weight)),vertex.label.cex=1,canvas.width=850, canvas.height=850)
}
