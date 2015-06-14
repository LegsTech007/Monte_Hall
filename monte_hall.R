hall_play <- function(n_door) {
  
  doors <- c(1:n_door)
  pick_door <- readline("What number door do you want?     ")
  the_door <- sample(doors, 1)                                  #randomly picks door that has prize
  doors_x <- doors[(doors != the_door) & (doors != pick_door)]  #set of doors that can be shown
  doors_y <- doors[doors != pick_door]                          #set of doors the player thinks can be shown
  
  for (i in 1:(n_door - 2)) {                                   #keep randomly removing doors until there are 2
    if(length(doors_x) == 1) shown_door <- doors_x
    else shown_door <- sample(doors_x, 1)
    print(paste0("The prize is not behind door # ", shown_door))
    doors_x <-  doors_x[doors_x != shown_door]                   #remove most recent shown door from set
    doors_y <- doors_y[doors_y != shown_door]      
  }
  
  print("There is one door left.")
  switch_door <- readline("Do you want to switch the door you selected with the one remaining? (Y/N)     ")
  if (switch_door == "Y") pick_door <- doors_y
  
  if (pick_door == the_door) print("You Win.")
  else print("You Lose.")
  
}