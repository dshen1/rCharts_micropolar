require(rCharts)

make_dataset = function(data = data){
  lapply(toJSONArray2(data, json = F, names = F), unlist)
}


dart <- data.frame(
  score = c(20,1,18,4,13,6,10,15,2,17,3,19,7,16,8,11,14,9,12,5),
  measure = rep(451/2, 20),  #451 mm diameter
  random = runif(20,0,1),
  scoreAngle = 0:19 * 360/19
)

dartboard <- rCharts$new()
dartboard$setLib(
  "../libraries/widgets/micropolar"
)
dartboard$set(
  data = make_dataset( dart ),
  radialDomain = c(0, 225),
  radialTicksSuffix = '',
  angularDomain = as.character(dart$score),
  minorTicks = 0,
  type = "areaChart",  
  height = 300,
  width = 300
)
dartboard

dartLine <- rCharts$new()
dartLine$setLib(
  "../libraries/widgets/micropolar"
)
dartLine$set(
  data = make_dataset( dart[,c(4,2,1)] ),
  radialDomain = c(0, 225),
  angularTicksSuffix = '',
  #angularDomain = as.character(dart$score),
  originTheta = -90,
  flip = TRUE,
  type = "linePlot",  
  height = 300,
  width = 300
)

dartLine