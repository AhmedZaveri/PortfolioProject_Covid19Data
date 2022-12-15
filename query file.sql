 --Query1
 --Overall Death Percentage Globally
 SELECT date, SUM(new_cases) AS TotalCasesGlobal, SUM(CAST(new_deaths AS BIGINT)) AS TotalDeathsGlobal, 
 (SUM(CAST(new_deaths AS BIGINT))/SUM(new_cases))*100 AS DeathPercentage
 FROM PortfolioProject.dbo.CovidDeaths
 WHERE continent IS NOT NULL
 GROUP BY date
 ORDER BY date

 --Query2
 --Showing the continents with the highest death counts
 SELECT location, MAX(CAST(total_deaths AS BIGINT)) AS Total_Death_Count
 FROM PortfolioProject.dbo.CovidDeaths
 WHERE continent IS NULL
 AND location IN ('Asia','Africa','North America','South America','Europe','Oceania')
 GROUP BY location
 ORDER BY Total_Death_Count DESC

 --Query3
 --Looking at Countries with highest infection rate in comparison to population
 SELECT Location, Population, MAX(total_cases) AS Highest_Infection_Count, MAX((total_cases/population)*100) AS Percent_Population_Infected
 FROM PortfolioProject.dbo.CovidDeaths
 --WHERE population > 1000000
 GROUP BY Location, Population
 ORDER BY Percent_Population_Infected DESC

 --Query4
 --Looking at Countries with highest infection rate in comparison to population
 SELECT Location, Population, date, MAX(total_cases) AS Highest_Infection_Count, MAX((total_cases/population)*100) AS Percent_Population_Infected
 FROM PortfolioProject.dbo.CovidDeaths
 GROUP BY Location, Population, date
 ORDER BY Percent_Population_Infected DESC

