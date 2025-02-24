CREATE TABLE public.drum_corps (
	corps_name TEXT,
	cont_grant NUMERIC,
	prog_serv NUMERIC,
	invest_inc NUMERIC,
	other_rev NUMERIC,
	total_rev NUMERIC,
	grant_paid NUMERIC,
	benefit_paid NUMERIC,
	salaries NUMERIC,
	prof_fund NUMERIC,
	other_exp NUMERIC,
	total_exp NUMERIC,
	net_income NUMERIC,
	total_assets NUMERIC,
	total_liab NUMERIC,
	net_assets NUMERIC
);

CREATE TABLE public.bluecoats(
	corps_name TEXT,
	memb_fees NUMERIC,
	perf_fee NUMERIC,
	fundrasing NUMERIC,
	gov_grants NUMERIC,
	other_cont NUMERIC,
	gaming NUMERIC,
	inv_sales NUMERIC,
	other_rev NUMERIC,
	people_cost NUMERIC,
	advertising NUMERIC,
	travel NUMERIC,
	dep_amt NUMERIC,
	vehicles NUMERIC,
	meals NUMERIC,
	supplies NUMERIC,
	other_exp NUMERIC 
);

COPY public.drum_corps
FROM
'C:\Andy\SQL\drum_corps.csv'
WITH (
	FORMAT CSV, 
	NULL '',
	DELIMITER ',',
	HEADER
);

COPY public.bluecoats
FROM
'C:\Andy\SQL\DCI\bluecoats.csv'
WITH (
	FORMAT CSV, 
	NULL '',
	DELIMITER ',',
	HEADER
);

SELECT
	*
FROM
	drum_corps
ORDER BY
	net_assets DESC;

SELECT
	*
FROM
	bluecoats;

SELECT
	corps_name,
	ROUND(total_liab / total_assets,
	2) AS debt_asset_ratio, 
	ROUND(net_income / total_rev,
	2) AS net_margin,
	ROUND(net_income / total_assets,
	2) AS roa,
	ROUND(total_rev / total_assets,
	2) AS asset_turnover
FROM
	drum_corps
ORDER BY
	total_assets DESC;
