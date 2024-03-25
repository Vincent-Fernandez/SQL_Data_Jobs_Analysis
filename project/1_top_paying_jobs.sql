/*
Question: What are the top-paying data analyst jobs in France?

- Identify the top 10 highest-paying Data Analyst roles that are available in France
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options.
*/

SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    lower(job_location) like '%france%' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;


/*
Here's the updated breakdown of the top data analyst jobs in France:

Focused Salary Range: The top 10 paying data analyst roles in France show a salary range from €111,175 to €200,000.
This highlights a considerable earning potential for professionals in the field within France.

Variety of Companies: The employers offering these high salaries include a mix of innovative tech and traditional companies,
such as Withings, ARCHIMED, Binance, EPSA, and Sewan. 
This diversity underscores the wide-ranging demand for data analysts across different sectors.

Diverse Job Titles: The roles span traditional Data Analyst positions to more specialized ones like 
Research Engineer - Physics, Data Architect, and Security Data Analyst. This variety indicates the broad scope of data analytics roles, 
requiring a range of skills and specializations.

Geographical Spread: The jobs are located in various cities across France, including Paris, Lyon, and Nantes, among others.
This geographical diversity suggests that high-paying data analyst opportunities are not limited to a single region,
 offering flexibility in employment locations.

RESULTS
=======
[
  {
    "job_id": 21632,
    "job_title": "Research Engineer - Physics (H/F)",
    "job_location": "Issy-les-Moulineaux, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-02-01 09:52:36",
    "company_name": "Withings"
  },
  {
    "job_id": 465918,
    "job_title": "Data Architect",
    "job_location": "Lyon, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-07-27 07:46:04",
    "company_name": "ARCHIMED"
  },
  {
    "job_id": 452745,
    "job_title": "Security Data Analyst",
    "job_location": "Montrouge, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111202.0",
    "job_posted_date": "2023-01-02 15:32:49",
    "company_name": "Binance"
  },
  {
    "job_id": 887067,
    "job_title": "Data Analyst Senior F/H",
    "job_location": "Paris, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111202.0",
    "job_posted_date": "2023-01-14 21:13:04",
    "company_name": "EPSA"
  },
  {
    "job_id": 86553,
    "job_title": "Data analyst (h/f) en CDI à Paris",
    "job_location": "Paris, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-20 20:13:46",
    "company_name": "Sewan"
  },
  {
    "job_id": 210254,
    "job_title": "Data Analyst",
    "job_location": "Bezons, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-17 12:21:59",
    "company_name": "Nielsen"
  },
  {
    "job_id": 427074,
    "job_title": "Data Analyst Product",
    "job_location": "Paris, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-09-01 08:36:38",
    "company_name": "Aircall"
  },
  {
    "job_id": 1292435,
    "job_title": "Data Analyst (H/F) - CDI",
    "job_location": "Paris, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-08-31 06:45:20",
    "company_name": "Publicis Groupe"
  },
  {
    "job_id": 1502899,
    "job_title": "Sustainability Sourcing Data Analyst",
    "job_location": "Cesson-Sévigné, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-14 13:29:49",
    "company_name": "Vantiva"
  },
  {
    "job_id": 1034952,
    "job_title": "Product Data Analyst (F/M/X)",
    "job_location": "Nantes, France",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-03-11 00:39:40",
    "company_name": "iAdvize"
  }
]
