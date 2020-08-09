for /F %%C in ('docker ps -a --format "{{.ID}}"') do docker rm %%C

for /F %%I in ('docker images --format "{{.ID}}"') do (
	set isExcluded=0
	for /F %%E in (excluded.txt) do (
		if %%I==%%E do set isExcluded=1
	)
	if isExcluded==1 do docker rmi %%I
)

set isExcluded=