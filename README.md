# npm_auto
1. npm login
2. cat ~~/.npmrc
3. copy token
4. Go to circle ci -> workflows -> settings -> Environment Variables
5. Create new variable with name "NPM_TOKEN" and previously copied token 


# Release process
1. Create a new tag in format `v*` for example `v0.2`
```commandline
git tag v0.2
```
2. Push tag to repo 
```commandline
git push origin v0.2
```