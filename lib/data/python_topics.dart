import 'package:learnpythonapp/models/topic_model.dart';

final List<Topic> pythonTopics = [
  Topic(
    id: 't1',
    title: 'Introduction to Python',
    description: 'Fundamentals and overview of Python programming language',
    contents: [
      SubContent(
        id: 't1e1',
        title: 'What is Python?',
        type: 'explanation',
        paragraphs: [
          "Python is a high-level, interpreted, general-purpose programming language. Its design philosophy emphasizes code readability with its notable use of significant indentation. Created by Guido van Rossum and first released in 1991, Python is now one of the most popular and widely adopted programming languages in the world.",
          "Python is dynamically typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly procedural), object-oriented, and functional programming. It is often described as a 'batteries included' language due to its comprehensive standard library.",
          "The Python Software Foundation manages and directs resources for Python and CPython development. The language is open-source and developed under a community-based model.",
        ],
      ),
      SubContent(
        id: 't1e2',
        title: 'History of Python',
        type: 'explanation',
        paragraphs: [
          "Python was conceived in the late 1980s by Guido van Rossum at Centrum Wiskunde & Informatica (CWI) in the Netherlands as a successor to the ABC language. Its implementation began in December 1989.",
          "Python 2.0 was released in 2000 with new features like list comprehensions and a garbage collection system. Python 3.0, a major, backwards-incompatible release, was released in 2008 after a long testing period.",
          "Python 2 was officially discontinued in 2020 (with final version 2.7.18), and all current development focuses on Python 3. The language continues to evolve with regular releases adding new features and improvements.",
        ],
      ),
      SubContent(
        id: 't1e3',
        title: 'Key Features of Python',
        type: 'explanation',
        paragraphs: [
          "• Easy to Learn and Use: Python has a simple syntax similar to the English language, making it excellent for beginners.",
          "• Expressive Language: It can perform complex tasks with very few lines of code.",
          "• Interpreted Language: Code is executed line by line, which makes debugging easy.",
          "• Cross-platform Language: Python can run on various operating systems like Windows, Linux, UNIX, and Macintosh.",
          "• Free and Open Source: The language is freely available to everyone under an OSI-approved open-source license.",
          "• Vast Standard Library: It provides a rich set of modules and functions for rapid application development.",
          "• Supports GUI Programming: Libraries like Tkinter, PyQt5, and Kivy allow building desktop applications.",
          "• Integrated: Python can be easily integrated with languages like C, C++, Java, etc.",
        ],
      ),
      SubContent(
        id: 't1e4',
        title: 'Python 2 vs Python 3',
        type: 'explanation',
        paragraphs: [
          "Python 3.0 was released in 2008 to rectify fundamental design flaws in the language. The two versions are not fully compatible.",
          "Key Differences:",
          "• Print Statement: Python 2 uses `print \"Hello\"`, Python 3 uses `print(\"Hello\")` as a function.",
          "• Integer Division: In Python 2, `5 / 2 = 2`, but in Python 3, `5 / 2 = 2.5`. Use `//` for floor division in both.",
          "• Unicode: Python 2 uses ASCII by default for strings, Python 3 uses Unicode.",
          "• xrange(): Removed in Python 3; `range()` now behaves like Python 2's `xrange()`.",
          "• Error Handling: Python 3 requires `as` keyword: `except Exception as e` instead of `except Exception, e`.",
          "Python 2 reached its end of life (EOL) on January 1, 2020, and is no longer maintained. All modern development should use Python 3.",
        ],
      ),
      SubContent(
        id: 't1e5',
        title: 'Python Use Cases',
        type: 'explanation',
        paragraphs: [
          "• Web Development: Frameworks like Django, Flask, and Pyramid.",
          "• Data Science and Analytics: Libraries like NumPy, Pandas, and SciPy.",
          "• Machine Learning and AI: TensorFlow, PyTorch, and Scikit-learn.",
          "• Desktop GUI Applications: Tkinter, PyQt, and wxPython.",
          "• Game Development: Pygame library for creating games.",
          "• Web Scraping: BeautifulSoup and Scrapy for extracting data from websites.",
          "• Scientific and Numeric Computing: Libraries for complex mathematical operations.",
          "• Software Development: Used as a support language for build control, testing, and management.",
          "• Education: Python is a popular language for teaching programming, both at introductory and advanced levels.",
        ],
      ),
      SubContent(
        id: 't1e6',
        title: 'Installing Python',
        type: 'explanation',
        paragraphs: [
          "Python can be installed on various operating systems:",
          "Windows:",
          "1. Download the latest Python installer from python.org",
          "2. Run the installer executable",
          "3. Check 'Add Python to PATH' option",
          "4. Click 'Install Now'",
          "macOS:",
          "1. Install Homebrew package manager (/bin/bash -c \"(Dollar Sign)(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\")",
          "2. Run: brew install python",
          "Linux (Debian/Ubuntu):",
          "1. sudo apt update",
          "2. sudo apt install python3",
          "Verify installation by running `python --version` or `python3 --version` in your terminal/command prompt.",
        ],
      ),
      SubContent(
        id: 't1e7',
        title: 'Python IDEs and Editors',
        type: 'explanation',
        paragraphs: [
          "• IDLE: Python's built-in IDE, good for beginners.",
          "• PyCharm: Professional IDE by JetBrains with free Community edition.",
          "• Visual Studio Code: Lightweight but powerful editor with excellent Python support through extensions.",
          "• Jupyter Notebook: Web-based interactive computing environment, popular for data science.",
          "• Spyder: Scientific Python Development Environment, designed for data scientists.",
          "• Sublime Text: Popular text editor with Python support packages.",
          "• Atom: Hackable text editor with Python language support.",
          "• Vim/Emacs: Powerful text editors with Python modes for advanced users.",
        ],
      ),
      SubContent(
        id: 't1p1',
        title: 'Hello World Program',
        type: 'program',
        paragraphs: [
          '''# The simplest Python program
print("Hello, World!")''',
          '''# Hello World with user input
name = input("Enter your name: ")
print(f"Hello, {name}! Welcome to Python.")''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'Who created Python?',
        'options': [
          'Guido van Rossum',
          'Brendan Eich',
          'James Gosling',
          'Linus Torvalds',
        ],
        'correct': 0,
      },
      {
        'question': 'When was Python first released?',
        'options': ['1989', '1991', '1995', '2000'],
        'correct': 1,
      },
      {
        'question': 'Which version is the current standard and actively maintained?',
        'options': ['Python 1', 'Python 2', 'Python 3', 'Python 4'],
        'correct': 2,
      },
      {
        'question': 'Which of these is NOT a key feature of Python?',
        'options': [
          'Interpreted language',
          'Statically typed',
          'Easy to learn',
          'Cross-platform'
        ],
        'correct': 1,
      },
    ],
  ),
  Topic(
    id: 't2',
    title: 'Python Basics',
    description: 'Syntax, variables, data types, and basic operators',
    contents: [
      SubContent(
        id: 't2e1',
        title: 'Keywords and Identifiers',
        type: 'explanation',
        paragraphs: [
          "Keywords are reserved words in Python that have special meaning and cannot be used as variable names, function names, or other identifiers.",
          "Python has 35 keywords: False, None, True, and, as, assert, async, await, break, class, continue, def, del, elif, else, except, finally, for, from, global, if, import, in, is, lambda, nonlocal, not, or, pass, raise, return, try, while, with, yield.",
          "Identifiers are names given to variables, functions, classes, etc. Rules for identifiers:",
          "• Can contain letters (a-z, A-Z), digits (0-9), and underscore (_)",
          "• Cannot start with a digit",
          "• Cannot be a keyword",
          "• Are case-sensitive (age, Age, and AGE are different)",
          "• Should be descriptive and follow naming conventions",
        ],
      ),
      SubContent(
        id: 't2e2',
        title: 'Variables and Constants',
        type: 'explanation',
        paragraphs: [
          "A variable is a named location used to store data in memory. Unlike statically-typed languages like C++ or Java, you do not need to declare a variable's type in Python. The type is inferred from the value assigned to it.",
          "Variables are created when you assign a value to them:",
          "x = 5          # integer variable",
          "name = \"John\"   # string variable",
          "is_valid = True # boolean variable",
          "Python doesn't have constants in the strict sense, but by convention, variables with all capital letters are treated as constants:",
          "PI = 3.14159",
          "MAX_CONNECTIONS = 100",
        ],
      ),
      SubContent(
        id: 't2e3',
        title: 'Data Types',
        type: 'explanation',
        paragraphs: [
          "Python has several built-in data types:",
          "• Numeric Types: int (integer), float (floating point), complex (complex numbers)",
          "• Sequence Types: str (string), list, tuple, range",
          "• Mapping Type: dict (dictionary)",
          "• Set Types: set, frozenset",
          "• Boolean Type: bool (True or False)",
          "• Binary Types: bytes, bytearray, memoryview",
          "• None Type: None (represents absence of value)",
          "You can check the type of any value using the type() function:",
          "type(5)        # <class 'int'>",
          "type(3.14)     # <class 'float'>",
          "type(\"hello\")   # <class 'str'>",
          "type(True)     # <class 'bool'>",
        ],
      ),
      SubContent(
        id: 't2e4',
        title: 'Type Conversion',
        type: 'explanation',
        paragraphs: [
          "You can convert between types using built-in functions:",
          "• int(): converts to integer",
          "• float(): converts to float",
          "• str(): converts to string",
          "• bool(): converts to boolean",
          "• list(): converts to list",
          "• tuple(): converts to tuple",
          "Examples:",
          "int(\"10\")      # 10 (string to integer)",
          "float(5)       # 5.0 (integer to float)",
          "str(3.14)      # \"3.14\" (float to string)",
          "bool(0)        # False (integer to boolean)",
          "bool(\"hello\")  # True (string to boolean)",
          "list((1, 2, 3)) # [1, 2, 3] (tuple to list)",
        ],
      ),
      SubContent(
        id: 't2e5',
        title: 'Comments',
        type: 'explanation',
        paragraphs: [
          "Comments are used to explain code and are ignored by the interpreter.",
          "Single-line comments start with a #:",
          "# This is a single-line comment",
          "x = 5  # This is also a comment",
          "Multi-line comments use triple quotes (though technically these are multi-line strings, they are used as comments):",
          "\"\"\"",
          "This is a",
          "multi-line comment",
          "or docstring",
          "\"\"\"",
          "Docstrings are special comments used to document functions, classes, and modules:",
          "def my_function():",
          "    \"\"\"This is a docstring explaining what this function does.\"\"\"",
          "    # function code here",
        ],
      ),
      SubContent(
        id: 't2e6',
        title: 'Input and Output',
        type: 'explanation',
        paragraphs: [
          "The print() function is used for output:",
          "print(\"Hello, World!\")  # Output: Hello, World!",
          "print(\"Hello\", \"World\", sep=\"-\")  # Output: Hello-World",
          "print(\"Hello\", end=\" \")",
          "print(\"World\")  # Output: Hello World",
          "The input() function is used to get user input:",
          "name = input(\"Enter your name: \")",
          "print(f\"Hello, {name}!\")",
          "Note: input() always returns a string. You need to convert it if you want other types:",
          "age = int(input(\"Enter your age: \"))",
          "height = float(input(\"Enter your height: \"))",
        ],
      ),
      SubContent(
        id: 't2e7',
        title: 'Basic Operators',
        type: 'explanation',
        paragraphs: [
          "Arithmetic Operators: + (addition), - (subtraction), * (multiplication), / (division), % (modulus), ** (exponentiation), // (floor division)",
          "Comparison Operators: == (equal), != (not equal), > (greater than), < (less than), >= (greater than or equal), <= (less than or equal)",
          "Assignment Operators: = (assign), += (add and assign), -= (subtract and assign), *= (multiply and assign), /= (divide and assign), %= (modulus and assign), //= (floor divide and assign), **= (exponentiate and assign)",
          "Logical Operators: and (both conditions true), or (at least one condition true), not (reverse the result)",
          "Identity Operators: is (both variables are the same object), is not (variables are not the same object)",
          "Membership Operators: in (value exists in sequence), not in (value does not exist in sequence)",
          "Bitwise Operators: & (AND), | (OR), ^ (XOR), ~ (NOT), << (left shift), >> (right shift)",
        ],
      ),
      SubContent(
        id: 't2e8',
        title: 'Operator Precedence',
        type: 'explanation',
        paragraphs: [
          "Operator precedence determines the order of operations in an expression. From highest to lowest:",
          "1. Parentheses: ()",
          "2. Exponentiation: **",
          "3. Unary plus, minus, bitwise NOT: +x, -x, ~x",
          "4. Multiplication, division, floor division, modulus: *, /, //, %",
          "5. Addition, subtraction: +, -",
          "6. Bitwise shifts: <<, >>",
          "7. Bitwise AND: &",
          "8. Bitwise XOR: ^",
          "9. Bitwise OR: |",
          "10. Comparison operators: ==, !=, >, >=, <, <=",
          "11. Identity operators: is, is not",
          "12. Membership operators: in, not in",
          "13. Logical NOT: not",
          "14. Logical AND: and",
          "15. Logical OR: or",
          "Use parentheses to make expressions clearer and to override precedence rules.",
        ],
      ),
      SubContent(
        id: 't2e9',
        title: 'Expressions',
        type: 'explanation',
        paragraphs: [
          "An expression is a combination of values, variables, operators, and function calls that evaluates to a value:",
          "5 + 3          # expression that evaluates to 8",
          "x * 2          # expression with a variable",
          "len(\"hello\")   # expression with a function call",
          "Expressions can be part of statements:",
          "y = x + 5      # assignment statement with expression",
          "if x > 0:      # conditional statement with expression",
          "print(\"Positive\")",
          "Python evaluates expressions using operator precedence and associativity rules.",
        ],
      ),
      SubContent(
        id: 't2p1',
        title: 'Variables and Type Conversion Example',
        type: 'program',
        paragraphs: [
          '''# Variable assignment
x = 10          # int
y = 5.5         # float
name = "Alice"  # str
is_valid = True # bool

# Checking type
print(type(x))       # Output: <class 'int'>
print(type(y))       # Output: <class 'float'>

# Type conversion
num_str = "123"
num_int = int(num_str)  # Converts string to integer
print(num_int * 2)      # Output: 246

# Input always returns a string
user_age = input("Enter your age: ") # e.g., enters "25"
print(type(user_age))   # Output: <class 'str'>
age_int = int(user_age) # Convert to int for calculations''',
        ],
      ),
      SubContent(
        id: 't2p2',
        title: 'Operators Example',
        type: 'program',
        paragraphs: [
          '''# Arithmetic operators
a = 10
b = 3
print(a + b)   # 13
print(a - b)   # 7
print(a * b)   # 30
print(a / b)   # 3.333...
print(a // b)  # 3 (floor division)
print(a % b)   # 1 (modulus)
print(a ** b)  # 1000 (exponentiation)

# Comparison operators
print(a == b)  # False
print(a != b)  # True
print(a > b)   # True
print(a < b)   # False

# Logical operators
x = True
y = False
print(x and y)  # False
print(x or y)   # True
print(not x)    # False

# Assignment operators
c = 5
c += 3  # equivalent to c = c + 3
print(c)  # 8

# Identity operators
list1 = [1, 2, 3]
list2 = [1, 2, 3]
list3 = list1
print(list1 is list2)    # False (different objects)
print(list1 is list3)    # True (same object)
print(list1 == list2)    # True (same content)

# Membership operators
fruits = ["apple", "banana", "cherry"]
print("apple" in fruits)     # True
print("mango" not in fruits) # True''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'Which keyword is used to define a variable in Python?',
        'options': ['var', 'let', 'def', 'None (just assign a value)'],
        'correct': 3,
      },
      {
        'question': 'What is the data type of the value `3.14`?',
        'options': ['int', 'str', 'float', 'double'],
        'correct': 2,
      },
      {
        'question': 'How do you convert a string `s` to an integer?',
        'options': ['int(s)', 'integer(s)', 'strToInt(s)', 's.toInt()'],
        'correct': 0,
      },
      {
        'question': 'Which operator has the highest precedence?',
        'options': ['*', '**', '()', '+'],
        'correct': 2,
      },
    ],
  ),
  Topic(
    id: 't3',
    title: 'Control Flow',
    description: 'Conditional statements and loops',
    contents: [
      SubContent(
        id: 't3e1',
        title: 'if, elif, else Statements',
        type: 'explanation',
        paragraphs: [
          "Conditional statements allow you to execute different blocks of code based on conditions.",
          "The if statement checks a condition and executes the code block if the condition is True:",
          "if condition:",
          "    # code to execute if condition is True",
          "The elif (short for else if) checks another condition if the previous conditions were False:",
          "if condition1:",
          "    # code if condition1 is True",
          "elif condition2:",
          "    # code if condition2 is True",
          "The else statement executes code if all previous conditions were False:",
          "if condition1:",
          "    # code if condition1 is True",
          "else:",
          "    # code if all conditions are False",
          "You can have multiple elif statements but only one else statement at the end.",
        ],
      ),
      SubContent(
        id: 't3e2',
        title: 'Nested Conditions',
        type: 'explanation',
        paragraphs: [
          "You can nest if statements inside other if statements:",
          "if condition1:",
          "    # code if condition1 is True",
          "    if condition2:",
          "        # code if both condition1 and condition2 are True",
          "    else:",
          "        # code if condition1 is True but condition2 is False",
          "else:",
          "    # code if condition1 is False",
          "While nesting can be useful, deep nesting can make code hard to read. Consider using logical operators (and, or) or refactoring into functions for complex conditions.",
        ],
      ),
      SubContent(
        id: 't3e3',
        title: 'for Loops',
        type: 'explanation',
        paragraphs: [
          "for loops iterate over a sequence (such as a list, tuple, dictionary, set, or string) or other iterable objects:",
          "for item in sequence:",
          "    # code to execute for each item",
          "You can use the range() function to generate a sequence of numbers:",
          "for i in range(5):     # 0, 1, 2, 3, 4",
          "    print(i)",
          "for i in range(2, 6):  # 2, 3, 4, 5",
          "    print(i)",
          "for i in range(0, 10, 2):  # 0, 2, 4, 6, 8 (step by 2)",
          "    print(i)",
          "You can iterate through strings:",
          "for char in \"Hello\":",
          "    print(char)",
          "And through lists:",
          "fruits = [\"apple\", \"banana\", \"cherry\"]",
          "for fruit in fruits:",
          "    print(fruit)",
        ],
      ),
      SubContent(
        id: 't3e4',
        title: 'while Loops',
        type: 'explanation',
        paragraphs: [
          "while loops execute a block of code as long as a condition is True:",
          "while condition:",
          "    # code to execute while condition is True",
          "Example:",
          "count = 0",
          "while count < 5:",
          "    print(count)",
          "    count += 1  # Important: update the condition variable",
          "Be careful with while loops to avoid infinite loops. Make sure the condition will eventually become False.",
          "You can use a while True loop with a break statement for more control:",
          "while True:",
          "    # code that runs forever",
          "    if exit_condition:",
          "        break  # exit the loop",
        ],
      ),
      SubContent(
        id: 't3e5',
        title: 'Loop Control Statements',
        type: 'explanation',
        paragraphs: [
          "break: Exits the current loop entirely:",
          "for i in range(10):",
          "    if i == 5:",
          "        break  # exit loop when i is 5",
          "    print(i)",
          "continue: Skips the rest of the current iteration and moves to the next one:",
          "for i in range(10):",
          "    if i % 2 == 0:",
          "        continue  # skip even numbers",
          "    print(i)",
          "pass: Does nothing, used as a placeholder for empty code blocks:",
          "for i in range(5):",
          "    pass  # do nothing, but syntax requires something here",
          "The pass statement is useful when you need to define a function, class, or loop but haven't implemented the code yet.",
        ],
      ),
      SubContent(
        id: 't3e6',
        title: 'else with Loops',
        type: 'explanation',
        paragraphs: [
          "Python allows an else clause after loops. The else block executes only if the loop completes normally (not exited by a break statement):",
          "for i in range(5):",
          "    print(i)",
          "else:",
          "    print(\"Loop completed successfully\")",
          "This will print numbers 0-4 and then \"Loop completed successfully\".",
          "If the loop is exited with break, the else clause is skipped:",
          "for i in range(5):",
          "    if i == 3:",
          "        break",
          "    print(i)",
          "else:",
          "    print(\"Loop completed successfully\")",
          "This will print numbers 0-2 but not the else message.",
          "The same applies to while loops.",
        ],
      ),
      SubContent(
        id: 't3p1',
        title: 'Conditional Statements Example',
        type: 'program',
        paragraphs: [
          '''# Simple if statement
age = 18
if age >= 18:
    print("You are an adult")

# if-elif-else statement
score = 85
if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
elif score >= 60:
    grade = "D"
else:
    grade = "F"
print(f"Your grade is {grade}")

# Nested conditions
num = 15
if num > 0:
    print("Positive number")
    if num % 2 == 0:
        print("Even number")
    else:
        print("Odd number")
else:
    print("Non-positive number")''',
        ],
      ),
      SubContent(
        id: 't3p2',
        title: 'Loop Examples',
        type: 'program',
        paragraphs: [
          '''# for loop with range
print("Counting from 0 to 4:")
for i in range(5):
    print(i)

# for loop with list
fruits = ["apple", "banana", "cherry"]
print("Fruits:")
for fruit in fruits:
    print(fruit)

# while loop
print("Counting from 0 to 4 with while:")
count = 0
while count < 5:
    print(count)
    count += 1

# break and continue
print("Numbers 0-4, skipping 2:")
for i in range(5):
    if i == 2:
        continue  # skip 2
    print(i)

print("Numbers until 3:")
for i in range(10):
    if i == 4:
        break  # stop at 4
    print(i)

# else with loops
print("Loop with else:")
for i in range(3):
    print(i)
else:
    print("Loop completed without break")

print("Loop with break and else:")
for i in range(3):
    if i == 1:
        break
    print(i)
else:
    print("This won't be printed")''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'Which keyword is used to define an "else if" condition in Python?',
        'options': ['elseif', 'else if', 'elif', 'elsif'],
        'correct': 2,
      },
      {
        'question': 'What does the break statement do in a loop?',
        'options': [
          'Skips the current iteration',
          'Exits the entire loop',
          'Restarts the loop',
          'Does nothing'
        ],
        'correct': 1,
      },
      {
        'question': 'When does the else clause of a loop execute?',
        'options': [
          'Always after the loop',
          'Only if the loop completes without a break',
          'Only if the loop is exited with a break',
          'Only for for loops, not while loops'
        ],
        'correct': 2,
      },
      {
        'question': 'What is the output of: for i in range(2): print(i)',
        'options': ['0 1', '1 2', '0 1 2', '1'],
        'correct': 0,
      },
    ],
  ),
  Topic(
    id: 't4',
    title: 'Functions',
    description: 'Defining and using functions in Python',
    contents: [
      SubContent(
        id: 't4e1',
        title: 'Defining Functions',
        type: 'explanation',
        paragraphs: [
          "Functions are defined using the def keyword:",
          "def function_name(parameters):",
          "    \"\"\"docstring\"\"\"  # optional documentation string",
          "    # function body",
          "    return value  # optional return statement",
          "Example:",
          "def greet(name):",
          "    \"\"\"This function greets the person passed in as parameter\"\"\"",
          "    return f\"Hello, {name}!\"",
          "To call a function:",
          "message = greet(\"Alice\")",
          "print(message)  # Output: Hello, Alice!",
          "Functions can have zero or more parameters and may or may not return a value. If no return statement is used, the function returns None.",
        ],
      ),
      SubContent(
        id: 't4e2',
        title: 'Function Arguments',
        type: 'explanation',
        paragraphs: [
          "Python supports different types of function arguments:",
          "1. Positional arguments: Must be in the correct order:",
          "   def describe_pet(animal_type, pet_name):",
          "       print(f\"I have a {animal_type} named {pet_name}.\")",
          "   describe_pet(\"hamster\", \"Harry\")",
          "2. Keyword arguments: Specify parameter names:",
          "   describe_pet(animal_type=\"hamster\", pet_name=\"Harry\")",
          "   describe_pet(pet_name=\"Harry\", animal_type=\"hamster\")  # order doesn't matter",
          "3. Default parameter values:",
          "   def describe_pet(pet_name, animal_type=\"dog\"):",
          "       print(f\"I have a {animal_type} named {pet_name}.\")",
          "   describe_pet(\"Willie\")  # uses default animal_type",
          "4. Arbitrary arguments (*args): Collects extra positional arguments as a tuple:",
          "   def make_pizza(*toppings):",
          "       print(\"Making pizza with:\")",
          "       for topping in toppings:",
          "           print(f\"- {topping}\")",
          "   make_pizza(\"pepperoni\")",
          "   make_pizza(\"mushrooms\", \"green peppers\", \"extra cheese\")",
          "5. Arbitrary keyword arguments (**kwargs): Collects extra keyword arguments as a dictionary:",
          "   def build_profile(first, last, **user_info):",
          "       user_info['first_name'] = first",
          "       user_info['last_name'] = last",
          "       return user_info",
          "   user_profile = build_profile(\"albert\", \"einstein\", location=\"princeton\", field=\"physics\")",
        ],
      ),
      SubContent(
        id: 't4e3',
        title: 'Return Statement',
        type: 'explanation',
        paragraphs: [
          "The return statement is used to exit a function and optionally return a value:",
          "def add(a, b):",
          "    return a + b",
          "result = add(3, 5)  # result is 8",
          "A function can return multiple values as a tuple:",
          "def get_name():",
          "    first = \"John\"",
          "    last = \"Doe\"",
          "    return first, last  # returns a tuple (\"John\", \"Doe\")",
          "name = get_name()  # name is (\"John\", \"Doe\")",
          "first, last = get_name()  # unpacking the tuple",
          "If no return statement is used, or if return is used without a value, the function returns None.",
          "A function can have multiple return statements:",
          "def is_even(num):",
          "    if num % 2 == 0:",
          "        return True",
          "    else:",
          "        return False",
        ],
      ),
      SubContent(
        id: 't4e4',
        title: 'Lambda (Anonymous) Functions',
        type: 'explanation',
        paragraphs: [
          "Lambda functions are small anonymous functions defined with the lambda keyword:",
          "lambda arguments: expression",
          "Example:",
          "double = lambda x: x * 2",
          "print(double(5))  # Output: 10",
          "This is equivalent to:",
          "def double(x):",
          "    return x * 2",
          "Lambda functions can have multiple arguments:",
          "multiply = lambda x, y: x * y",
          "print(multiply(3, 4))  # Output: 12",
          "Lambda functions are often used as arguments to higher-order functions:",
          "numbers = [1, 2, 3, 4, 5]",
          "squared = list(map(lambda x: x**2, numbers))  # [1, 4, 9, 16, 25]",
          "even = list(filter(lambda x: x % 2 == 0, numbers))  # [2, 4]",
        ],
      ),
      SubContent(
        id: 't4e5',
        title: 'Variable Scope',
        type: 'explanation',
        paragraphs: [
          "Python has four variable scopes:",
          "1. Local scope: Variables defined inside a function. They are accessible only within that function.",
          "2. Enclosing scope: Variables in the local scope of enclosing functions (for nested functions).",
          "3. Global scope: Variables defined at the top level of a module or declared global with the global keyword.",
          "4. Built-in scope: Names preassigned in Python (like print, len, etc.).",
          "Example of local vs global:",
          "x = \"global\"  # global variable",
          "def my_func():",
          "    x = \"local\"  # local variable (shadows the global x)",
          "    print(x)      # prints \"local\"",
          "my_func()",
          "print(x)          # prints \"global\"",
          "To modify a global variable inside a function, use the global keyword:",
          "x = \"global\"",
          "def my_func():",
          "    global x",
          "    x = \"modified\"  # changes the global variable",
          "my_func()",
          "print(x)  # prints \"modified\"",
          "For nested functions, use the nonlocal keyword to modify variables in the enclosing (but non-global) scope:",
          "def outer():",
          "    x = \"outer\"",
          "    def inner():",
          "        nonlocal x",
          "        x = \"inner\"  # modifies the outer function's variable",
          "    inner()",
          "    print(x)  # prints \"inner\"",
        ],
      ),
      SubContent(
        id: 't4e6',
        title: 'Recursion',
        type: 'explanation',
        paragraphs: [
          "Recursion is when a function calls itself. It's useful for problems that can be broken down into smaller, similar subproblems.",
          "Example: Factorial function",
          "def factorial(n):",
          "    if n == 1:  # base case",
          "        return 1",
          "    else:       # recursive case",
          "        return n * factorial(n-1)",
          "print(factorial(5))  # 120",
          "Example: Fibonacci sequence",
          "def fibonacci(n):",
          "    if n <= 1:  # base case",
          "        return n",
          "    else:       # recursive case",
          "        return fibonacci(n-1) + fibonacci(n-2)",
          "for i in range(10):",
          "    print(fibonacci(i))  # 0, 1, 1, 2, 3, 5, 8, 13, 21, 34",
          "Recursion requires a base case (to stop the recursion) and a recursive case (to call the function again).",
          "Python has a recursion limit (usually 1000) to prevent infinite recursion. You can check it with sys.getrecursionlimit().",
        ],
      ),
      SubContent(
        id: 't4e7',
        title: 'Higher-order Functions',
        type: 'explanation',
        paragraphs: [
          "Higher-order functions are functions that take other functions as arguments or return functions as results.",
          "Common higher-order functions in Python:",
          "1. map(function, iterable): Applies function to every item of iterable and returns a map object:",
          "   numbers = [1, 2, 3, 4, 5]",
          "   squared = list(map(lambda x: x**2, numbers))  # [1, 4, 9, 16, 25]",
          "2. filter(function, iterable): Returns items from iterable for which function returns True:",
          "   even = list(filter(lambda x: x % 2 == 0, numbers))  # [2, 4]",
          "3. reduce(function, iterable): Applies function cumulatively to items of iterable (from functools module):",
          "   from functools import reduce",
          "   product = reduce(lambda x, y: x * y, numbers)  # 120 (1*2*3*4*5)",
          "You can also create your own higher-order functions:",
          "def apply_twice(func, arg):",
          "    return func(func(arg))",
          "def add_five(x):",
          "    return x + 5",
          "print(apply_twice(add_five, 10))  # 20 (10+5=15, 15+5=20)",
        ],
      ),
      SubContent(
        id: 't4e8',
        title: 'Function Documentation (docstring)',
        type: 'explanation',
        paragraphs: [
          "A docstring is a string literal that occurs as the first statement in a function, module, class, or method definition. It's used to document the purpose and usage of the code.",
          "def add(a, b):",
          "    \"\"\"Return the sum of two numbers.",
          "    ",
          "    Args:",
          "        a (int or float): The first number",
          "        b (int or float): The second number",
          "    ",
          "    Returns:",
          "        int or float: The sum of a and b",
          "    \"\"\"",
          "    return a + b",
          "You can access the docstring using the __doc__ attribute or the help() function:",
          "print(add.__doc__)",
          "help(add)",
          "PEP 257 provides conventions for writing docstrings. Common formats include:",
          "1. One-line docstrings: \"\"\"Return the sum of a and b.\"\"\"",
          "2. Multi-line docstrings with sections for Args, Returns, Raises, etc.",
          "Docstrings are different from regular comments because they are retained at runtime and can be accessed programmatically.",
        ],
      ),
      SubContent(
        id: 't4p1',
        title: 'Function Examples',
        type: 'program',
        paragraphs: [
          '''# Basic function
def greet(name):
    """Return a greeting message."""
    return f"Hello, {name}!"

print(greet("Alice"))  # Hello, Alice!

# Function with default parameter
def describe_pet(pet_name, animal_type="dog"):
    """Display information about a pet."""
    print(f"I have a {animal_type} named {pet_name}.")

describe_pet("Willie")  # I have a dog named Willie.
describe_pet("Harry", "hamster")  # I have a hamster named Harry.

# Function with arbitrary arguments
def make_pizza(*toppings):
    """Summarize the pizza we are about to make."""
    print("Making a pizza with the following toppings:")
    for topping in toppings:
        print(f"- {topping}")

make_pizza("pepperoni")
make_pizza("mushrooms", "green peppers", "extra cheese")

# Function returning multiple values
def get_name():
    first = "John"
    last = "Doe"
    return first, last  # Returns a tuple

first_name, last_name = get_name()
print(first_name, last_name)  # John Doe

# Lambda function
double = lambda x: x * 2
print(double(5))  # 10

# Using map with lambda
numbers = [1, 2, 3, 4, 5]
squared = list(map(lambda x: x**2, numbers))
print(squared)  # [1, 4, 9, 16, 25]''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'Which keyword is used to define a function?',
        'options': ['function', 'def', 'define', 'func'],
        'correct': 1,
      },
      {
        'question': 'What does *args in a function definition do?',
        'options': [
          'Forces all arguments to be keyword arguments',
          'Collects extra positional arguments into a tuple',
          'Collects extra keyword arguments into a dictionary',
          'Makes the function accept any number of arguments'
        ],
        'correct': 1,
      },
      {
        'question': 'What is the output of: (lambda x: x**2)(4)',
        'options': ['8', '16', '44', 'Error'],
        'correct': 1,
      },
      {
        'question': 'Which keyword is used to modify a global variable inside a function?',
        'options': ['global', 'nonlocal', 'var', 'extern'],
        'correct': 0,
      },
    ],
  ),
  Topic(
    id: 't5',
    title: 'Data Structures',
    description: 'Lists, tuples, sets, dictionaries, and strings in Python',
    contents: [
      SubContent(
        id: 't5e1',
        title: 'Lists',
        type: 'explanation',
        paragraphs: [
          "Lists are ordered, mutable collections of items. They can contain elements of different types and are defined using square brackets [].",
          "Creating lists:",
          "empty_list = []",
          "numbers = [1, 2, 3, 4, 5]",
          "mixed = [1, 'hello', 3.14, True]",
          "nested = [[1, 2], [3, 4]]",
          "Indexing and slicing:",
          "Lists use zero-based indexing. Negative indices count from the end.",
          "fruits = ['apple', 'banana', 'cherry', 'date']",
          "fruits[0]    # 'apple' (first element)",
          "fruits[-1]   # 'date' (last element)",
          "fruits[1:3]  # ['banana', 'cherry'] (slice from index 1 to 2)",
          "fruits[:2]   # ['apple', 'banana'] (slice from start to index 1)",
          "fruits[2:]   # ['cherry', 'date'] (slice from index 2 to end)",
        ],
      ),
      SubContent(
        id: 't5e2',
        title: 'List Methods',
        type: 'explanation',
        paragraphs: [
          "Common list methods:",
          "• append(x): Add item x to the end of the list",
          "• extend(iterable): Add all items from iterable to the end",
          "• insert(i, x): Insert item x at position i",
          "• remove(x): Remove first occurrence of item x",
          "• pop([i]): Remove and return item at position i (default last)",
          "• clear(): Remove all items from the list",
          "• index(x): Return index of first occurrence of x",
          "• count(x): Return number of times x appears in list",
          "• sort(): Sort the list in place",
          "• reverse(): Reverse the list in place",
          "• copy(): Return a shallow copy of the list",
          "List comprehension:",
          "A concise way to create lists:",
          "[expression for item in iterable if condition]",
          "squares = [x**2 for x in range(10)]",
          "even_squares = [x**2 for x in range(10) if x % 2 == 0]",
        ],
      ),
      SubContent(
        id: 't5e3',
        title: 'Tuples',
        type: 'explanation',
        paragraphs: [
          "Tuples are ordered, immutable collections of items. They are defined using parentheses ().",
          "Creating tuples:",
          "empty_tuple = ()",
          "single_item = (1,)  # Note the comma for single-item tuples",
          "numbers = (1, 2, 3, 4, 5)",
          "mixed = (1, 'hello', 3.14, True)",
          "Tuples support the same indexing and slicing as lists:",
          "t = (1, 2, 3, 4, 5)",
          "t[0]     # 1",
          "t[-1]    # 5",
          "t[1:4]   # (2, 3, 4)",
          "Tuple methods:",
          "Since tuples are immutable, they have fewer methods than lists:",
          "• count(x): Return number of times x appears in tuple",
          "• index(x): Return index of first occurrence of x",
          "Tuple unpacking:",
          "a, b, c = (1, 2, 3)  # a=1, b=2, c=3",
          "Tuples are often used for returning multiple values from functions and for data that shouldn't change.",
        ],
      ),
      SubContent(
        id: 't5e4',
        title: 'Sets',
        type: 'explanation',
        paragraphs: [
          "Sets are unordered collections of unique elements. They are defined using curly braces {} or the set() function.",
          "Creating sets:",
          "empty_set = set()  # {} creates an empty dictionary, not set",
          "numbers = {1, 2, 3, 4, 5}",
          "from_list = set([1, 2, 3, 2, 1])  # {1, 2, 3} (duplicates removed)",
          "Set operations:",
          "a = {1, 2, 3, 4, 5}",
          "b = {4, 5, 6, 7, 8}",
          "a | b  # union: {1, 2, 3, 4, 5, 6, 7, 8}",
          "a & b  # intersection: {4, 5}",
          "a - b  # difference: {1, 2, 3}",
          "a ^ b  # symmetric difference: {1, 2, 3, 6, 7, 8}",
          "Set methods:",
          "• add(x): Add element x to the set",
          "• remove(x): Remove element x from the set (raises error if not found)",
          "• discard(x): Remove element x from the set (no error if not found)",
          "• pop(): Remove and return an arbitrary element",
          "• clear(): Remove all elements from the set",
          "• update(iterable): Add all elements from iterable to the set",
          "Frozenset:",
          "An immutable version of set:",
          "f = frozenset([1, 2, 3, 4, 5])",
        ],
      ),
      SubContent(
        id: 't5e5',
        title: 'Dictionaries',
        type: 'explanation',
        paragraphs: [
          "Dictionaries are unordered collections of key-value pairs. Keys must be unique and immutable (strings, numbers, tuples).",
          "Creating dictionaries:",
          "empty_dict = {}",
          "person = {'name': 'John', 'age': 30, 'city': 'New York'}",
          "using_dict = dict(name='John', age=30, city='New York')",
          "Accessing elements:",
          "person['name']     # 'John'",
          "person.get('age')  # 30",
          "person.get('country', 'USA')  # 'USA' (default if key doesn't exist)",
          "Dictionary methods:",
          "• keys(): Return a view of all keys",
          "• values(): Return a view of all values",
          "• items(): Return a view of all key-value pairs as tuples",
          "• get(key, default): Return value for key or default if key doesn't exist",
          "• pop(key): Remove key and return its value",
          "• popitem(): Remove and return last inserted key-value pair",
          "• update(other_dict): Update dictionary with key-value pairs from other_dict",
          "• clear(): Remove all items from the dictionary",
          "Dictionary comprehension:",
          "{key_expr: value_expr for item in iterable if condition}",
          "squares = {x: x**2 for x in range(5)}  # {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}",
        ],
      ),
      SubContent(
        id: 't5e6',
        title: 'Strings',
        type: 'explanation',
        paragraphs: [
          "Strings are immutable sequences of Unicode characters. They can be defined using single, double, or triple quotes.",
          "Creating strings:",
          "s1 = 'hello'",
          "s2 = \"world\"",
          "s3 = '''This is a",
          "multi-line string'''",
          "String operations:",
          "• Concatenation: 'hello' + ' ' + 'world' → 'hello world'",
          "• Repetition: 'hi' * 3 → 'hihihi'",
          "• Indexing: s[0] → first character",
          "• Slicing: s[1:4] → characters from index 1 to 3",
          "String methods:",
          "• upper(), lower(): Convert to uppercase/lowercase",
          "• strip(), lstrip(), rstrip(): Remove whitespace",
          "• split(): Split string into list of substrings",
          "• join(): Join list of strings into a single string",
          "• replace(): Replace occurrences of substring",
          "• find(), index(): Find position of substring",
          "• startswith(), endswith(): Check if string starts/ends with substring",
          "• isalpha(), isdigit(), isalnum(): Check if all characters are alphabetic/digits/alphanumeric",
          "String formatting:",
          "• f-strings (Python 3.6+): f'Hello {name}'",
          "• format(): 'Hello {}'.format(name)",
          "• % formatting: 'Hello %s' % name",
        ],
      ),
      SubContent(
        id: 't5p1',
        title: 'Data Structures Examples',
        type: 'program',
        paragraphs: [
          '''# List examples
fruits = ['apple', 'banana', 'cherry']
fruits.append('orange')          # ['apple', 'banana', 'cherry', 'orange']
fruits.insert(1, 'blueberry')    # ['apple', 'blueberry', 'banana', 'cherry', 'orange']
fruits.remove('banana')          # ['apple', 'blueberry', 'cherry', 'orange']
last = fruits.pop()              # last = 'orange', fruits = ['apple', 'blueberry', 'cherry']
fruits.sort()                    # ['apple', 'blueberry', 'cherry']
fruits.reverse()                 # ['cherry', 'blueberry', 'apple']

# List comprehension
squares = [x**2 for x in range(5)]          # [0, 1, 4, 9, 16]
even_squares = [x**2 for x in range(10) if x % 2 == 0]  # [0, 4, 16, 36, 64]

# Tuple examples
coordinates = (10, 20)
x, y = coordinates  # x=10, y=20

# Set examples
a = {1, 2, 3, 4, 5}
b = {4, 5, 6, 7, 8}
print(a | b)  # {1, 2, 3, 4, 5, 6, 7, 8}
print(a & b)  # {4, 5}
print(a - b)  # {1, 2, 3}

# Dictionary examples
person = {'name': 'John', 'age': 30, 'city': 'New York'}
print(person['name'])        # John
print(person.get('age'))     # 30
print(person.get('country', 'USA'))  # USA

# Adding and updating
person['job'] = 'Engineer'   # Add new key-value pair
person['age'] = 31           # Update existing value

# Iterating through dictionary
for key, value in person.items():
    print(f"{key}: {value}")

# String examples
s = " Hello, World! "
print(s.strip())               # "Hello, World!"
print(s.lower())               # " hello, world! "
print(s.replace('Hello', 'Hi')) # " Hi, World! "
print(s.split(','))            # [" Hello", " World! "]
print("|".join(['a', 'b', 'c']))  # "a|b|c"

# String formatting
name = "Alice"
age = 25
print(f"My name is {name} and I'm {age} years old.")  # My name is Alice and I'm 25 years old.
print("My name is {} and I'm {} years old.".format(name, age))  # Same result''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'Which data structure is ordered and mutable?',
        'options': ['Tuple', 'Set', 'List', 'Frozenset'],
        'correct': 2,
      },
      {
        'question': 'How do you create an empty set?',
        'options': ['{}', 'set()', '[]', '()'],
        'correct': 1,
      },
      {
        'question': 'Which method returns a default value if a key is not found in a dictionary?',
        'options': ['get()', 'setdefault()', 'pop()', 'items()'],
        'correct': 0,
      },
      {
        'question': 'What is the output of "hello"[:2]?',
        'options': ['he', 'hel', 'llo', 'hello'],
        'correct': 0,
      },
    ],
  ),
  Topic(
    id: 't6',
    title: 'Modules and Packages',
    description: 'Organizing code with modules and packages',
    contents: [
      SubContent(
        id: 't6e1',
        title: 'Importing Modules',
        type: 'explanation',
        paragraphs: [
          "A module is a file containing Python definitions and statements. The file name is the module name with the .py suffix.",
          "Ways to import modules:",
          "1. import module_name: Import entire module",
          "   import math",
          "   print(math.sqrt(16))  # 4.0",
          "2. from module_name import name1, name2: Import specific names",
          "   from math import sqrt, pi",
          "   print(sqrt(16))  # 4.0",
          "   print(pi)        # 3.141592653589793",
          "3. from module_name import *: Import all names (not recommended)",
          "   from math import *",
          "   print(sqrt(16))  # 4.0",
          "4. import module_name as alias: Import with alias",
          "   import numpy as np",
          "   import pandas as pd",
          "5. from module_name import name as alias: Import specific name with alias",
          "   from math import sqrt as square_root",
          "The import statement looks for modules in:",
          "1. The current directory",
          "2. Directories listed in PYTHONPATH environment variable",
          "3. The installation-dependent default directory",
        ],
      ),
      SubContent(
        id: 't6e2',
        title: 'Python Standard Library',
        type: 'explanation',
        paragraphs: [
          "Python comes with a comprehensive standard library that includes modules for:",
          "• File and directory access: os, os.path, shutil, glob",
          "• System functions: sys, platform, subprocess",
          "• Data types: datetime, calendar, collections, array, copy",
          "• Mathematics: math, cmath, decimal, fractions, random, statistics",
          "• Data persistence: pickle, shelve, sqlite3",
          "• Data compression: zlib, gzip, bz2, zipfile, tarfile",
          "• File formats: csv, configparser, json, xml",
          "• Cryptography: hashlib, hmac",
          "• Networking: socket, ssl, urllib",
          "• Internet: email, json, xml, http",
          "• Multimedia: audioop, wave, colorsys",
          "• Internationalization: gettext, locale",
          "• Development: pdb, profile, timeit, doctest, unittest",
          "Some commonly used modules:",
          "• math: Mathematical functions",
          "• random: Generate random numbers",
          "• datetime: Date and time operations",
          "• os: Operating system interface",
          "• sys: System-specific parameters and functions",
          "• json: JSON encoder and decoder",
          "• re: Regular expressions",
        ],
      ),
      SubContent(
        id: 't6e3',
        title: 'Creating Custom Modules',
        type: 'explanation',
        paragraphs: [
          "Any Python file can be imported as a module. To create a module:",
          "1. Create a file with .py extension",
          "2. Define functions, classes, and variables in the file",
          "3. Import the module in other Python files",
          "Example: Create a file named mymodule.py:",
          "def greet(name):",
          "    return f\"Hello, {name}!\"",
          "pi = 3.14159",
          "In another file:",
          "import mymodule",
          "print(mymodule.greet(\"Alice\"))  # Hello, Alice!",
          "print(mymodule.pi)              # 3.14159",
          "Module initialization:",
          "When a module is imported, the code in the module is executed. This can include function and class definitions, variable assignments, and any other executable code.",
          "The __name__ variable:",
          "When a module is imported, __name__ is set to the module name. When a file is run directly, __name__ is set to \"__main__\". This is useful for writing code that should only run when the file is executed directly:",
          "if __name__ == \"__main__\":",
          "    # This code will only run if the file is executed directly",
          "    print(\"This module is being run directly\")",
        ],
      ),
      SubContent(
        id: 't6e4',
        title: 'Using Packages',
        type: 'explanation',
        paragraphs: [
          "A package is a way of organizing related modules into a directory hierarchy. Packages are directories containing a special __init__.py file.",
          "Package structure:",
          "mypackage/",
          "    __init__.py",
          "    module1.py",
          "    module2.py",
          "    subpackage/",
          "        __init__.py",
          "        module3.py",
          "The __init__.py file can be empty or can contain initialization code for the package. It indicates that the directory should be treated as a package.",
          "Importing from packages:",
          "1. import package.module",
          "   import mypackage.module1",
          "2. from package import module",
          "   from mypackage import module1",
          "3. from package.module import name",
          "   from mypackage.module1 import function1",
          "4. from package.subpackage import module",
          "   from mypackage.subpackage import module3",
          "5. from package.subpackage.module import name",
          "   from mypackage.subpackage.module3 import function3",
          "Relative imports (within a package):",
          "from . import module      # Import from same package",
          "from .. import module     # Import from parent package",
          "from .subpackage import module  # Import from subpackage",
        ],
      ),
      SubContent(
        id: 't6e5',
        title: '__name__ == "__main__"',
        type: 'explanation',
        paragraphs: [
          "The __name__ variable is a special built-in variable that evaluates to the name of the current module.",
          "When a module is imported, __name__ is set to the module's name.",
          "When a module is run directly (as a script), __name__ is set to \"__main__\".",
          "This is useful for including code that should only run when the module is executed directly, not when it's imported:",
          "def main():",
          "    print(\"This is the main function\")",
          "    # Your main code here",
          "if __name__ == \"__main__\":",
          "    main()",
          "This pattern allows a file to be used both as:",
          "1. A script that can be executed directly",
          "2. A module that can be imported by other modules",
          "When the file is run directly, the main() function is called. When the file is imported, the main() function is defined but not called.",
          "This is a common pattern in Python programs and is considered good practice.",
        ],
      ),
      SubContent(
        id: 't6e6',
        title: 'Module Reloading',
        type: 'explanation',
        paragraphs: [
          "By default, a module is only loaded once per interpreter session. If you modify a module and want to reload it without restarting the interpreter, you can use the importlib.reload() function.",
          "import importlib",
          "import mymodule",
          "# Modify mymodule.py",
          "importlib.reload(mymodule)",
          "This is useful during development when you're making changes to a module and want to test them without restarting your program.",
          "Note: reload() only affects the specific module you're reloading, not any modules that imported it. Also, it doesn't update objects that were created from classes in the module before the reload.",
          "Limitations of reload():",
          "• It doesn't update function objects that were already imported",
          "• It doesn't update class definitions for existing instances",
          "• It can be tricky with complex module interdependencies",
          "For these reasons, it's often better to restart the interpreter during development, especially for complex projects.",
        ],
      ),
      SubContent(
        id: 't6p1',
        title: 'Modules and Packages Examples',
        type: 'program',
        paragraphs: [
          '''# Example of a module (save as mymodule.py)
"""
This is a demo module
"""
def add(a, b):
    """Return the sum of a and b"""
    return a + b

def subtract(a, b):
    """Return the difference of a and b"""
    return a - b

# Code that runs only when the module is executed directly
if __name__ == "__main__":
    print("Running mymodule directly")
    print(add(5, 3))      # 8
    print(subtract(5, 3)) # 2

# Using the module in another file
import mymodule
print(mymodule.add(10, 5))      # 15
print(mymodule.subtract(10, 5)) # 5

# Import specific functions
from mymodule import add, subtract
print(add(10, 5))      # 15
print(subtract(10, 5)) # 5

# Import with alias
import mymodule as mm
print(mm.add(10, 5)) # 15

# Using standard library modules
import math
print(math.sqrt(25))  # 5.0
print(math.pi)        # 3.141592653589793

import random
print(random.randint(1, 10))  # Random integer between 1 and 10

import datetime
now = datetime.datetime.now()
print(now)  # Current date and time

# Package example
# Create directory structure:
# mypackage/
#     __init__.py
#     module1.py
#     module2.py

# In module1.py:
def hello():
    return "Hello from module1"

# In module2.py:
def world():
    return "World from module2"

# Using the package
from mypackage import module1, module2
print(module1.hello())  # Hello from module1
print(module2.world())  # World from module2''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'What is the value of __name__ when a module is run directly?',
        'options': ['"module"', '"main"', '"__main__"', 'The module name'],
        'correct': 2,
      },
      {
        'question': 'Which file must a directory contain to be considered a Python package?',
        'options': ['main.py', '__init__.py', 'package.py', '__main__.py'],
        'correct': 1,
      },
      {
        'question': 'How do you reload a module named mymodule?',
        'options': [
          'reload(mymodule)',
          'importlib.reload(mymodule)',
          'mymodule.reload()',
          'from importlib import reload; reload(mymodule)'
        ],
        'correct': 1,
      },
      {
        'question': 'Which import statement is NOT recommended?',
        'options': [
          'import math',
          'from math import sqrt',
          'from math import *',
          'import math as m'
        ],
        'correct': 2,
      },
    ],
  ),
  Topic(
    id: 't7',
    title: 'File Handling',
    description: 'Reading from and writing to files in Python',
    contents: [
      SubContent(
        id: 't7e1',
        title: 'Opening and Closing Files',
        type: 'explanation',
        paragraphs: [
          "Files are opened using the open() function, which returns a file object:",
          "file = open(filename, mode)",
          "Common file modes:",
          "• 'r': Read (default mode). Opens file for reading.",
          "• 'w': Write. Opens file for writing. Creates the file if it doesn't exist. Truncates the file if it exists.",
          "• 'a': Append. Opens file for appending. Creates the file if it doesn't exist.",
          "• 'x': Exclusive creation. Creates the file but fails if it already exists.",
          "• 'b': Binary mode. Use with other modes: 'rb', 'wb', 'ab', etc.",
          "• 't': Text mode (default). Use with other modes: 'rt', 'wt', 'at', etc.",
          "• '+': Read and write. Use with other modes: 'r+', 'w+', 'a+', etc.",
          "Files should be closed after operations are complete using the close() method:",
          "file.close()",
          "Not closing files can lead to resource leaks and data loss.",
        ],
      ),
      SubContent(
        id: 't7e2',
        title: 'Reading Files',
        type: 'explanation',
        paragraphs: [
          "Methods for reading files:",
          "1. read(size): Read up to size bytes/characters. If size is omitted or negative, read until EOF.",
          "2. readline(): Read one line from the file.",
          "3. readlines(): Read all lines into a list.",
          "4. Iterate over the file object: Read line by line (memory efficient).",
          "Examples:",
          "# Read entire file",
          "with open('file.txt', 'r') as file:",
          "    content = file.read()",
          "# Read line by line",
          "with open('file.txt', 'r') as file:",
          "    for line in file:",
          "        print(line.strip())",
          "# Read all lines into a list",
          "with open('file.txt', 'r') as file:",
          "    lines = file.readlines()",
          "The with statement:",
          "It's recommended to use the with statement when working with files. It automatically closes the file, even if an exception occurs:",
          "with open('file.txt', 'r') as file:",
          "    content = file.read()",
          "# File is automatically closed here",
        ],
      ),
      SubContent(
        id: 't7e3',
        title: 'Writing Files',
        type: 'explanation',
        paragraphs: [
          "Methods for writing files:",
          "1. write(string): Write string to the file.",
          "2. writelines(sequence): Write a sequence of strings to the file.",
          "Examples:",
          "# Write to a file",
          "with open('file.txt', 'w') as file:",
          "    file.write('Hello, World!\\n')",
          "    file.write('This is a second line\\n')",
          "# Write multiple lines",
          "lines = ['First line\\n', 'Second line\\n', 'Third line\\n']",
          "with open('file.txt', 'w') as file:",
          "    file.writelines(lines)",
          "Appending to a file:",
          "with open('file.txt', 'a') as file:",
          "    file.write('This line is appended\\n')",
          "Note: When opening a file in 'w' mode, the file is truncated (cleared) if it already exists. Use 'a' mode to append to an existing file.",
        ],
      ),
      SubContent(
        id: 't7e4',
        title: 'File Modes',
        type: 'explanation',
        paragraphs: [
          "Detailed explanation of file modes:",
          "• 'r': Open for reading (text mode). The file must exist.",
          "• 'r+': Open for reading and writing. The file must exist.",
          "• 'w': Open for writing (text mode). Creates the file if it doesn't exist. Truncates the file if it exists.",
          "• 'w+': Open for reading and writing. Creates the file if it doesn't exist. Truncates the file if it exists.",
          "• 'a': Open for appending (text mode). Creates the file if it doesn't exist. The file pointer is at the end of the file.",
          "• 'a+': Open for reading and appending. Creates the file if it doesn't exist. The file pointer is at the end of the file for writing, but can be moved for reading.",
          "• 'rb', 'wb', 'ab', etc.: Binary modes. Use for non-text files (images, executables, etc.).",
          "• 'x': Exclusive creation. Fails if the file already exists.",
          "When working with text files, the default mode is 'rt' (read text). When working with binary files, use 'b' mode:",
          "with open('image.jpg', 'rb') as file:",
          "    data = file.read()",
        ],
      ),
      SubContent(
        id: 't7e5',
        title: 'Working with Paths',
        type: 'explanation',
        paragraphs: [
          "Python provides several modules for working with file paths:",
          "1. os.path module: Functions for manipulating paths:",
          "   import os",
          "   os.path.join('dir', 'subdir', 'file.txt')  # 'dir/subdir/file.txt'",
          "   os.path.exists('file.txt')                 # True if file exists",
          "   os.path.isfile('file.txt')                 # True if it's a file",
          "   os.path.isdir('dir')                       # True if it's a directory",
          "   os.path.abspath('file.txt')                # Absolute path",
          "   os.path.basename('/path/to/file.txt')      # 'file.txt'",
          "   os.path.dirname('/path/to/file.txt')       # '/path/to'",
          "   os.path.split('/path/to/file.txt')         # ('/path/to', 'file.txt')",
          "   os.path.splitext('file.txt')               # ('file', '.txt')",
          "2. pathlib module (Python 3.4+): Object-oriented approach:",
          "   from pathlib import Path",
          "   path = Path('file.txt')",
          "   path.exists()                              # True if file exists",
          "   path.is_file()                             # True if it's a file",
          "   path.is_dir()                              # True if it's a directory",
          "   path.name                                  # 'file.txt'",
          "   path.stem                                  # 'file'",
          "   path.suffix                                # '.txt'",
          "   path.parent                                # Path object for parent directory",
          "   path.absolute()                            # Absolute path",
          "   path.with_name('newfile.txt')              # Change filename",
          "   path.with_suffix('.pdf')                   # Change extension",
        ],
      ),
      SubContent(
        id: 't7e6',
        title: 'With Statement',
        type: 'explanation',
        paragraphs: [
          "The with statement is used for resource management. It ensures that resources are properly cleaned up after use, even if exceptions occur.",
          "Syntax:",
          "with expression as variable:",
          "    # code block",
          "For files:",
          "with open('file.txt', 'r') as file:",
          "    content = file.read()",
          "# File is automatically closed here",
          "This is equivalent to:",
          "file = open('file.txt', 'r')",
          "try:",
          "    content = file.read()",
          "finally:",
          "    file.close()",
          "The with statement can be used with any object that supports the context management protocol (has __enter__() and __exit__() methods).",
          "Multiple context managers:",
          "with open('file1.txt', 'r') as file1, open('file2.txt', 'w') as file2:",
          "    content = file1.read()",
          "    file2.write(content)",
          "This is useful for working with multiple files simultaneously.",
        ],
      ),
      SubContent(
        id: 't7p1',
        title: 'File Handling Examples',
        type: 'program',
        paragraphs: [
          '''# Reading a file
with open('example.txt', 'r') as file:
    content = file.read()
    print(content)

# Reading line by line
with open('example.txt', 'r') as file:
    for line in file:
        print(line.strip())  # strip() removes newline characters

# Reading all lines into a list
with open('example.txt', 'r') as file:
    lines = file.readlines()
    print(lines)  # List of lines

# Writing to a file
with open('output.txt', 'w') as file:
    file.write('Hello, World!\\n')
    file.write('This is a second line\\n')

# Appending to a file
with open('output.txt', 'a') as file:
    file.write('This line is appended\\n')

# Working with paths
import os
file_path = os.path.join('dir', 'subdir', 'file.txt')
print(file_path)  # dir/subdir/file.txt

if os.path.exists('file.txt'):
    print('File exists')
else:
    print('File does not exist')

# Using pathlib
from pathlib import Path
path = Path('file.txt')
if path.exists():
    print(f'File {path.name} exists')
    print(f'Parent directory: {path.parent}')
    print(f'File extension: {path.suffix}')

# Copying a file
with open('source.txt', 'r') as source:
    with open('destination.txt', 'w') as dest:
        content = source.read()
        dest.write(content)

# Processing CSV data (simple example)
with open('data.csv', 'r') as file:
    for line in file:
        fields = line.strip().split(',')
        print(fields)''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'Which mode opens a file for writing and truncates it if it exists?',
        'options': ['r', 'w', 'a', 'x'],
        'correct': 1,
      },
      {
        'question': 'What does the with statement do?',
        'options': [
          'Opens a file in write mode',
          'Ensures a file is closed properly',
          'Reads the entire file at once',
          'Appends to a file'
        ],
        'correct': 1,
      },
      {
        'question': 'Which method reads one line from a file?',
        'options': ['read()', 'readline()', 'readlines()', 'getline()'],
        'correct': 1,
      },
      {
        'question': 'Which module provides an object-oriented approach to path manipulation?',
        'options': ['os', 'os.path', 'pathlib', 'sys.path'],
        'correct': 2,
      },
    ],
  ),
  Topic(
    id: 't8',
    title: 'Exception Handling',
    description: 'Handling errors and exceptions in Python',
    contents: [
      SubContent(
        id: 't8e1',
        title: 'Errors vs Exceptions',
        type: 'explanation',
        paragraphs: [
          "In Python, errors can be categorized into two types:",
          "1. Syntax errors: Occur when the parser encounters incorrect syntax. These cannot be handled and must be fixed:",
          "   if True",
          "       print('Hello')  # Missing colon → SyntaxError",
          "2. Exceptions: Occur during execution, even if the syntax is correct. These can be handled:",
          "   print(10 / 0)  # Division by zero → ZeroDivisionError",
          "Common built-in exceptions:",
          "• ZeroDivisionError: Division or modulo by zero",
          "• IndexError: Sequence subscript out of range",
          "• KeyError: Dictionary key not found",
          "• NameError: Name not found in local or global scope",
          "• TypeError: Operation or function applied to inappropriate type",
          "• ValueError: Function gets argument of correct type but inappropriate value",
          "• FileNotFoundError: File or directory doesn't exist",
          "• ImportError: Module or name cannot be imported",
          "• KeyboardInterrupt: User pressed interrupt key (Ctrl+C)",
          "Exceptions are objects that inherit from the BaseException class. Most exceptions inherit from Exception.",
        ],
      ),
      SubContent(
        id: 't8e2',
        title: 'try, except',
        type: 'explanation',
        paragraphs: [
          "The try-except block is used to handle exceptions:",
          "try:",
          "    # Code that might raise an exception",
          "    result = 10 / 0",
          "except ZeroDivisionError:",
          "    # Code to handle the exception",
          "    print(\"Cannot divide by zero\")",
          "You can handle multiple exceptions:",
          "try:",
          "    # Code that might raise exceptions",
          "except (TypeError, ValueError) as e:",
          "    print(f\"Type or value error: {e}\")",
          "except ZeroDivisionError:",
          "    print(\"Division by zero\")",
          "You can catch all exceptions (not recommended as it can hide bugs):",
          "try:",
          "    # Code that might raise exceptions",
          "except Exception as e:",
          "    print(f\"An error occurred: {e}\")",
          "The as keyword is used to get a reference to the exception object, which can provide more information about the error.",
        ],
      ),
      SubContent(
        id: 't8e3',
        title: 'else and finally',
        type: 'explanation',
        paragraphs: [
          "The else clause runs if no exception was raised in the try block:",
          "try:",
          "    result = 10 / 2",
          "except ZeroDivisionError:",
          "    print(\"Division by zero\")",
          "else:",
          "    print(f\"Result is {result}\")  # This runs if no exception",
          "The finally clause always runs, whether an exception occurred or not:",
          "try:",
          "    result = 10 / 0",
          "except ZeroDivisionError:",
          "    print(\"Division by zero\")",
          "finally:",
          "    print(\"This always executes\")  # This always runs",
          "The finally clause is useful for cleanup operations, such as closing files or releasing resources, that should happen regardless of whether an exception occurred.",
          "Complete structure:",
          "try:",
          "    # Code that might raise exceptions",
          "except ExceptionType:",
          "    # Handle specific exception",
          "except AnotherExceptionType:",
          "    # Handle another exception",
          "else:",
          "    # Run if no exceptions",
          "finally:",
          "    # Always run",
        ],
      ),
      SubContent(
        id: 't8e4',
        title: 'Raising Exceptions',
        type: 'explanation',
        paragraphs: [
          "You can raise exceptions using the raise statement:",
          "raise ValueError(\"Invalid value\")",
          "You can also re-raise the current exception:",
          "try:",
          "    # Code that might raise exceptions",
          "except SomeException:",
          "    # Handle the exception",
          "    raise  # Re-raise the same exception",
          "Creating custom exceptions:",
          "class MyCustomError(Exception):",
          "    \"\"\"A custom exception class.\"\"\"",
          "    def __init__(self, message):",
          "        self.message = message",
          "        super().__init__(message)",
          "raise MyCustomError(\"Something went wrong\")",
          "When to raise exceptions:",
          "• When a function receives invalid arguments",
          "• When a required resource is not available",
          "• When an operation is not allowed in the current state",
          "• When a condition that should never happen occurs",
          "It's better to raise exceptions rather than return error codes, as exceptions cannot be ignored.",
        ],
      ),
      SubContent(
        id: 't8e5',
        title: 'Built-in Exceptions',
        type: 'explanation',
        paragraphs: [
          "Python has a rich hierarchy of built-in exceptions:",
          "BaseException",
          " +-- SystemExit",
          " +-- KeyboardInterrupt",
          " +-- GeneratorExit",
          " +-- Exception",
          "      +-- StopIteration",
          "      +-- StopAsyncIteration",
          "      +-- ArithmeticError",
          "      |    +-- FloatingPointError",
          "      |    +-- OverflowError",
          "      |    +-- ZeroDivisionError",
          "      +-- AssertionError",
          "      +-- AttributeError",
          "      +-- BufferError",
          "      +-- EOFError",
          "      +-- ImportError",
          "      |    +-- ModuleNotFoundError",
          "      +-- LookupError",
          "      |    +-- IndexError",
          "      |    +-- KeyError",
          "      +-- MemoryError",
          "      +-- NameError",
          "      |    +-- UnboundLocalError",
          "      +-- OSError",
          "      |    +-- BlockingIOError",
          "      |    +-- ChildProcessError",
          "      |    +-- ConnectionError",
          "      |    |    +-- BrokenPipeError",
          "      |    |    +-- ConnectionAbortedError",
          "      |    |    +-- ConnectionRefusedError",
          "      |    |    +-- ConnectionResetError",
          "      |    +-- FileExistsError",
          "      |    +-- FileNotFoundError",
          "      |    +-- InterruptedError",
          "      |    +-- IsADirectoryError",
          "      |    +-- NotADirectoryError",
          "      |    +-- PermissionError",
          "      |    +-- ProcessLookupError",
          "      |    +-- TimeoutError",
          "      +-- ReferenceError",
          "      +-- RuntimeError",
          "      |    +-- NotImplementedError",
          "      |    +-- RecursionError",
          "      +-- SyntaxError",
          "      |    +-- IndentationError",
          "      |         +-- TabError",
          "      +-- SystemError",
          "      +-- TypeError",
          "      +-- ValueError",
          "      |    +-- UnicodeError",
          "      |         +-- UnicodeDecodeError",
          "      |         +-- UnicodeEncodeError",
          "      |         +-- UnicodeTranslateError",
          "      +-- Warning",
          "           +-- DeprecationWarning",
          "           +-- PendingDeprecationWarning",
          "           +-- RuntimeWarning",
          "           +-- SyntaxWarning",
          "           +-- UserWarning",
          "           +-- FutureWarning",
          "           +-- ImportWarning",
          "           +-- UnicodeWarning",
          "           +-- BytesWarning",
          "           +-- ResourceWarning",
        ],
      ),
      SubContent(
        id: 't8e6',
        title: 'Custom Exceptions',
        type: 'explanation',
        paragraphs: [
          "You can create custom exception classes by inheriting from Exception or its subclasses:",
          "class MyError(Exception):",
          "    \"\"\"Base class for my custom exceptions.\"\"\"",
          "    pass",
          "class ValidationError(MyError):",
          "    \"\"\"Exception raised for errors in input validation.\"\"\"",
          "    def __init__(self, message, value):",
          "        self.message = message",
          "        self.value = value",
          "        super().__init__(f\"{message}: {value}\")",
          "class NetworkError(MyError):",
          "    \"\"\"Exception raised for network errors.\"\"\"",
          "    def __init__(self, message, code):",
          "        self.message = message",
          "        self.code = code",
          "        super().__init__(f\"{message} (code: {code})\")",
          "Using custom exceptions:",
          "def validate_age(age):",
          "    if age < 0:",
          "        raise ValidationError(\"Age cannot be negative\", age)",
          "    if age > 150:",
          "        raise ValidationError(\"Age is unrealistic\", age)",
          "try:",
          "    validate_age(-5)",
          "except ValidationError as e:",
          "    print(f\"Validation error: {e}\")",
          "    print(f\"Invalid value: {e.value}\")",
          "Custom exceptions are useful for:",
          "• Creating application-specific error types",
          "• Providing more context about errors",
          "• Making error handling more precise and readable",
          "• Grouping related errors together",
        ],
      ),
      SubContent(
        id: 't8p1',
        title: 'Exception Handling Examples',
        type: 'program',
        paragraphs: [
          '''# Basic exception handling
try:
    num = int(input("Enter a number: "))
    result = 10 / num
    print(f"10 divided by {num} is {result}")
except ValueError:
    print("That's not a valid number!")
except ZeroDivisionError:
    print("Cannot divide by zero!")
except Exception as e:
    print(f"An unexpected error occurred: {e}")
else:
    print("Division completed successfully")
finally:
    print("This always executes")

# Raising exceptions
def calculate_square_root(x):
    if x < 0:
        raise ValueError("Cannot calculate square root of negative number")
    return x ** 0.5

try:
    result = calculate_square_root(-4)
except ValueError as e:
    print(e)  # Cannot calculate square root of negative number

# Custom exception
class InsufficientFundsError(Exception):
    def __init__(self, balance, amount):
        self.balance = balance
        self.amount = amount
        super().__init__(f"Insufficient funds: {balance} available, {amount} requested")

def withdraw(balance, amount):
    if amount > balance:
        raise InsufficientFundsError(balance, amount)
    return balance - amount

try:
    new_balance = withdraw(100, 150)
except InsufficientFundsError as e:
    print(e)  # Insufficient funds: 100 available, 150 requested
    print(f"Balance: {e.balance}, Requested: {e.amount}")

# Using else and finally
try:
    file = open("data.txt", "r")
    content = file.read()
except FileNotFoundError:
    print("File not found")
else:
    print("File contents:", content)
finally:
    if 'file' in locals():
        file.close()
    print("Cleanup completed")''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'Which clause always executes, whether an exception occurred or not?',
        'options': ['try', 'except', 'else', 'finally'],
        'correct': 3,
      },
      {
        'question': 'How do you create a custom exception class?',
        'options': [
          'class MyError:',
          'class MyError(Exception):',
          'class MyError extends Exception:',
          'class MyError implements Exception:'
        ],
        'correct': 1,
      },
      {
        'question': 'What is the purpose of the else clause in try-except?',
        'options': [
          'To handle any exception',
          'To run code when no exception occurs',
          'To run code when an exception occurs',
          'To always run code'
        ],
        'correct': 1,
      },
      {
        'question': 'Which exception is raised for invalid type operations?',
        'options': ['ValueError', 'TypeError', 'NameError', 'IndexError'],
        'correct': 1,
      },
    ],
  ),
  Topic(
    id: 't9',
    title: 'Object-Oriented Programming (OOP)',
    description: 'Classes, objects, inheritance, and polymorphism in Python',
    contents: [
      SubContent(
        id: 't9e1',
        title: 'Classes and Objects',
        type: 'explanation',
        paragraphs: [
          "A class is a blueprint for creating objects. An object is an instance of a class—a self-contained component containing properties (attributes) and behaviors (methods).",
          "Defining a class:",
          "class ClassName:",
          "    \"\"\"Optional class documentation string\"\"\"",
          "    # Class body",
          "Creating objects (instantiating a class):",
          "object_name = ClassName()",
          "The __init__ method is a special constructor method that is automatically called when a new object is created. It is used to initialize the object's attributes:",
          "class Dog:",
          "    def __init__(self, name, age):",
          "        self.name = name  # instance attribute",
          "        self.age = age    # instance attribute",
          "my_dog = Dog(\"Buddy\", 5)",
          "The self parameter is a reference to the current instance of the class and is used to access variables and methods belonging to that class.",
        ],
      ),
      SubContent(
        id: 't9e2',
        title: 'Attributes and Methods',
        type: 'explanation',
        paragraphs: [
          "Attributes are variables that belong to an object. Methods are functions that belong to an object.",
          "Types of attributes:",
          "1. Instance attributes: Specific to each object:",
          "   class Dog:",
          "       def __init__(self, name):",
          "           self.name = name  # instance attribute",
          "2. Class attributes: Shared by all instances:",
          "   class Dog:",
          "       species = \"Canis familiaris\"  # class attribute",
          "       def __init__(self, name):",
          "           self.name = name",
          "Methods:",
          "class Dog:",
          "    def __init__(self, name):",
          "        self.name = name",
          "    def bark(self):  # instance method",
          "        print(f\"{self.name} says woof!\")",
          "my_dog = Dog(\"Buddy\")",
          "my_dog.bark()  # Buddy says woof!",
          "The self parameter in methods refers to the instance calling the method. It must be the first parameter of any instance method.",
        ],
      ),
      SubContent(
        id: 't9e3',
        title: 'Constructors (__init__)',
        type: 'explanation',
        paragraphs: [
          "The __init__ method is called when a new object is created. It's used to initialize the object's attributes:",
          "class Person:",
          "    def __init__(self, name, age):",
          "        self.name = name",
          "        self.age = age",
          "        self.created = datetime.now()  # can do more than just assign parameters",
          "person = Person(\"Alice\", 30)",
          "print(person.name)  # Alice",
          "print(person.age)   # 30",
          "The __init__ method can have default parameters:",
          "class Person:",
          "    def __init__(self, name, age=0):",
          "        self.name = name",
          "        self.age = age",
          "person1 = Person(\"Alice\", 30)",
          "person2 = Person(\"Bob\")  # age defaults to 0",
          "Other special methods:",
          "• __new__(): Actually creates the object (before __init__)",
          "• __del__(): Destructor, called when object is about to be destroyed",
          "• __str__(): Returns a string representation of the object",
          "• __repr__(): Returns an unambiguous string representation",
        ],
      ),
      SubContent(
        id: 't9e4',
        title: 'Inheritance',
        type: 'explanation',
        paragraphs: [
          "Inheritance allows a class to inherit attributes and methods from another class:",
          "class Animal:  # Base class",
          "    def __init__(self, name):",
          "        self.name = name",
          "    def speak(self):",
          "        raise NotImplementedError(\"Subclass must implement this method\")",
          "class Dog(Animal):  # Derived class",
          "    def speak(self):",
          "        return f\"{self.name} says woof!\"",
          "class Cat(Animal):  # Derived class",
          "    def speak(self):",
          "        return f\"{self.name} says meow!\"",
          "dog = Dog(\"Buddy\")",
          "cat = Cat(\"Whiskers\")",
          "print(dog.speak())  # Buddy says woof!",
          "print(cat.speak())  # Whiskers says meow!",
          "Types of inheritance:",
          "1. Single inheritance: A class inherits from one base class",
          "2. Multiple inheritance: A class inherits from multiple base classes",
          "3. Multilevel inheritance: A class inherits from a derived class",
          "4. Hierarchical inheritance: Multiple classes inherit from one base class",
          "5. Hybrid inheritance: Combination of multiple and multilevel inheritance",
          "The super() function is used to call methods from the parent class:",
          "class Dog(Animal):",
          "    def __init__(self, name, breed):",
          "        super().__init__(name)  # Call parent constructor",
          "        self.breed = breed",
        ],
      ),
      SubContent(
        id: 't9e5',
        title: 'Polymorphism',
        type: 'explanation',
        paragraphs: [
          "Polymorphism allows objects of different classes to be treated as objects of a common super class:",
          "def animal_sound(animal):",
          "    print(animal.speak())",
          "dog = Dog(\"Buddy\")",
          "cat = Cat(\"Whiskers\")",
          "animal_sound(dog)  # Buddy says woof!",
          "animal_sound(cat)  # Whiskers says meow!",
          "Duck typing: Python uses duck typing, which means \"if it walks like a duck and quacks like a duck, then it must be a duck.\" In other words, Python doesn't care about the actual type of an object, only that it has the required methods and attributes:",
          "class Car:",
          "    def speak(self):",
          "        return \"Vroom vroom!\"",
          "car = Car()",
          "animal_sound(car)  # Vroom vroom!",
          "Operator overloading: Python allows operators to have different meanings depending on the context:",
          "class Vector:",
          "    def __init__(self, x, y):",
          "        self.x = x",
          "        self.y = y",
          "    def __add__(self, other):  # Overload + operator",
          "        return Vector(self.x + other.x, self.y + other.y)",
          "    def __str__(self):",
          "        return f\"Vector({self.x}, {self.y})\"",
          "v1 = Vector(2, 3)",
          "v2 = Vector(1, 4)",
          "v3 = v1 + v2  # Calls v1.__add__(v2)",
          "print(v3)  # Vector(3, 7)",
        ],
      ),
      SubContent(
        id: 't9e6',
        title: 'Encapsulation',
        type: 'explanation',
        paragraphs: [
          "Encapsulation is the bundling of data and methods that operate on that data within one unit (class), and restricting access to some of the object's components.",
          "In Python, encapsulation is achieved using naming conventions:",
          "1. Public: No underscore prefix. Accessible from anywhere.",
          "   self.public_attribute",
          "   def public_method():",
          "2. Protected: Single underscore prefix. Should not be accessed outside the class or its subclasses (but it's still accessible).",
          "   self._protected_attribute",
          "   def _protected_method():",
          "3. Private: Double underscore prefix. Name mangling makes it harder to access from outside the class.",
          "   self.__private_attribute",
          "   def __private_method():",
          "Example:",
          "class BankAccount:",
          "    def __init__(self, account_holder, balance):",
          "        self.account_holder = account_holder  # public",
          "        self._account_number = self._generate_account_number()  # protected",
          "        self.__balance = balance  # private",
          "    def _generate_account_number(self):  # protected method",
          "        return \"ACC\" + str(random.randint(100000, 999999))",
          "    def get_balance(self):  # public method to access private attribute",
          "        return self.__balance",
          "    def deposit(self, amount):",
          "        if amount > 0:",
          "            self.__balance += amount",
          "    def withdraw(self, amount):",
          "        if 0 < amount <= self.__balance:",
          "            self.__balance -= amount",
          "Name mangling for private attributes:",
          "account = BankAccount(\"Alice\", 1000)",
          "# account.__balance  # Error: no attribute '__balance'",
          "# But you can still access it with name mangling:",
          "# account._BankAccount__balance  # 1000 (but you shouldn't do this)",
        ],
      ),
      SubContent(
        id: 't9e7',
        title: 'Magic Methods',
        type: 'explanation',
        paragraphs: [
          "Magic methods (also called dunder methods) are special methods with double underscores at the beginning and end. They allow you to define how objects of your class behave with language operators and constructs.",
          "Common magic methods:",
          "• __init__(self, ...): Constructor, called when object is created",
          "• __str__(self): Called by str() and print(), should return readable string",
          "• __repr__(self): Called by repr(), should return unambiguous string",
          "• __len__(self): Called by len(), should return length of object",
          "• __getitem__(self, key): Called for indexing, e.g., obj[key]",
          "• __setitem__(self, key, value): Called for assignment to indexing, e.g., obj[key] = value",
          "• __delitem__(self, key): Called when an item is deleted, e.g., del obj[key]",
          "• __add__(self, other): Implements addition, e.g., obj + other",
          "• __sub__(self, other): Implements subtraction, e.g., obj - other",
          "• __eq__(self, other): Implements equality, e.g., obj == other",
          "• __lt__(self, other): Implements less than, e.g., obj < other",
          "• __gt__(self, other): Implements greater than, e.g., obj > other",
          "• __call__(self, ...): Allows object to be called like a function, e.g., obj()",
          "• __enter__(self), __exit__(self, ...): Implement context manager behavior for with statements",
          "Example:",
          "class Vector:",
          "    def __init__(self, x, y):",
          "        self.x = x",
          "        self.y = y",
          "    def __add__(self, other):",
          "        return Vector(self.x + other.x, self.y + other.y)",
          "    def __str__(self):",
          "        return f\"Vector({self.x}, {self.y})\"",
          "    def __eq__(self, other):",
          "        return self.x == other.x and self.y == other.y",
          "v1 = Vector(2, 3)",
          "v2 = Vector(1, 4)",
          "v3 = v1 + v2  # Vector(3, 7)",
          "print(v1 == v2)  # False",
        ],
      ),
      SubContent(
        id: 't9e8',
        title: 'Class Methods and Static Methods',
        type: 'explanation',
        paragraphs: [
          "Class methods are methods that are bound to the class rather than its object. They can modify class state that applies across all instances of the class.",
          "Static methods are methods that don't modify class or instance state. They are utility functions that belong to the class.",
          "class MyClass:",
          "    class_attribute = \"class value\"",
          "    def __init__(self, instance_attribute):",
          "        self.instance_attribute = instance_attribute",
          "    @classmethod",
          "    def class_method(cls):  # cls refers to the class, not instance",
          "        print(f\"Class method called on {cls}\")",
          "        print(f\"Class attribute: {cls.class_attribute}\")",
          "    @staticmethod",
          "    def static_method():  # No self or cls parameter",
          "        print(\"Static method called\")",
          "    def instance_method(self):  # self refers to the instance",
          "        print(f\"Instance method called on {self}\")",
          "        print(f\"Instance attribute: {self.instance_attribute}\")",
          "MyClass.class_method()  # Called on class",
          "MyClass.static_method()  # Called on class",
          "obj = MyClass(\"instance value\")",
          "obj.instance_method()  # Called on instance",
          "obj.class_method()     # Can also be called on instance",
          "obj.static_method()    # Can also be called on instance",
          "Class methods are often used as alternative constructors:",
          "class Person:",
          "    def __init__(self, name, age):",
          "        self.name = name",
          "        self.age = age",
          "    @classmethod",
          "    def from_birth_year(cls, name, birth_year):",
          "        age = datetime.now().year - birth_year",
          "        return cls(name, age)",
          "person = Person.from_birth_year(\"Alice\", 1990)",
        ],
      ),
      SubContent(
        id: 't9e9',
        title: 'Property Decorator',
        type: 'explanation',
        paragraphs: [
          "The @property decorator allows you to define methods that can be accessed like attributes, providing a way to implement getters, setters, and deleters.",
          "class Person:",
          "    def __init__(self, first_name, last_name):",
          "        self.first_name = first_name",
          "        self.last_name = last_name",
          "    @property",
          "    def full_name(self):  # Getter",
          "        return f\"{self.first_name} {self.last_name}\"",
          "    @full_name.setter",
          "    def full_name(self, name):  # Setter",
          "        first, last = name.split(' ', 1)",
          "        self.first_name = first",
          "        self.last_name = last",
          "    @full_name.deleter",
          "    def full_name(self):  # Deleter",
          "        self.first_name = None",
          "        self.last_name = None",
          "        print(\"Name deleted\")",
          "person = Person(\"John\", \"Doe\")",
          "print(person.full_name)  # John Doe (calls getter)",
          "person.full_name = \"Jane Smith\"  # Calls setter",
          "print(person.first_name)  # Jane",
          "print(person.last_name)   # Smith",
          "del person.full_name  # Calls deleter",
          "Properties are useful for:",
          "1. Validating data before setting attributes",
          "2. Creating read-only attributes",
          "3. Creating computed attributes (attributes that are calculated on the fly)",
          "4. Maintaining backward compatibility when changing internal implementation",
          "Example with validation:",
          "class Circle:",
          "    def __init__(self, radius):",
          "        self._radius = radius",
          "    @property",
          "    def radius(self):",
          "        return self._radius",
          "    @radius.setter",
          "    def radius(self, value):",
          "        if value < 0:",
          "            raise ValueError(\"Radius cannot be negative\")",
          "        self._radius = value",
          "    @property",
          "    def area(self):  # Read-only property",
          "        return 3.14 * self._radius ** 2",
        ],
      ),
      SubContent(
        id: 't9e10',
        title: 'Dunder Methods',
        type: 'explanation',
        paragraphs: [
          "Dunder methods (double underscore methods) are special methods that allow you to define how objects of your class behave with language operators and constructs.",
          "Common dunder methods:",
          "• __len__(self): Called by len(), should return the length of the object",
          "• __getitem__(self, key): Called for indexing, e.g., obj[key]",
          "• __setitem__(self, key, value): Called for assignment to indexing, e.g., obj[key] = value",
          "• __delitem__(self, key): Called when an item is deleted, e.g., del obj[key]",
          "• __iter__(self): Should return an iterator object",
          "• __next__(self): Should return the next item from the iterator",
          "• __contains__(self, item): Called for membership test, e.g., item in obj",
          "• __call__(self, ...): Allows object to be called like a function, e.g., obj()",
          "• __enter__(self), __exit__(self, ...): Implement context manager behavior for with statements",
          "• __add__(self, other): Implements addition, e.g., obj + other",
          "• __sub__(self, other): Implements subtraction, e.g., obj - other",
          "• __mul__(self, other): Implements multiplication, e.g., obj * other",
          "• __truediv__(self, other): Implements division, e.g., obj / other",
          "• __eq__(self, other): Implements equality, e.g., obj == other",
          "• __lt__(self, other): Implements less than, e.g., obj < other",
          "• __gt__(self, other): Implements greater than, e.g., obj > other",
          "• __str__(self): Called by str() and print(), should return readable string representation",
          "• __repr__(self): Called by repr(), should return unambiguous string representation",
          "Example:",
          "class MyList:",
          "    def __init__(self, items):",
          "        self.items = list(items)",
          "    def __len__(self):",
          "        return len(self.items)",
          "    def __getitem__(self, index):",
          "        return self.items[index]",
          "    def __setitem__(self, index, value):",
          "        self.items[index] = value",
          "    def __delitem__(self, index):",
          "        del self.items[index]",
          "    def __iter__(self):",
          "        return iter(self.items)",
          "    def __contains__(self, item):",
          "        return item in self.items",
          "    def __add__(self, other):",
          "        return MyList(self.items + other.items)",
          "    def __str__(self):",
          "        return str(self.items)",
          "my_list = MyList([1, 2, 3])",
          "print(len(my_list))  # 3",
          "print(my_list[1])    # 2",
          "print(2 in my_list)  # True",
          "for item in my_list:",
          "    print(item)      # 1, 2, 3",
        ],
      ),
      SubContent(
        id: 't9p1',
        title: 'OOP Examples',
        type: 'program',
        paragraphs: [
          '''# Basic class example
class Dog:
    # Class attribute
    species = "Canis familiaris"
    
    # Initializer
    def __init__(self, name, age):
        self.name = name  # Instance attribute
        self.age = age    # Instance attribute
    
    # Instance method
    def description(self):
        return f"{self.name} is {self.age} years old"
    
    # Another instance method
    def speak(self, sound):
        return f"{self.name} says {sound}"

# Creating objects
my_dog = Dog("Buddy", 5)
your_dog = Dog("Rex", 3)

print(my_dog.description())     # Buddy is 5 years old
print(your_dog.speak("Woof"))   # Rex says Woof
print(f"All dogs are {my_dog.species}")  # All dogs are Canis familiaris

# Inheritance example
class Animal:
    def __init__(self, name):
        self.name = name
    
    def speak(self):
        raise NotImplementedError("Subclass must implement this method")

class Dog(Animal):
    def speak(self):
        return f"{self.name} says woof!"

class Cat(Animal):
    def speak(self):
        return f"{self.name} says meow!"

dog = Dog("Buddy")
cat = Cat("Whiskers")

print(dog.speak())  # Buddy says woof!
print(cat.speak())  # Whiskers says meow!

# Property example
class Circle:
    def __init__(self, radius):
        self._radius = radius
    
    @property
    def radius(self):
        return self._radius
    
    @radius.setter
    def radius(self, value):
        if value < 0:
            raise ValueError("Radius cannot be negative")
        self._radius = value
    
    @property
    def area(self):
        return 3.14159 * self._radius ** 2
    
    @property
    def diameter(self):
        return 2 * self._radius

circle = Circle(5)
print(circle.radius)   # 5
print(circle.area)     # 78.53975
print(circle.diameter) # 10

circle.radius = 7
print(circle.area)     # 153.93791

# Magic methods example
class Vector:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def __add__(self, other):
        return Vector(self.x + other.x, self.y + other.y)
    
    def __sub__(self, other):
        return Vector(self.x - other.x, self.y - other.y)
    
    def __mul__(self, scalar):
        return Vector(self.x * scalar, self.y * scalar)
    
    def __str__(self):
        return f"Vector({self.x}, {self.y})"
    
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

v1 = Vector(2, 3)
v2 = Vector(1, 4)

v3 = v1 + v2  # Vector(3, 7)
v4 = v1 * 3   # Vector(6, 9)

print(v3)  # Vector(3, 7)
print(v4)  # Vector(6, 9)
print(v1 == v2)  # False''',
        ],
      ),
    ],
    quizQuestions: [
      {
        'question': 'Which method is called when an object is created?',
        'options': ['__new__', '__init__', '__create__', '__construct__'],
        'correct': 1,
      },
      {
        'question': 'What does the super() function do?',
        'options': [
          'Calls the parent class method',
          'Creates a super object',
          'Makes an object superior',
          'Initializes all parent classes'
        ],
        'correct': 0,
      },
      {
        'question': 'Which decorator is used to create a class method?',
        'options': ['@classmethod', '@staticmethod', '@classfunc', '@method'],
        'correct': 0,
      },
      {
        'question': 'What is the purpose of the @property decorator?',
        'options': [
          'To make a method private',
          'To define a method that can be accessed like an attribute',
          'To create a static method',
          'To define a class method'
        ],
        'correct': 1,
      },
    ],
  ),
];
