<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# StateMachine

**Extends:** [Node](../Node)

## Description

## Property Descriptions

### state\_history

```gdscript
var state_history
```

an array of strings containing the past few states. This list does not include the current state.

### possible\_states

```gdscript
var possible_states
```

an array of strings containing the name of every possible state

### selected\_state

```gdscript
var selected_state: State
```

a refernce to whatever state is currently active

### starting\_state

```gdscript
export var starting_state = ""
```

a path to the starting state node. This must be set before `_ready()` is called to prevent the state machine from breaking.

### output\_changes

```gdscript
export var output_changes = false
```

whether state changes should be outputted to the debug console

### max\_state\_history\_length

```gdscript
export var max_state_history_length = 20
```

the maximum length the state_history can be

### parent

```gdscript
var parent
```

a reference to the state machine's parent

## Method Descriptions

### change\_state

```gdscript
func change_state(new_state: String, enter_args: Array, exit_args: Array) -> bool
```

changes the state to new_state. The enter_args array will be passed into the new state's _enter() function, while the exit_args array will be passed into the old state's _exit() function. Both enter args and exit args default to empty arrays.

note: state history is updated before the new state's enter function is called but after the current state's exit function is called.
note: the old state's exit function is run before the new state's enter function
new_state - the state that should be entered into
enter_args - any agruments that should be passed into the new state's _enter() method
exit_args - any arguments that should be passed intot he old state's _exit() method

### process\_states

```gdscript
func process_states(delta)
```

tells the state machine to process all of the states. Runs the state's game_logic before running its transfer_logic.

### get\_state

```gdscript
func get_state(state_name: String) -> State
```

gets a reference to a state
state_name - the name of the state as a string

## Signals

- signal state_changed(old_state, new_state): emitted whenever a state is changed
- signal game_logic_finished(): emitted whenever the state finishes running its game_logic function
- signal transfer_logic_finished(): emitted whenever state finishes running its transfer logic
