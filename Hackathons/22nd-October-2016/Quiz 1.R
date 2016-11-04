#Q1)What is the sum of the output?
#x = c(8, 7, 5)
#x %% 2

# Answer:

x=c(8,7,5)
sum (x %% 2)


# Q2)What length is the vector x created below?
# 
# x = c(1:5, 0, 8:10)

#Answer:

x = c(1:5, 0, 8:10)
length(x)

# Q3)The vector x has been created via x = c(9,8,7)
# What one line piece of code should I use to calculate the log of the sum of x?
# 
# Answer:

x = c(9, 8 ,7)
sum(log(x))

#Q4) Which vector has the larger standard deviation?
# x = c(1:4)
# y = c(5:9)
# 
# Answer:

x = c(1:4)
y = c(5:9)

if (sd(x) > sd(y)){
  print('Standart deviation of x is bigger than y')
} else{
  if (sd(x) == sd(y)){
    print('Standard deviation of x and standard deviation of y are equal')
  }
}
  print('Standard deviaton of y is bigger than standard deviation x')
  
  
  
# Q5)The command x = c(123, 456, 789, 987, 654, 321) is run.
# What does x[4:2] give?
# 
# Answer:
  x = c(123, 456, 789, 987, 654, 321)
  x[4:2]

#Q6)The following commands are run. What is the result of these commands?
# x = c(4, 7, 5) + 3
# sd(x)
  
#Answer:
  x = c(4, 7, 5) + 3
  sd(x)
  1.527525
  
#Q7)What is the first element of output from the following commands?
  
# x = c(5, 9, 3) + 5
# rev(x)
#   
# Answer:
  
  x = c(5, 9, 3) + 5
  rev(x)[1]
  8
# Q8)
# The command x = 5 * (8 - 3) / 2 has been run.
# What value does x hold?
  
#Answer:
  x = 5 * (8 - 3) / 2
  print (x)

# Q9)
# The following code is run. Is x or y the longer vector?
# x = c(1, NA, NULL, NA, 4)
# y = c(2, NA, NULL, NULL, 5)
  
#Answer:
  x = c(1, NA, NULL, NA, 4)
  y = c(2, NA, NULL, NULL, 5)
  if (length(x) > length(y)){
    print('X is a longer vector than y')
  } else{
    if (length(x) == length(y)){
      print('Length of x and y vectors are same')
    }
    else
    {print('Y is a longer vector than x')}
  } 
  
  
# Q10)
# The following command is run. What is the mean of the variable?
# 
# x = c(5, 7, 9, 11, 13, 15)
  
#Answer:
  x = c(5, 7, 9, 11, 13, 15)
  mean(x)
  10
