/*
Question: What skills are required for the top-paying data analyst jobs?
*/

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'France' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
RESULTS
=======

[
  {
    "job_id": 155170,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Contentsquare",
    "skills": "sql"
  },
  {
    "job_id": 155170,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Contentsquare",
    "skills": "python"
  },
  {
    "job_id": 155170,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Contentsquare",
    "skills": "snowflake"
  },
  {
    "job_id": 155170,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Contentsquare",
    "skills": "tableau"
  },
  {
    "job_id": 314601,
    "job_title": "Data Analyst POEI - Ecole de la Data & de l'IA - Promotion 202307",
    "salary_year_avg": "53014.0",
    "company_name": "Business & Decision",
    "skills": "sql"
  }
]
*/

