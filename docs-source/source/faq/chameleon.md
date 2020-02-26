# FAQ chameleon cloud

All FAQ's related to chameleon cloud asume 

1. you have looked at the instances with horizon before you use `cms`
2. `cms` is installed 
3. `cms init` worked and 



## How check if chmaeleon cloud works


```bash
cms set cloud=chameleon
cms flavor list --refresh
```

This returns the list of fkavors

## How do I upload my key to chameleon?

```bash
cms key set cloud=chameleon
cms flavor list --refresh
```
