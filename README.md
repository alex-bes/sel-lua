SEL - Simple Expression Language
====================================

JS implementation of the [SEL(Simple Expression Language)](https://github.com/Logicify/sel)

# Syntax Examples

Simple interpolation

```
Hello, $username.
```

Invoke function

```
Uppercased value of test is $upper(test)
```

Invoke function with variable argument

```
Uppercased username is $upper($username)
```

Logical operations (conjunction)

```
$allOf(true, false, false)
```

More complex logical operations

```
$anyOf($not($myVar), $myVar)
```

# TODO
 - Default context (default handlers library)
 - Tests
 - Docs
 - Publish to luarocks

# Usage

To be added soon.

Credits
-------
Alexander Beskrovny, Logicify (<http://logicify.com/>)