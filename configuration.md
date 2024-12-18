Doc:

1. Create a configmap named config with values foo=lala,foo2=lolo

    2. Code:    
```
k create cm config --from-literal=foo=lala --from-literal=foo2=lolo
```
    3. Verification:
    ```
 k get cm config -o json | jq -r '.data | {foo, foo2}
2. Display it's values
```
    k get cm config -o yaml; k describe cm config
```

    ```
    4. Cleanup
    ```
k delete cm config
    ```

2. Create and display a configmap from a file
  * Code:
  ```
   echo -e "foo3=lili\nfoo4=lele" > config.txt;
   k create cm from-file --from-file=config.txt;
  ```
  * Verifaction:
  ```
 k get cm from-file -o yaml; k describe cm from-file
  ```
  * Cleanup:
  ```
    k delete cm from-file
  ```

3. Create and display a configmap from a .env file