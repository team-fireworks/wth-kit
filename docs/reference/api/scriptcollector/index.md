<!--
    This file was automatically @generated using Welcome To Hell's `refgen`. 
    As changes may be overriden, this file should not be manually modified.
-->

# ScriptCollector

```luau
ScriptCollector = {
   new: () -> (),
   clone: (self: ScriptCollector) -> ScriptCollector,
   collectModuleScript: (self: ScriptCollector, instance: ModuleScript) -> (),
   collectInstance: (self: ScriptCollector, instance: Instance) -> (),
   collectInstanceAsync: (self: ScriptCollector, instance: Instance) -> Promise,
   collectInstancesAsync: (self: ScriptCollector, instances: { Instance }) -> Promise,
}
```

Collects mechanic implementations from module scripts for use in levels.

## API

{api}

