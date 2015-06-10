win <- 0

for (i in 1:1000) {

  switch_door <- TRUE
  pick_door <- sample(1:3, 1)
  doors <- c(1:3)

  the_door <- sample(1:3, 1)
  doors_x <- doors[!(doors == the_door) & !(doors == pick_door)]

  if(length(doors_x) == 1) {
    shown_door <- doors_x
  } else {
    shown_door <- sample(doors_x, 1)
  }

  if(switch_door == TRUE) {
    pick_door <- doors[!(doors == pick_door | doors == shown_door)]
  }

  if(pick_door == the_door) {
    win <- win + 1
  } 
  w_prob <- (win/i)*100
}

print(w_prob)