# State

**Extends:** [Node](../Node)

## Description
a base class for each state. Should be added as a child to state machine nodes to function properly.

## Property Descriptions

### machine

```gdscript
var machine
```

the parent state machine.
## Method Descriptions
### \_enter
```gdscript
func _enter(args := []) -> void:
```
a virtual method that runs whenever the state is entered
### \_exit
```gdscript
func _exit(args := []) -> void:
```
a virtual method that runs whenever the state is exited
### \_game_logic
```gdscript
func _game_logic(delta) -> void:
```
a virtual method that runs whenever the state machine's `process_states(delta)` method is called. The value for delta is the same as the one passed into the `process_states(delta)` method. It's recommended that this method is used for game logic, such as moving the entity using the state machine, rather than checking if transitioning to other states is necessary.
### \_transition\_logic
```gdscript
func _transition_logic(existing_states: Array) -> void:
```
a virtual method that is run whenever the parent machine's `process_states(delta)` method is called. It should be used to check if the state machine needs to transfer to a different state.
### \_can\_change
```gdscript
func _can_change() -> bool:
```
a virtual method that is run whenever the parent machine tries to enter into this state. If it returns false, the state transfer will be aborted. It just returns true by default.
### \_active\_input
```gdscript
func _active_input(event: InputEvent) -> void:
```
does the same thing as a node's default `input()` event, except it only runs when the state is active.
