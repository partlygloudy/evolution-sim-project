globals [initial-population initial-patches growback]
breed [food_patches food_patch]
breed [people person]

turtles-own [
  energy          ;; the amount of energy a turtle has
  vision          ;; the amount of distance a turtle can see
  social          ;; the social behavior of the turtle
  strength 
  speed 
]

patches-own [
 food
]

;;
;; Setup
;;
to setup
  clear-all
  set initial-population 100
  set initial-patches 100
  set growback 1 ;Will be set by slider, patch growback 
  create-people initial-population [turtle-setup]
  create-food_patches  initial-patches [setup-patches]
  reset-ticks
end

to turtle-setup
  set color red
  set shape "circle"
  move-to one-of patches with [not any? other turtles-here]
  set energy 25
  set social random-float 1 
  set vision random-float 1
  set speed random-float vision
  set strength (1 - vision - speed) 
end

to setup-patches
  set color green
  set shape "square"
  set food 1
  move-to one-of patches with [not any? other turtles-here]
end

to-report random-in-range [low high]
  report low + random (high - low + 1)
end

to patch-growback 
  create-food_patches round (random-normal growback (growback / 2)) [setup-patches]
end 
