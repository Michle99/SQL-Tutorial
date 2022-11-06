USE TrackIt;

select * from taskstatus where IsResolved = 1;

-- TaskStatusIds are in order, so we can use BETWEEN.
-- If they were out of sequence, we might use an IN (id1, id2, idN).
SELECT *
FROM Task
WHERE TaskStatusId BETWEEN 5 AND 8;

-- using Join 
SELECT 
    Task.TaskId,
    Task.Title,
    TaskStatus.Name
FROM TaskStatus
INNER JOIN Task ON TaskStatus.TaskStatusId = Task.TaskStatusId
WHERE TaskStatus.IsResolved = 1;