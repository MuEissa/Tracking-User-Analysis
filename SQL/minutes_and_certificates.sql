SELECT 
    c.student_id,
    COALESCE(SUM(seconds_watched) / 60, 0) AS minutes_watched,
    certificates_issued
FROM
    (SELECT 
        student_id, COUNT(certificate_id) AS certificates_issued
    FROM
        student_certificates
    GROUP BY student_id) c
        LEFT JOIN
    student_video_watched v ON c.student_id = v.student_id
GROUP BY c.student_id
