# ThoughtWorks Mars Rover Tech test

## Contents

- [Introduction](#introduction)
- [Assumptions](#assumptions)
- [Approach](#approach)
- [Issues](#issues)
- [To Do](#todo)
- [Technologies](#tech)
- [Setup](#setup)
- [How to run](#torun)
- [User Stories](#userstories)

## <a name="introduction">Introduction</a>

This is my interpretation of the Mars Rover tech test, which is done using a test driven design approach, with Ruby as the language, and Rspec as the testing framework.

The last feature test, represents the test data given

## <a name='assumption'>Assumptions</a>

- Each position is the intersection of two numbers representing the x and y coordinates, starting from 0 to a max number. Where the numbers are positive whole numbers.
- Rovers can occupy the same space
- Rovers cannot go over the edge, exception is raised
- incorrect instructions will be ignored


## <a name='approach'>Approach</a>

- I have used the XP methodology of TDD and the Red - Green - Refactor cycle for creating the code. Thus the code has a 100% test coverage.
- I started with a feature test that matched the user story, and built unit tests from this. When the feature was complete, I would focus on edge cases covered by unit tests.
- Use of controller to communicate with model (MVC and separation of concerns). This allows the user to only interact with one object and hides implemetation details. The controller, MissionControl, deals with reading the instructions and move all rovers given in the instructions. The Model, RoverModel, deals with moving one rover.
- Used RoverModel class to interact with the MissionControl class, This was done to avoid sharing all the implementation via the other classes.
- Use of dependency injection, to reduce coupling in all classes apart from Plateau class. Thus allowing for using different classess with the same interface but different implementation to be used instead
- Use of Begin/Rescue in controller, to allow for each rover to complete it's instruction instead of exiting the program

## <a name='issues'>Issues</a>

- Design and number of classes, especially from user story 2 onwards. It felt that I created too many classes and thus passed on the implementation of methods further along to other classes. But it did result in shorter methods and encapsulation.
- Naming, I felt my naming was not as descriptive as it could be.
- MissionControl class looks a mess, very large methods and lots of implementation details. Although, I did extract to private methods.
- Probably over tested, and tested different cases when it wsa not needed.


## <a name="todo">To Do</a>

- Instead of inputing the instructions manually, use a file containing the instructions and use the file name as the argumente for MissionControl#activate_rover

- Have a dedicated view, to read a file of instructions and output the results to a file. This view will be implemented in the MissonControl



## <a name='tech'>Technologies used</a>

Ruby 2.2.3
Rspec 3.5.0

## <a name='setup'>Setup</a>

1. unzip file
2. enter folder
3. run $ `bundle install`

To run tests and view coverage

$ `rspec`

To view more detailed coverage

- Open browser, and open file `mars-rover/coverage/index.html`

## <a name='torun'>How to run</a>

1. Open Repl `$ irb` in root folder
2. run `> require './required_files.rb'` to get all the files loaded
3. run `> mission_control = MissionControl.new(RoverModel)` to set up
4. run `> instructions = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"` to input instructions,
  - where \n is a new line, M is move forwards, L is turn Left, R is turn right.
  - The first pair of numbers is the plateau size
  - The next two sets of numbers ie 1 2 N and LMLMLMLMM is the initial position and direction of the rover and the commands
5. run `> mission_control.activate_rovers(instructions)` to excute the instructions


### To run individually for a single rover:

Type in the following in the repl

This is setup:
``> require './required_files.rb'``

Replace x and y with whole numbers 0 and above:
`> plateau = Plateau.new(x ,y)`
`> landing_position = Position.new(1, 1)`

Replace Z with any of the four compass points, 'W', 'N', 'S', 'E'
`> orientation = Orientation.new(Z)`

`> rover = Rover.new(orientation, landing_position)`
`> rover_model = RoverModel.new(rover, plateau)`

Replace instructions with the a combinations of  'L', 'R', 'M'
`> move_commands = MoveCommands.new(instructions)`

This is runs the rover
`> rover_model.instruct_to_move(move_commands)`

This locates the rover or states it has gone off the plateau
`> rover_model.get_location_vector`

## <a name='userstories'>User Stories</a>

```
User Story 1

As a mission controller,
So that I know where to send my rovers to explore,
I would like to have a plateau mapped out

User Story 2

As a mission controller,
So that I can explore Mars,
I would like to land a rover on the plateau of the planet

User Story 3

As a rover driver,
So that I can explore the plateau,
I would like to turn the rover

User Story 4

As a rover driver,
So that I can explore the plateau,
I would like to move the rover in the direction it is facing

User Story 5

As a rover driver,
So that I can explore the plateau,
I would like to give the rover multiple commands to guide it's movement

User Story 6

As a mission controller,
So that I can explore different parts of the plateau simultaneously,
I would like to deploy several rovers at a time


```
