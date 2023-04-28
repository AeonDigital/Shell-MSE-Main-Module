# 00 - Definitions

To describe a function in order to allow it to be correctly interpreted by
the "myShellEnv" and that its definitions are applied to validate the
parameters and also to help the user in its filling you must use an
associative array called "MSE_FUNCTION_MAN".

Below will be described the keys that must be used to make the correct
description of the resources available for your function.

- description
  Use this field to describe what the function does and what is expected
  behavior in special use cases.

- param
  This is a composite key.

  Since bash does not allow the use of nested arrays, we will use this key
  with a name that represents a one-dimensional array and that contains an
  associative array as its value but starting in 1.

  Thus, the first parameter will always be represented with its key being
  called "param.1" and its subproperties must compose its name as if it were
  the call of an object in a language that supports this type of resource.
  For example, to declare the name of the first parameter we will use the
  key "param.1.name" and for its description "param.1.description".
  Likewise,  for the second parameter we will use "param.2.name" and
  "param.2.description" respectively.

  The name of each of the properties that can be used in this way are
  described in the "parameters" section.

- return
  This is a composite key.

  Similar to "param" this key is described to represent a complex object.
  In this case a associative array with anothers subproperties.
  Check the "Return" section to know all properties to use with this.

- example
  This is a composite key.

  In this case the key is described to represent an unidimensional array.
  So, if you will use that, declare any example startin with "example.0" key,
  The second key as "example.1" and so on.