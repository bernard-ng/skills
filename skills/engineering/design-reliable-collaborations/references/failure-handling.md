# Failure handling

## Recovery strategies

| Strategy | What the provider does | Good when | Watch for |
| --- | --- | --- | --- |
| Inaction | Ignores a request it cannot perform | Nobody cares if it is skipped | The client is uninformed; use rarely. |
| Balk | Admits failure and tells the requester (exception, result, or flag) | The requester can try something else | Requesters must handle the failure path. |
| Guarded suspension | Waits until conditions allow, then proceeds | Waiting is cheap and bounded | Unbounded waits; deadlocks; hidden latency. |
| Provisional action | Pretends to do the work, commits only when success is certain | The request takes time or can be partly fulfilled | Extra state, a commit step, duplicate effects. |
| Alternative | Performs an acceptable substitute | A second resource or method exists | Overengineering; the substitute must be truly acceptable. |
| Escalate | Asks a person or higher authority to decide | The machine cannot judge | Delays; need an owner and a queue. |
| Rollback | Undoes the effects of a failed attempt | All-or-nothing results are required | Some effects cannot be undone. |
| Retry | Tries again after recovering | Success is likely later | Duplicate side effects; unbounded loops. |

Mixing strategies is common. Example: try, broadcast for an alternative, wait a bounded time, then give up and report.

## Designing exceptions

- Define few exception classes. Prefer one class with a code over twenty near-identical ones. Make separate classes only when handlers will react differently.
- Name an exception for what went wrong, not for who raised it.
- Recast low-level exceptions into higher-level ones whenever a boundary or abstraction level is crossed, keeping the original as inner detail.
- Put useful context in the exception: values that caused it, a readable message, and anything a handler needs to act.
- Handle exceptions as close to the problem as is sensible; be wary of long chains that make the flow hard to follow.
- Consider returning a result instead of raising when the requester must take responsibility, or when the language makes exceptions awkward.
- Record exception policies once (for recoverable and unrecoverable cases) and follow them, so behavior is predictable.

## Contracts

- A precondition obligates the client and benefits the provider. If it is not met, the provider is not bound to satisfy the request.
- A postcondition obligates the provider and benefits the client.
- A weak contract (strong preconditions, no postconditions) is lazy; a defensive one (nothing assumed, everything checked) is expensive. Pick the balance by trust level.
- Verifying postconditions is the hardest part when a provider uses many collaborators.

## Documenting

Draw one happy-path trace, then describe exceptions in a table or running commentary instead of redrawing. Show only one or two exceptions per diagram. Say which object handles an exception and which recasts it.

| Condition | Detected by | Handled by | Recovery | User sees |
| --- | --- | --- | --- | --- |
| (fill in per condition) | | | | |
