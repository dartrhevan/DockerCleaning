
rem removing docker containers
for /F %%C in ('docker ps -a --format "{{.ID}}"') do docker rm %%C

rem removing docker images
Setlocal EnableDelayedExpansion
for /F %%I in ('docker images --format "{{.ID}}"') do (
	setlocal
	set isExcluded=0
	rem check whether image is excluded
	for /F %%E in (excluded.txt) do (
		if %%I==%%E set isExcluded=1
	)
	rem removing the image
	if !isExcluded!==0 docker rmi %%I
	endlocal
)
