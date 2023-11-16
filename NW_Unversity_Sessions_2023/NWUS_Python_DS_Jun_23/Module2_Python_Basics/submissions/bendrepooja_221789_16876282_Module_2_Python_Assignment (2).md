# MSDS 430 Module 2 Python Assignment

<div class="alert alert-block alert-warning"><b>In this assignment you will read through this notebook then complete the exercises. Once you are satisfied with your results, submit your notebook and html file to Canvas. Your files should include all output, i.e. run each cell and save your files before submitting.</b></div>

<div class="alert alert-block alert-info"> This week we are starting to learn how to write short programs in Python beyond print statements and mathematical calculations. We learned about a few different data types last week such as integers, floats, and strings. This week we will learn about: 

- The bool data type and Boolean expressions that will be used when we use conditional statements. 
- Conditional statements (or conditionals) are also referred to as <i><u>selection</u></i> since Python only "selects" the block of code to execute based on the Boolean value of the condition. 
- The <b>if/elif/else</b> structure is quite useful in programming when numerous cases need to be considered and handled accordingly.</div>

<div class="alert alert-block alert-danger"><b>As mentioned before, in all of the problems you will see <font color=black>#TODO</font> instructions added as comments on the code cell provided. You will need to complete each of these as indicated to avoid losing points. Do not rearrange or delete these.</b></div>

### Python Libraries and Modules

Throughout this course we will be using various modules and libraries. Python libraries are collections of related modules. Modules are blocks of code that can be imported into our programs and accessed as needed. The use of libraries and the modules contained within them is a way to repeatedly use code without having to recreate it each time. Refer to __[Libraries in Python](https://www.geeksforgeeks.org/libraries-in-python/)__ for more information on Python libraries and common ones used in data science.

Python has a standard library that contains many built-in functions, modules, and constants. From your readings this week, you have seen uses for the `math` module and the `random` module. These are just two of the many built-in modules that Python comes with. More documentation on all of Python's built-ins can be found in __[The Python Standard Library](https://docs.python.org/3/library/index.html)__. You are certainly encouraged to explore Python's standard library beyond what is discussed in this assignment and what you learn from your readings this week.

To use any module, we need to `import` it prior to its use. For example:
```python
import [module]
```
This approach creates a new name (the name of the module), which refers to a `module object`. In the example below, we import the `math` module so that `math` is a module object. And we call the function `factorial(n)` using the `math` module object.


```python
import math

math.factorial(15)
```




    1307674368000



The `math` module also has some built-in constants such as `pi` and `e`. If we want to calculate the volume of a sphere with radius 5, we would use the constant `math.pi`. Because we imported the math module in the cell above, we do not need to import it again for this next calculation. However, the cell above this must be run first for our calculation below to work. This is also the case each time you shut down and restart your kernel.


```python
r = 5 # Set the radius equal to 5

volume = 4/3*math.pi*r**3  # Calculate the volume of a sphere with radius 5

print(round(volume, 3))  # Print the volume rounded to 3 decimals using Python's built-in `round()` function
```

    523.599
    

There are other ways to import a module, such as:
```python
import [module] as xyz
```
This approach defines an alias for the module so that when we call a function (or constant) within that module we can prefix it with `xyz.`

Below are a couple of examples using the `statistics` module. Here we import `statistics` using the alias `stats`. In the first example we call the `median()` function that takes an unordered list of numbers and returns the median of the list. So, behind the scenes it is ordering the list from least to greatest then finding the middle value.


```python
import statistics as stats

L1 = [5,2,19,11,0,2,13,47]  # Define the list of data

stats.median(L1)
```




    8.0



This next example finds the sample standard deviation of the same list we used above. Similar to a graphing calculator, Python is determining all of the necessary intermediate values that go into calculating the standard deviation.


```python
stats.stdev(L1)  # Pass L1 through the `stdev()` function
```




    15.435927479191431



A third method for importing a module is to use this syntax:
```python
from [module] import *
```
This will import _`everything`_ defined in the module and give us _`direct`_ access to constants, functions, etc. in the module without having to to _prefix_ the module name like we did above. However, this is _**not**_ a good practice in general since two modules might define two different methods with the same name. We only mention it here for informational purposes.

Another module from your readings this week is the `random` module. One of the most basic uses of this is to generate a random real-valued number within the interval [0.0, 1.0) using the `random()` function.


```python
import random

my_number = random.random()

my_number
```




    0.12387284019702183



Or we could use the `uniform` method to generate a random floating point number between two values.


```python
random.uniform(10, 100)
```




    25.91318429988288



If we wish to generate a random integer we have a few options. For example, we can use the function `randrange(start, stop, step)` to generate a random integer from a range of integers starting at `start` but less than `stop` with specified increment of `step`. 

In this next example, the `randrange` function will randomly generate a number between 3 and 49, inclusive, with step 2. In other words, it will generate a random integer from range of integers: `-3, -1, 3, 5, 7, ..., 47, 49`.


```python
random.randrange(-3, 50, 2)
```




    39



The value for `step` is optional unless you have specific needs. By default, `step` is one if nothing is specified. So, `randrange(a, b)` will return a random integer `N` such that `a ≤ N < b`.


```python
random.randrange(-3, 50)
```




    18



We can also simply use `randrange(stop)`. Using this syntax, both `start` and `step` are not specified. In the previous example we saw the default for `step` is one.  The default for `start` is zero. So, this next example generates a random integer between 0 and 49, inclusive.


```python
random.randrange(50)
```




    8



Lastly, an alternative to `randrange` is `randint(a, b)`. This accomplishes the same thing as `randrange(a, b + 1)`. The `step` in `randint` is fixed at one, so we can't pass a third argument to indicate a different step size.

<div class="alert alert-block alert-success"><b>Problem 1 (5 pts.)</b>: Generate a random number and convert it to a fraction.<br><br>
1. Import the necessary modules as indicated in the cell provided.<br>
2. Generate a random float type that is greater than or equal to -100 and less than 150 and round to 5 decimals.<br>
    3. Convert the random number to a fraction using the <mark><b>fractions</b></mark> module from the Python standard library.<br>
4. Create a formatted print statement that generates a message shown below this cell. <i><u>Note: Your values will differ.</u></i><br><br>
<font color=black><i><u>Be sure to complete each <b>#TODO</b> statement as indicated in the cell provided.</u></i></font></div>

`The fractional form of 135.43846 is 4765317171778389/35184372088832.`


```python
#TODO: Import the fractions module with the alias 'frac'
import fractions as frac

#TODO: Import the random module again with the alias 'rand'
import random as rand

#TODO: Generate a random number ≥ -100 and < 150. Assign this to a variable and round to 5 decimal places.
random_float=round(rand.uniform(-100,150),5)
#TODO: Convert your random number to a fraction using the appropriate function from the fractions module.
random_fraction=frac.Fraction(random_float).limit_denominator()

#TODO: Create a formatted print statement like above that displays the number and its fractional form.
print(f"Random number:{random_float} \nFraction:{random_fraction}")
```

    Random number:17.72893 
    Fraction:1772893/100000
    

### Boolean expressions

Last week we briefly introduced the built-in `bool` data type. The `bool` data type only has two values - `True` and `False`. It is important to recognize that Boolean values are not strings and they are case sensitive (`true` and `false` are not Boolean values). We can assign a Boolean value to a variable or we can create **Boolean expressions** that will evaluate to a Boolean value. In order to understand what a Boolean expression is, we have to introduce some built-in operators that are used in those expressions.

### Comparison and Logical Operators

We worked with mathematical operators last week and will continue to do so in this assignment and others, but there are other types of built-in operators within Python. The operators we are introducing this week are `comparison` and `logical` operators.

Comparison operators are `==`, `!=`, `<=`, `>=`, `<`, `>`, `is`, and `is not`. These operators are used in Boolean expressions to compare something on the left side with something else on the right side. When the expression is executed, it will result in a Boolean value. The comparison operators `is` and `is not` are sometimes referred to as `identity operators` since they are used to determine if two objects are identical. 

This next example has assigned the value `3` to `x` and the value `5` to `y`. We then have the Boolean expression `x > y`. Since `3` is not greater than `5`, the expression will evaluate to `False`. Run the cell then try changing the values of `x` and `y` and the comparison operator.


```python
x = 3
y = 5
x > y # Boolean expression
```




    False



The `==` is used to determine equivalence. It is different than `=`, which is an assignment token used in an assignment statement.


```python
car1 = 'sedan'
car2 = 'sedan'
car1 == car2
```




    True



The operators `is` and `is not` are used to test for identical objects. Everything in Python is an object and is assigned (behind the scenes) an object identification number. We can check the identity of a variable using the built-in function `id()`. Depending on the data type, Python may assign a different ID to distinguish them or may assign the same ID to save memory.


```python
car1 is car2
```




    True



As you can see after running the previous cell, `car1` and `car2` are the same object since the Boolean expression evaluated to `True`. It turns out that this will always be the case for string objects. For clarification, we can see from the next cell that `car1` and `car2` have the same ID.


```python
id(car1), id(car2)
```




    (2494300871792, 2494300871792)



Though identical strings assigned to different variables will be the same object, this is not necessarily true for other data types. If we look at the `float` type, we see that the values are equivalent but the objects are not. You are encouraged to try this with other data types such as integers, lists, tuples, etc.


```python
num1 = -7.8903
num2 = -7.8903
num1 == num2, num1 is num2
```

Logical operators are `and`, `or`, and `not`. These are used to combine Boolean expressions and will also result in a Boolean value. The following example assigns a value to `a` and a value to `b` then compares the two. If either `a == b` or `a > b`, the result is the Boolean value `True`. As earlier, try changing the values of `a` and `b`, the comparison operators, and the logical operator to see how the resulting Boolean value changes in each case. 


```python
a = 7
b = 2
a == b or a >= b # Since at least one of these is true, this will evaluate to True.
```

We can also use parentheses to separate our Boolean expressions. Sometimes this is preferred for aesthetics, to designate the order of operation, or to quickly check that each side of the logical operator is a Boolean expression.


```python
(a == b) or (a >= b)  # using parentheses to make the order of operation explicit
```

### `if` Statement

Python will execute a program or code snippet in the order it is presented unless told otherwise. To alter this path of execution, we can use one or more `conditional statements` that check the value of a test expression and choose the path of execution based on the Boolean value. The simplest form of conditional statement is the `if` statement with the following syntax: 
```python
if TestExpression:
    body_of_if
    ...
```

There can be one statement or multiple statements in the `body_of_if`. The `TestExpression` will be a Boolean expression and the `body_of_if` will only be executed if the Boolean value of that expression is `True`. If it is `False`, Python will skip the body of `if` and jump to the code that follows. If no other lines of code follow this, the program will terminate.

<div class="alert alert-block alert-info">

### Jupyter Notebook will indent for you

- After typing in your if statement followed by a colon (:), hit return.
- Test this feature in the cell below.   
</div>


```python
# Place your cursor at the end of the following line and hit return to see how JN indents for you
if x < y:
```

<div class="alert alert-block alert-info">

### Test cases should represent each possible executable path in a conditional:

When creating conditionals, it is recommended you try some test cases. This is especially true as you get into more complicated conditionals. A best practice is to have at least one test case per condition to ensure that you have accounted for each possible path. <br><br>
For the next two examples, use the following test cases:
- Test case 1: Enter 100
- Test case 2: Enter a number different than 100 
</div>


```python
my_number = 100

your_number = int(input('Enter an integer: '))

if your_number == my_number:
    print(f'We both picked the number {my_number}!')
```

Notice in the previous example there is no output if you enter a number other than 100. We can add some code to the end to have Python do something else even if the `body_of_if` is not executed. To do this, we need to put any additional lines of code outside of the `if` structure.


```python
my_number = 100

your_number = int(input('Enter an integer: '))

if your_number == my_number:
    print(f'We both picked the number {my_number}!')
    
print("Have a nice day!")
```

In the previous example, the print statement outside of the `body_of_if` will print regardless of the value of the `TestExpression`.

### `if/else` Statement

We can also build on the basic `if` statement by adding an `else` clause. The basic syntax of an `if/else` statement looks like this:
```python
if TestExpression:
    body_of_if
else:
    body_of_else
```

If the `TestExpression` for `if` is `True`, then the `body_of_if` will be executed. Otherwise, the `body_of_else` will be executed. As with the `body_of_if`, the `body_of_else` can have one or multiple statements.

We can also use the built-in **`in`** operator in conjunction with a list to determine if an element is in that list. If the element is in the list, the Boolean expression evaluates to `True` and if not, it evaluates to `False`.

<div class="alert alert-block alert-info">

For the next example, use the following test cases:<br>
- Test case 1: Enter <mark>salmon</mark>
- Test case 2: Enter <mark>bananas</mark>
</div>


```python
groceries = ['apples', 'spinach', 'strawberries', 'salmon', 'rice', 'olive oil', 'tissues']

food = input('Enter an item you need from the grocery: ')

if food in groceries:
    print("That's on my list.")

else:
    print("I'll add that to my list")

print('Let me know if you need anything else.')
```

Below is an example that uses the comparison operator **`or`** in the test expression. Notice the each side of **`or`** is a Boolean expression. In particular, had this been `if pet == 'y'` **or** `'Y'`, an error would be generated since the right side `'Y'` would not be a Boolean expression.

<div class="alert alert-block alert-info">

For the next example, use the following test cases:<br>
- Test case 1: Enter <mark>y</mark> then any (lowercase) pet name<br>
- Test case 2: Enter <mark>Y</mark> then any pet name<br>
- Test case 3: Enter anything other than <mark>y</mark> or <mark>Y</mark>
</div>


```python
pet = input('Do you have a pet (Y or N)? ')

if pet == 'y' or pet =='Y':
    p_name = input("What is your pet's name? ")
    pet_name = p_name.capitalize()
    print(f'{pet_name} is a great name for a pet!')
else:
    print("Maybe someday you'll get a pet.")
```

With the logical operator **`or`**, only one of the Boolean expressions needs to be `True` for the entire `TestExpression` to evaluate to `True`. So, the `TestExpression` will only be `False` if **both** expressions are `False`. In the case of the logical operator **`and`**, both but must be `True` for the entire expression to evaluate to `True`. So, the expression will evaluate to `False` if one or both of the Boolean expressions is `False`.

<div class="alert alert-block alert-info">

For the next example, use the following test cases:<br>
- Test case 1: Enter <mark>2</mark> then <mark>8</mark>
- Test case 2: Enter <mark>2</mark> then any number between 5 and 10 other than <mark>8</mark><br>
- Test case 3: Enter a number between 0 and 5 other than 2. Then enter <mark>8</mark><br>
- Test case 4: Enter anything other than <mark>2</mark> and <mark>8</mark>
</div>


```python
num1 = int(input('Pick an integer greater than 0 but less than 5: '))
num2 = int(input('Pick an integer greater than 5 but less than 10: '))

num_a = 2
num_b = 8

if num1 == num_a and num2 == num_b:
    print('You win!')
    
else:
    print(f"I'm sorry. The winning numbers were {num_a} and {num_b}.")
```

<div class="alert alert-block alert-success"><b>Problem 2 (3 pts.)</b>: According to the syllabus for this class, any score less than 70 is a failing grade. Based on this, create a program to do the following:<br><br>
1. Prompt the user for a score.<br>
2. Create a simple <mark>if/else</mark> structure to inform the user if they passed or failed by displaying one of the messages shown below this cell.<br><br>
    <font color=b><i><u>Be sure to follow the <b>#TODO</b> instuctions in the cell provided.</u></i></font>
</div>

`What score did you earn for the class? 70.1
Congratulations! You passed the class!`

`What score did you earn for the class? 70
Congratulations! You passed the class!`

`What score did you earn for the class? 69.9
I'm sorry but you will need to retake the class.`

<div class="alert alert-block alert-info">

### Test cases for Problem 2:
- Test case 1: Enter 70.1
- Test case 2: Enter 70
- Test case 3: Enter 69.9<br><br>
<font color=b><b><u>Show all three cases by copying and pasting your code into additional cells</u></b></font>
</div>


```python
#TODO: Prompt the user for their score for the class
score=float(input("What score did you earn for the class?"))

#TODO: Create a simple if/else that generates each of the sample messages shown above.
if score >= 70:
    print("Congratulations! You passed the class!")
else:
    print("I'm sorry but you will need to retake the class.")
```

    What score did you earn for the class?70.1
    Congratulations! You passed the class!
    


```python
score=float(input("What score did you earn for the class?"))

#TODO: Create a simple if/else that generates each of the sample messages shown above.
if score >= 70:
    print("Congratulations! You passed the class!")
else:
    print("I'm sorry but you will need to retake the class.")
```

    What score did you earn for the class?70
    Congratulations! You passed the class!
    


```python
score=float(input("What score did you earn for the class?"))

#TODO: Create a simple if/else that generates each of the sample messages shown above.
if score >= 70:
    print("Congratulations! You passed the class!")
else:
    print("I'm sorry but you will need to retake the class.")
```

    What score did you earn for the class?69.9
    I'm sorry but you will need to retake the class.
    

### `if/elif/else` Statement

Often times we need an additional `TestExpression` to change the path of execution and to account for every scenario. One way to do this is to use the `if/elif/else` statement. The general syntax looks like this:
```python
if TestExpression1:
    body_of_if
elif TestExpression2:
    body_of_elif
else:
    body_of_else
```

Some things to make a note of here are that as with `if` and `if/else`, the bodies of each of these can have any number of statements. Also, there can be multiple `elif` statements and Python will test their conditions in the order they appear. If an `elif` test expression is `True`, then all other `elif` clauses will be skipped. Lastly, the `else` clause is optional but if it is present, there can only be one and it must come at the end of the `if/elif/else` statement.

<div class="alert alert-block alert-info">

For the next example, use the following test cases:<br>
- Test case 1: Enter <mark>2</mark> then <mark>8</mark>
- Test case 2: Enter <mark>2</mark> then any number between 5 and 10 other than <mark>8</mark><br>
- Test case 3: Enter a number between 0 and 5 other than 2. Then enter <mark>8</mark><br>
- Test case 4: Enter anything other than <mark>2</mark> and <mark>8</mark>
</div>


```python
num1 = int(input('Pick an integer greater than 0 but less than 5: '))
num2 = int(input('Pick an integer greater than 5 but less than 10: '))

num_a = 2
num_b = 8

if num1 == num_a and num2 == num_b:
    print('You win!')

elif num1 == num_a:
    print(f"You're close. You guessed {num_a} correctly.")
    print('Maybe next time.')

elif num2 == num_b:
    print(f"You're close. You guessed {num_b} correctly.")
    print('This is fun!')
    
else:
    print(f"I'm sorry. The winning numbers were {num_a} and {num_b}.")
```

    Pick an integer greater than 0 but less than 5: 3
    Pick an integer greater than 5 but less than 10: 6
    I'm sorry. The winning numbers were 2 and 8.
    

Now that we know the code above is working, we could create a simple game with this. Our game would generate two  random numbers instead of fixing the two numbers, then compare those to the user's input.


```python
import random

num1 = int(input('Pick an integer greater than 0 but less than 5: '))
num2 = int(input('Pick an integer greater than 5 but less than 10: '))

num_a = random.randrange(1,5)
num_b = random.randrange(6,10)

if num1 == num_a and num2 == num_b:
    print('You win!')

elif num1 == num_a:
    print(f"You're close. You guessed {num_a} correctly.")
    print('Maybe next time.')

elif num2 == num_b:
    print(f"You're close. You guessed {num_b} correctly.")
    print('This is fun!')
    
else:
    print(f"I'm sorry. The winning numbers were {num_a} and {num_b}.")

print('Play again!')
```

### Mathematical Formula for Problem 3

Last week you created a program to calculate a loan payment based on a purchase price. For this next problem we will calculate an amount that can be borrowed based on a monthly payment provided. The formula you will need for this calculation along with an example are provided below. For simplicity, we will assume payments will be made monthly and the interest will be compounded monthly.

Use the following formula to calculate the loan amount:
\begin{equation}
P = M\left[ \frac{\left( 1+r\right)^n-1}{r\left( 1+r\right)^n} \right]
\end{equation}

The variables are defined as follows:<br><br>
\$ r\$ = The annual interest rate converted to a decimal then divided by \$ 12\$<br>
\$ n\$ = The total number of monthly payments for the duration of the loan<br>
\$P \$ = The principal (or loan) amount<br>
\$M \$ = The monthly payment

For example, to calculate how much you can borrow for 6 years with a monthly payment of 800 dollars and an annual interest rate of 3\%, the variable amounts would be:<br><br>
\$ r =\$ 0.03/12 = 0.0025<br>
\$ n =\$ 72<br>
\$ M =\$ 800<br>

This will result in a loan amount of \$ P =\$ 52,653.

<div class="alert alert-block alert-success"><b>Problem 3 (8 pts.)</b>: You would like to buy a new house but you have certain must-haves to consider looking at a new home. You have a maximum monthly mortgage payment you are willing to make and you need a certain minimum number of bedrooms. For this next problem, complete the following steps to determine if a home is worth looking at:<br><br>
1. Prompt the user to enter the maximum monthly payment they can afford.<br>
2. Prompt the user to enter the price of a home that they're considering looking at.<br>
3. Prompt the user to enter the minimum number of bedrooms they would like in their home.<br>
4. Prompt the user to enter the number of bedrooms the house has.<br>
5. Using the monthly payment the user entered, calculate the amount they can afford to borrow based on a 30-year fixed mortgage at 6.5% interest.<br>
6. Create an <mark>if/elif/else</mark> structure that compares the parameters of the house the user would like to tour with their preferences and displays the appropriate message shown below.<br><br>
<font color=black><i><u>Be sure to complete each <b>#TODO</b> statement as indicated in the cell provided.</u></i></font>
</div>

<b>Test case 1:</b><br>
`What is the maximum monthly payment you can afford? 1800
What is the price of the home you would like to tour? 250000
What is the minimum number of bedrooms you would like? 3
What is the number of bedrooms in the house you are considering? 3
This property is affordable and has enough bedrooms.`

<b>Test case 2:</b><br>
`What is the maximum monthly payment you can afford? 1800
What is the price of the home you would like to tour? 250000
What is the minimum number of bedrooms you would like? 3
What is the number of bedrooms in the house you are considering? 2
This property is affordable but 2 bedrooms is not enough.`

<b>Test case 3:</b><br>
`What is the maximum monthly payment you can afford? 1800
What is the price of the home you would like to tour? 300000
What is the minimum number of bedrooms you would like? 3
What is the number of bedrooms in the house you are considering? 4
This property has enough bedrooms but is not affordable. You can only borrow $284779.00.`

<b>Test case 4:</b><br>
`What is the maximum monthly payment you can afford? 1800
What is the price of the home you would like to tour? 300000
What is the minimum number of bedrooms you would like? 3
What is the number of bedrooms in the house you are considering? 2
This property is not affordable and doesn't have enough bedrooms.`

<div class="alert alert-block alert-info">

### Test cases for Problem 3:
- Test case 1: 1800, 250000, 3, 3 
- Test case 2: 1800, 250000, 3, 2
- Test case 3: 1800, 300000, 3, 4 (<font color=b><b><u>show this one in your final JN</u></b></font>)
- Test case 4: 1800, 300000, 3, 2    
</div>


```python
#TODO: Create the first 4 prompts listed in the instructions for this problem
max_monthly_payment = float(input("What is the maximum monthly payment you can afford? "))
home_price = float(input("What is the price of the home you would like to tour? "))
min_bedrooms = int(input("What is the minimum number of bedrooms you would like? "))
bedrooms = int(input("What is the number of bedrooms in the house you are considering? "))

#TODO: Calculate the amount the user can borrow based on the payment entered. Assume a 30-year fixed
# mortgage at 6.5%

annual_interest_rate = 6.5 / 100
monthly_interest_rate = annual_interest_rate / 12
loan_term_months = 30 * 12

loan_amount = (max_monthly_payment / monthly_interest_rate) * (1 - (1 + monthly_interest_rate) ** (-loan_term_months))

#TODO: Notice there are four different messages that can be displayed to the user and they vary based on
# the user input. Create an if/elif/else structure that will accommodate all four test cases shown above.
if home_price <= loan_amount and bedrooms >= min_bedrooms:
    print("This property is affordable and has enough bedrooms.")
elif home_price <= loan_amount and bedrooms < min_bedrooms:
    print("This property is affordable but", bedrooms, "bedrooms is not enough.")
elif home_price > loan_amount and bedrooms >= min_bedrooms:
    print("This property has enough bedrooms but is not affordable. You can only borrow $" + "{:.2f}".format(loan_amount) + ".")
else:
    print("This property is not affordable and doesn't have enough bedrooms.")
```

    What is the maximum monthly payment you can afford? 1800
    What is the price of the home you would like to tour? 250000
    What is the minimum number of bedrooms you would like? 3
    What is the number of bedrooms in the house you are considering? 3
    This property is affordable and has enough bedrooms.
    


```python
#TODO: Create the first 4 prompts listed in the instructions for this problem
max_monthly_payment = float(input("What is the maximum monthly payment you can afford? "))
home_price = float(input("What is the price of the home you would like to tour? "))
min_bedrooms = int(input("What is the minimum number of bedrooms you would like? "))
bedrooms = int(input("What is the number of bedrooms in the house you are considering? "))

#TODO: Calculate the amount the user can borrow based on the payment entered. Assume a 30-year fixed
# mortgage at 6.5%

annual_interest_rate = 6.5 / 100
monthly_interest_rate = annual_interest_rate / 12
loan_term_months = 30 * 12

loan_amount = (max_monthly_payment / monthly_interest_rate) * (1 - (1 + monthly_interest_rate) ** (-loan_term_months))

#TODO: Notice there are four different messages that can be displayed to the user and they vary based on
# the user input. Create an if/elif/else structure that will accommodate all four test cases shown above.
if home_price <= loan_amount and bedrooms >= min_bedrooms:
    print("This property is affordable and has enough bedrooms.")
elif home_price <= loan_amount and bedrooms < min_bedrooms:
    print("This property is affordable but", bedrooms, "bedrooms is not enough.")
elif home_price > loan_amount and bedrooms >= min_bedrooms:
    print("This property has enough bedrooms but is not affordable. You can only borrow $" + "{:.2f}".format(loan_amount) + ".")
else:
    print("This property is not affordable and doesn't have enough bedrooms.")

```

    What is the maximum monthly payment you can afford? 1800
    What is the price of the home you would like to tour? 250000
    What is the minimum number of bedrooms you would like? 3
    What is the number of bedrooms in the house you are considering? 2
    This property is affordable but 2 bedrooms is not enough.
    


```python
#TODO: Create the first 4 prompts listed in the instructions for this problem
max_monthly_payment = float(input("What is the maximum monthly payment you can afford? "))
home_price = float(input("What is the price of the home you would like to tour? "))
min_bedrooms = int(input("What is the minimum number of bedrooms you would like? "))
bedrooms = int(input("What is the number of bedrooms in the house you are considering? "))

#TODO: Calculate the amount the user can borrow based on the payment entered. Assume a 30-year fixed
# mortgage at 6.5%

annual_interest_rate = 6.5 / 100
monthly_interest_rate = annual_interest_rate / 12
loan_term_months = 30 * 12

loan_amount = (max_monthly_payment / monthly_interest_rate) * (1 - (1 + monthly_interest_rate) ** (-loan_term_months))

#TODO: Notice there are four different messages that can be displayed to the user and they vary based on
# the user input. Create an if/elif/else structure that will accommodate all four test cases shown above.
if home_price <= loan_amount and bedrooms >= min_bedrooms:
    print("This property is affordable and has enough bedrooms.")
elif home_price <= loan_amount and bedrooms < min_bedrooms:
    print("This property is affordable but", bedrooms, "bedrooms is not enough.")
elif home_price > loan_amount and bedrooms >= min_bedrooms:
    print("This property has enough bedrooms but is not affordable. You can only borrow $" + "{:.2f}".format(loan_amount) + ".")
else:
    print("This property is not affordable and doesn't have enough bedrooms.")
```

    What is the maximum monthly payment you can afford? 1800
    What is the price of the home you would like to tour? 300000
    What is the minimum number of bedrooms you would like? 3
    What is the number of bedrooms in the house you are considering? 4
    This property has enough bedrooms but is not affordable. You can only borrow $284779.48.
    


```python
#TODO: Create the first 4 prompts listed in the instructions for this problem
max_monthly_payment = float(input("What is the maximum monthly payment you can afford? "))
home_price = float(input("What is the price of the home you would like to tour? "))
min_bedrooms = int(input("What is the minimum number of bedrooms you would like? "))
bedrooms = int(input("What is the number of bedrooms in the house you are considering? "))

#TODO: Calculate the amount the user can borrow based on the payment entered. Assume a 30-year fixed
# mortgage at 6.5%

annual_interest_rate = 6.5 / 100
monthly_interest_rate = annual_interest_rate / 12
loan_term_months = 30 * 12

loan_amount = (max_monthly_payment / monthly_interest_rate) * (1 - (1 + monthly_interest_rate) ** (-loan_term_months))

#TODO: Notice there are four different messages that can be displayed to the user and they vary based on
# the user input. Create an if/elif/else structure that will accommodate all four test cases shown above.
if home_price <= loan_amount and bedrooms >= min_bedrooms:
    print("This property is affordable and has enough bedrooms.")
elif home_price <= loan_amount and bedrooms < min_bedrooms:
    print("This property is affordable but", bedrooms, "bedrooms is not enough.")
elif home_price > loan_amount and bedrooms >= min_bedrooms:
    print("This property has enough bedrooms but is not affordable. You can only borrow $" + "{:.2f}".format(loan_amount) + ".")
else:
    print("This property is not affordable and doesn't have enough bedrooms.")

```

    What is the maximum monthly payment you can afford? 1800
    What is the price of the home you would like to tour? 300000
    What is the minimum number of bedrooms you would like? 3
    What is the number of bedrooms in the house you are considering? 2
    This property is not affordable and doesn't have enough bedrooms.
    

### Nested Conditionals

Conditional statements can be more complex than the examples shown so far. It is sometimes necessary to create nested conditionals to account for all possible scenarios. These are conditionals that are nested within another conditional statement. For example, a basic nested conditional may look something like this:
```python
if TestExpression1:
    if TestExpression2:
        body_of_TestExpression2
    else:
        body_of_nested_else
else:
    body_of_else
    
[code following conditional block]
```

Keep in mind there are an unlimited number of ways nested conditionals can be structured. In this particular structure, Python would check for the value of `TestExpression1` then one of the following paths would be executed:

* `TestExpression1` (**True**) ---> `TestExpression2` (**True**) ---> `body_of_TestExpression2` ---> [code following conditional block]<br><br>

* `TestExpression1` (**True**) ---> `TestExpression2` (**False**) ---> `body_of_nested_else` ---> [code following conditional block]<br><br>

* `TestExpression1` (**False**) ---> `body_of_else` ---> [code following conditional block]<br><br>

We could also have a nested conditional within the `body_of_else` instead of within the body of the outermost `if`, or we could have nested conditionals in both, or nested conditionals within nested conditionals, etc. Again, there are an unlimited number of ways these can be structured.

This next example of a nested conditional takes two numbers input by the user and compares them to see if the second number is greater than 3 times the first number, less than 3 times the first number, or equal to 3 times the first number.

<div class="alert alert-block alert-info">

For the next example, use the following test cases:
- Test case 1: Enter 4 and 15
- Test case 2: Enter 4 and 10
- Test case 3: Enter 4 and 12 
</div>


```python
number1 = int(input('Enter an integer: '))
number2 = int(input('Enter a larger integer: '))

if number2 > 3*number1:
    print(f'{number2} is at least 3 times {number1}')

else:
    if number2 < 3*number1:
        print(f'{number2} is less than 3 times {number1}')
    
    else:
        print(f'{number2} is exactly 3 times {number1}')
```

    Enter an integer: 4
    Enter a larger integer: 15
    15 is at least 3 times 4
    

### Example of `if/elif/else` with nested conditionals

For this next example, suppose you would love to get a job in Hawaii but would only accept it if the annual pay is at least 85,000. You would also be willing to take a job in New York if the annual pay is at least 100,000 or anywhere else if the annual pay is at least 75,000. The following example takes two inputs from the user, `location` and `pay` and returns a particular response based on the inputs.

Notice the outer `if` and the first `elif` test for the location to be either Hawaii or New York. If the location entered is neither of those, then the second `elif` handles all other locations and will test the amount of pay. The `else` statement will only be executed if everything before it evaluates to `False`.

<div class="alert alert-block alert-info">

For the next example, use the following test cases:
- New York, 110000
- New York, 80000
- Hawaii, 86000
- Hawaii, 50000
- Miami, 90000
- Miami, 60000   
</div>


```python
location = str(input('Enter the location of the job: '))
pay = int(input('Enter the annual pay: '))

# First is a nested conditional statement to handle pay related to 'New York.'
if location == "New York":
    if pay >= 100000:
        print("I'll take it!")
    else:
        print("No way.")
    

# Next is a nested 'elif' statement to handle pay related to "Hawaii."
elif location == "Hawaii": 
    if pay >= 85000:
        print("I'll take it!")
    else:
        print("No way.")
    

# Now another 'elif' statement to handle pay of at least 75,000 for all other locations.
elif pay >= 75000:
    print("I'll take it!")
    

# Lastly is the appropriate 'else' command for all other scenarios.
else:
    print("No thanks, I can find something better.")
```

    Enter the location of the job: new york
    Enter the annual pay: 1100000
    I'll take it!
    

### Your Turn

There are certainly numerous ways to handle the previous example and you are encouraged to try different approaches. For example, try changing the `if` statement and the first `elif` to:
```python
if location == "New York" and pay >= 100000:
...
elif location =="Hawaii" and pay >= 85000
...
```
Adjust the remaining code as needed to accomodate the new test expressions. Reach out to your TA for assistance as needed.

<div class="alert alert-block alert-success"><b>Problem 4 (10 pts.)</b>: Suppose your goal is to burn a certain number of calories. You would like to either cycle, jog, or swim to accomplish this but you need to know how many minutes of each activity would be required to burn the allotted calories based on your weight. The table below lists the number of calories burned per minute based on your weight for cycling, jogging, and swimming:</div>

<table>
    <tr style="text-align:left; background-color:yellowgreen">
        <th style="text-align:left">Activity</th>
        <th>weight < 140 lbs.</th>
        <th>140 ≤ weight < 160 lbs.</th>
        <th>160 ≤ weight < 180 lbs.</th>
        <th>weight ≥ 180 lbs.</th>
    </tr>
    <tr>
        <td style="text-align:left">Cycling (10 mph)</td>
        <td style="text-align:center">5.5</td>
        <td style="text-align:center">6.4</td>
        <td style="text-align:center">7.3</td>
        <td style="text-align:center">8.2</td>
    </tr>
    <tr>
        <td style="text-align:left">Jogging</td>
        <td style="text-align:center">9.3</td>
        <td style="text-align:center">10.8</td>
        <td style="text-align:center">12.4</td>
        <td style="text-align:center">13.9</td>
    </tr>
    <tr>
        <td style="text-align:left">Swimming (moderate pace)</td>
        <td style="text-align:center">7.8</td>
        <td style="text-align:center">9.0</td>
        <td style="text-align:center">10.3</td>
        <td style="text-align:center">11.6</td>
    </tr>
</table>

<div class="alert alert-block alert-success">For this problem, complete the following:<br><br>
1. Prompt the user to enter the activity they would like to do. Your code should handle upper and lower case inputs.<br>
2. Prompt the user to enter their weight.<br>
3. Prompt the user to enter the number of calories they would like to burn.<br>
4. Create a conditional for each of the 3 activities that will calculate the minutes needed to burn the desired calories based on each weight category.
5. Print a message like the sample shown below.<br><br>
<font color=black><i><u>Be sure to complete each <b>#TODO</b> statement as indicated in the cell provided.</u></i></font></div>

`Would you like to cycle, jog, or swim? Jog
What is your weight? 110
How many calories would you like to burn? 500
You will need to jog for 54 minutes to burn 500.0 calories`

<div class="alert alert-block alert-info">

### Test cases for Problem 4:
- Test case 1: Cycle, 140, 300 (answer is 47 minutes)
- Test case 2: Swim, 200, 400 (answer is 34 minutes)
- Test case 3: Jog, 175, 500 (answer is 40 minutes)
- Test case 4: Jog, 110, 500 (<font color=b><b><u>show this one in your final JN</u></b></font>)    
</div>


```python
#TODO: Prompt the use to enter the activity they would like to do. 
# Then prompt the user to enter their weight.
# Lastly, prompt the use to enter the number of calories they would like to burn.
activity = input("Would you like to cycle, jog, or swim?").lower()
weight=int(input("What is your weight?"))
calories=float(input("How many calories would you like to burn?"))

#TODO: Create an if/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to cycle
if activity == "cycle":
    if weight < 140:
        calories_per_minute = 5.5
    elif 140 <= weight < 160:
        calories_per_minute = 6.4
    elif 160 <= weight < 180:
        calories_per_minute = 7.3
    else:
        calories_per_minute = 8.2


#TODO: Create an elif/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to jog
elif activity == "jog":
    if weight < 140:
        calories_per_minute = 9.3
    elif 140 <= weight < 160:
        calories_per_minute = 10.8
    elif 160 <= weight < 180:
        calories_per_minute = 12.4
    else:
        calories_per_minute = 13.9

#TODO: Create an elif/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to swim
elif activity == "swim":
    if weight < 140:
        calories_per_minute = 7.8
    elif 140 <= weight < 160:
        calories_per_minute = 9.0
    elif 160 <= weight < 180:
        calories_per_minute = 10.3
    else:
        calories_per_minute = 11.6

#TODO: Create a formatted print statement that prints the sample message shown above
else:
    print("Invalid activity choice. Please choose either cycling, jogging, or swimming.")
    exit()
    
minutes_needed = calories / calories_per_minute

# Print the result
print(f"You will need to {activity} for {round(minutes_needed)} minutes to burn {calories:.1f} calories.")
```

    Would you like to cycle, jog, or swim?cycle
    What is your weight?140
    How many calories would you like to burn?300
    You will need to cycle for 47 minutes to burn 300.0 calories.
    


```python
#TODO: Prompt the use to enter the activity they would like to do. 
# Then prompt the user to enter their weight.
# Lastly, prompt the use to enter the number of calories they would like to burn.
activity = input("Would you like to cycle, jog, or swim?").lower()
weight=int(input("What is your weight?"))
calories=float(input("How many calories would you like to burn?"))

#TODO: Create an if/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to cycle
if activity == "cycle":
    if weight < 140:
        calories_per_minute = 5.5
    elif 140 <= weight < 160:
        calories_per_minute = 6.4
    elif 160 <= weight < 180:
        calories_per_minute = 7.3
    else:
        calories_per_minute = 8.2


#TODO: Create an elif/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to jog
elif activity == "jog":
    if weight < 140:
        calories_per_minute = 9.3
    elif 140 <= weight < 160:
        calories_per_minute = 10.8
    elif 160 <= weight < 180:
        calories_per_minute = 12.4
    else:
        calories_per_minute = 13.9

#TODO: Create an elif/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to swim
elif activity == "swim":
    if weight < 140:
        calories_per_minute = 7.8
    elif 140 <= weight < 160:
        calories_per_minute = 9.0
    elif 160 <= weight < 180:
        calories_per_minute = 10.3
    else:
        calories_per_minute = 11.6

#TODO: Create a formatted print statement that prints the sample message shown above
else:
    print("Invalid activity choice. Please choose either cycling, jogging, or swimming.")
    exit()
    
minutes_needed = calories / calories_per_minute

# Print the result
print(f"You will need to {activity} for {round(minutes_needed)} minutes to burn {calories:.1f} calories.")
```

    Would you like to cycle, jog, or swim?swim
    What is your weight?200
    How many calories would you like to burn?400
    You will need to swim for 34 minutes to burn 400.0 calories.
    


```python
#TODO: Prompt the use to enter the activity they would like to do. 
# Then prompt the user to enter their weight.
# Lastly, prompt the use to enter the number of calories they would like to burn.
activity = input("Would you like to cycle, jog, or swim?").lower()
weight=int(input("What is your weight?"))
calories=float(input("How many calories would you like to burn?"))

#TODO: Create an if/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to cycle
if activity == "cycle":
    if weight < 140:
        calories_per_minute = 5.5
    elif 140 <= weight < 160:
        calories_per_minute = 6.4
    elif 160 <= weight < 180:
        calories_per_minute = 7.3
    else:
        calories_per_minute = 8.2


#TODO: Create an elif/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to jog
elif activity == "jog":
    if weight < 140:
        calories_per_minute = 9.3
    elif 140 <= weight < 160:
        calories_per_minute = 10.8
    elif 160 <= weight < 180:
        calories_per_minute = 12.4
    else:
        calories_per_minute = 13.9

#TODO: Create an elif/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to swim
elif activity == "swim":
    if weight < 140:
        calories_per_minute = 7.8
    elif 140 <= weight < 160:
        calories_per_minute = 9.0
    elif 160 <= weight < 180:
        calories_per_minute = 10.3
    else:
        calories_per_minute = 11.6

#TODO: Create a formatted print statement that prints the sample message shown above
else:
    print("Invalid activity choice. Please choose either cycling, jogging, or swimming.")
    exit()
    
minutes_needed = calories / calories_per_minute

# Print the result
print(f"You will need to {activity} for {round(minutes_needed)} minutes to burn {calories:.1f} calories.")
```

    Would you like to cycle, jog, or swim?jog
    What is your weight?175
    How many calories would you like to burn?500
    You will need to jog for 40 minutes to burn 500.0 calories.
    


```python
#TODO: Prompt the use to enter the activity they would like to do. 
# Then prompt the user to enter their weight.
# Lastly, prompt the use to enter the number of calories they would like to burn.
activity = input("Would you like to cycle, jog, or swim?").lower()
weight=int(input("What is your weight?"))
calories=float(input("How many calories would you like to burn?"))

#TODO: Create an if/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to cycle
if activity == "cycle":
    if weight < 140:
        calories_per_minute = 5.5
    elif 140 <= weight < 160:
        calories_per_minute = 6.4
    elif 160 <= weight < 180:
        calories_per_minute = 7.3
    else:
        calories_per_minute = 8.2


#TODO: Create an elif/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to jog
elif activity == "jog":
    if weight < 140:
        calories_per_minute = 9.3
    elif 140 <= weight < 160:
        calories_per_minute = 10.8
    elif 160 <= weight < 180:
        calories_per_minute = 12.4
    else:
        calories_per_minute = 13.9

#TODO: Create an elif/(if/elif/else) conditional that calculates the number of minutes needed for a user 
# who would like to swim
elif activity == "swim":
    if weight < 140:
        calories_per_minute = 7.8
    elif 140 <= weight < 160:
        calories_per_minute = 9.0
    elif 160 <= weight < 180:
        calories_per_minute = 10.3
    else:
        calories_per_minute = 11.6

#TODO: Create a formatted print statement that prints the sample message shown above
else:
    print("Invalid activity choice. Please choose either cycling, jogging, or swimming.")
    exit()
    
minutes_needed = calories / calories_per_minute

# Print the result
print(f"You will need to {activity} for {round(minutes_needed)} minutes to burn {calories:.1f} calories.")
```

    Would you like to cycle, jog, or swim?Jog
    What is your weight?110
    How many calories would you like to burn?500
    You will need to jog for 54 minutes to burn 500.0 calories.
    


```python

```
