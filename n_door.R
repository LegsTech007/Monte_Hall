door <- function(n_door,pick_door,iteration = 1) {
  
  win <- 0

  for (i in 1:iteration) {
    doors <- c(1:n_door)
    the_door <- sample(1:n_door, 1)                               #randomly picks door that has prize
    doors_x <- doors[(doors != the_door) & (doors != pick_door)]  #set of doors that can be shown
    doors_y <- doors[doors != pick_door]                          #set of doors the player thinks can be shown
    
    for (j in 1:(n_door - 2)) {                                   #keep randomly removing doors until there are 2
      if(length(doors_x) == 1) {  
        shown_door <- doors_x
      } else {
        shown_door <- sample(doors_x, 1)
      }
      doors_x <- doors_x[doors_x != shown_door]                   #remove most recent shown door from set
      doors_y <- doors_y[doors_y != shown_door]      
    }
    
    pick_door <- doors_y
    
    if (pick_door == the_door) {
      win <- win +1                                               #increment win if correct
    }
  }
    
print(win/i)
}