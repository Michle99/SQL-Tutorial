DROP DATABASE IF EXISTS fitnessDB;
CREATE DATABASE fitnessDB;

USE fitnessDB;

CREATE TABLE workout(
	workoutId INT PRIMARY KEY AUTO_INCREMENT,
	dateOfWorkOut TIMESTAMP NOT NULL,
	workOutName VARCHAR(50) not null,
    totalWorkoutDuration INT,
    totalCaloriesBurned INT
);

CREATE TABLE exercise(
	exerciseId INT PRIMARY KEY AUTO_INCREMENT,
	exerciseType varchar(50) NOT NULL,
	caloriePerMinute int not null
);

CREATE TABLE workout_exercise(
	workoutId INT NOT NULL,
    exerciseId INT NOT NULL,
	PRIMARY KEY pk_workout_exercise (workoutId, exerciseId),
	FOREIGN KEY pk_workout_exercise_workout (workoutId)
        REFERENCES workout(workoutId),
	FOREIGN KEY pk_workout_exercise_exercise (exerciseId)
        REFERENCES exercise(exerciseId),
	caloriesBurned INT NOT NULL,
	durationsMins INT not null
);

/**  DATA INSERTIONS  **/
-- exercise
insert into exercise(exerciseType, caloriePerMinute) values
		('Back Squat', 10), ('Front Squat', 15), ('Sumo Deadlift', 15), ('Hip Thrust', 10), ('Lunges', 10), ('Bulgarian Squats', 10), ('Roman Deadlift', 10), ('Leg Press', 10),
        ('Hack Squat', 15), ('Goblet Squat', 10), ('Cable Kickbacks', 10), ('Step ups', 10), ('Pistol Squats', 15),
        ('Bench Press', 10), ('Incline Bench Press', 15), ('Strict Shoulder Press', 10), ('Push Press', 15), ('DB Bench Press', 10), ('DB Incline Bench Press', 15), ('DB Shoulder Press', 10),
        ('Push Ups', 10), ('Cable Flies', 10), ('Low Cable Flies', 15), ('Close Grip Push Ups', 10), ('Cable Tricep Extention', 10), ('Dips', 10), ('Front Raises', 10), ('Lateral Raises', 15),
        ('Rear Delt Raises', 10), ('Face Pull', 15),
        ('Power Clean', 15), ('Hang Clean', 15), ('Snatches', 10), ('Bent Over Rows', 10), ('Seal Rows', 15), ('Seated Cable Rows', 10), ('Single Arm Cable Rope Rows', 10), ('DB Rows', 10),
        ('Lat Pulldowns', 10), ('Close Grip Lat Pulldowns', 10), ('Pull Ups', 10), 
        ('Preacher Curls', 10), ('Barbell Bicep Curls', 10), ('DB Alternating Curls', 10), ('Incline DB Curls', 10), ('Single Arm Cable Curls', 10), ('Hammer Curls', 10),
        ('Run', 5), ('Walk', 5), ('Interval Running', 10), ('Stairmaster', 15), ('Rowing', 10), ('Biking', 5), ('Swimming', 10), ('Burpees', 10), ('Core', 10), ('Jump Rope', 10);

-- workout
insert into workout(dateOfWorkOut, workOutName) values 
	('2022-09-05', 'TryOuts'),('2022-09-06', 'LegDay'), ('2022-09-05', 'CardioDay');

insert into workout_exercise(workoutId, exerciseId, caloriesBurned, durationsMins) values 
(1, 1, 100, 20),(1, 2, 150, 25),(2, 3, 200, 30),(2, 4, 250, 35),(3, 5, 300, 40),(3, 6, 350, 45);

show tables;
select * from workout_exercise;
select * from workout;
select * from exercise;

select e.*, workout_exercise.caloriesBurned, workout_exercise. durationsMins
        from exercise e
        Inner Join workout_exercise on e.exerciseId = workout_exercise.exerciseId;
        
SELECT e.*, we.caloriesBurned, we.durationsMins
                FROM Exercise e
                JOIN workout_exercise we on e.exerciseId = we.exerciseId
                WHERE we.workoutID = 1;

-- QUERIES
-- DELETE FROM workout_exercise WHERE exerciseId = 1;
-- DELETE FROM exercise WHERE exerciseId = 1;