WITH t1 AS (SELECT strftime('%Y-%m-%d %H:%M:%f', 'now') as start_time),
     run_query AS (SELECT * FROM Student),
     t2 AS (SELECT strftime('%Y-%m-%d %H:%M:%f', 'now') as end_time)
SELECT ((strftime('%f', end_time) - strftime('%f', start_time)) * 1000) AS elapsed_ms
FROM t1, t2;
