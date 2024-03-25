/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles (Query #3)
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles (Query #4)
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 30;

-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 30;

/*
Here's a breakdown of the most optimal skills for Data Analysts in 2023: 

Among the top skills in demand, Apache Kafka stands out with a demand count of 40 and an average salary of $129,999. 
PyTorch follows with a demand count of 20 and an average salary of $125,226, while Perl and TensorFlow share a similar demand count of 20,
with average salaries of $124,686 and $120,647, respectively. Notably, skills like Apache Airflow and Scala, despite lower demand 
counts (71 and 59, respectively), offer competitive average salaries of $116,387 and $115,480, indicating their significance in specialized roles.
Furthermore, cloud technologies such as Google Cloud Platform (GCP) and Snowflake demonstrate high demand counts (78 and 241, respectively),
correlating with slightly lower average salaries of $113,065 and $111,578. This suggests a robust demand for cloud-related skills but with
slightly less premium compensation compared to niche technologies like Kafka or PyTorch.

[
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "40",
    "avg_salary": "129999"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "20",
    "avg_salary": "125226"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "demand_count": "20",
    "avg_salary": "124686"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "24",
    "avg_salary": "120647"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "11",
    "avg_salary": "118407"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "demand_count": "15",
    "avg_salary": "117966"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "71",
    "avg_salary": "116387"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "59",
    "avg_salary": "115480"
  },
  {
    "skill_id": 169,
    "skills": "linux",
    "demand_count": "58",
    "avg_salary": "114883"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "62",
    "avg_salary": "114153"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "49",
    "avg_salary": "114058"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "26",
    "avg_salary": "113608"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "26",
    "avg_salary": "113608"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "78",
    "avg_salary": "113065"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "187",
    "avg_salary": "113002"
  },
  {
    "skill_id": 193,
    "skills": "splunk",
    "demand_count": "15",
    "avg_salary": "112928"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "102",
    "avg_salary": "112881"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "74",
    "avg_salary": "112250"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "241",
    "avg_salary": "111578"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "44",
    "avg_salary": "111496"
  },
  {
    "skill_id": 168,
    "skills": "unix",
    "demand_count": "37",
    "avg_salary": "111123"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "140",
    "avg_salary": "110888"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "90",
    "avg_salary": "110767"
  },
  {
    "skill_id": 137,
    "skills": "phoenix",
    "demand_count": "23",
    "avg_salary": "109259"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "demand_count": "29",
    "avg_salary": "109052"
  },
  {
    "skill_id": 58,
    "skills": "neo4j",
    "demand_count": "12",
    "avg_salary": "108646"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "108",
    "avg_salary": "108331"
  },
  {
    "skill_id": 141,
    "skills": "express",
    "demand_count": "96",
    "avg_salary": "108221"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "90",
    "avg_salary": "107969"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "145",
    "avg_salary": "107931"
  }
]
*/