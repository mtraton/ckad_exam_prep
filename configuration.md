1. Create a configmap named config with values foo=lala,foo2=lolo
    1. Doc:
    2. Code:    
```
k create cm config --from-literal=foo=lala --from-literal=foo2=lolo
```
    3. Verification:
    ```
 k get cm config -o json | jq -r '.data | {foo, foo2}
    ```
    4. Cleanup
    ```
k delete cm config
    ```
2. 