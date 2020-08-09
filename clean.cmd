for /F %%C in ('docker ps -a --format "{{.ID}}"') do docker rm %%C

Setlocal EnableDelayedExpansion
for /F %%I in ('docker images --format "{{.ID}}"') do (
	setlocal
	set isExcluded=0
	for /F %%E in (excluded.txt) do (
		if %%I==%%E set isExcluded=1
	)
	if !isExcluded!==0 docker rmi %%I
	endlocal
)

rem set isExcluded=