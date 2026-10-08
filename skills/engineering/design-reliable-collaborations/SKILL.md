---
name: design-reliable-collaborations
description: Use when object requests cross trust or system boundaries, a workflow has retries, timeouts, or partial failure, errors are only logged and swallowed, exceptions are thrown without a clear handler, validation is duplicated everywhere, or the user asks "how should we handle failure", "what if this call fails", or "design the error handling". Apply automatically when a collaboration needs explicit detection, recovery, ownership, and outcome guarantees, scaled to what failure costs.
---

# Design reliable collaborations

Reliability is a property of collaborations, not of single objects. A system is as reliable as its weakest link, so design it piece by piece with the cost of failure in mind. Trust here means confidence in a collaborator's contract; it never waives required authorization or security validation.

## Procedure

1. **Gauge the consequences.** Rate failure by what it costs: comfort, discretionary money, essential money, or life. Spend design effort in proportion. Software that runs unattended, glues systems together, plugs in without human help, or ships as a consumer product also needs more.
2. **Mark trust regions.** Objects in one neighborhood or layer can collaborate collegially. Edges (user interface, external systems, untrusted callers, vendor libraries, different teams) need care. Decide, for each collaboration, whether the sender trusts the receiver and whether the receiver trusts requests.
3. **Separate errors from exceptions.** Exceptions are unlikely but handleable conditions (a mistyped password, missing stock, a dropped connection): put your energy here. Errors are things that are plainly wrong (bad logic, corrupt data, broken hardware): unless the system must be fault tolerant, do not design for recovery; fail visibly and cleanly.
4. **List the exceptions for one slice.** Pick one collaboration or unhappy path. Brainstorm what can go wrong: users acting incorrectly, invalid, untimely or unauthorized requests, timeouts, dropped communication, unavailable equipment, bad data, performance failures. Mark the common ones, put question marks on unknowns, and note what you will not cover. Use cases rarely cover this; expect to find more as you dig.
5. **Distinguish levels.** A use-case exception means the actor or system cannot continue its course; an object exception means one object cannot fulfill one request. One use-case step can hide thousands of requests, so they do not map one to one.
6. **Assign ownership.** For each condition decide who validates information from untrusted sources, who detects the condition, how it is communicated (raised exception, returned result, or a queryable state), who recovers, how, who recovers if that fails, and who recasts the condition into higher-level terms. Handlers can be the original requester, a controller or coordinator, or an interfacer that owns an outside system. A logged-and-rethrown exception has not been handled.
7. **Choose the recovery strategy.** See [failure handling](references/failure-handling.md): inaction, balk, guarded suspension, provisional action, alternative, escalate to a person, rollback, retry. Combine them when no single one is enough, and bound any waiting or retrying. Weigh duplicate effects and partial state before you retry.
8. **Decide who checks.** If clients must check first, can they check easily, does the state stay valid until the call, is checking costly, and does checking have side effects? If the provider takes more responsibility, can pauses be tolerated, can missing resources be obtained, and is failure detectable? In concurrent systems, check and reserve in one request.
9. **State the contract.** What the client must provide (preconditions), what the provider guarantees (postconditions), and what stays true throughout (invariants). Write formal contracts for collaborations that cross trust boundaries, especially with external systems; skip them for small trusted ones.
10. **Review for the common mistakes.** Forgetting that handling can itself fail, partial mapping between error codes and exceptions, letting exceptions reach clients that are not prepared, treating logging as handling, duplicated or unnecessary checks, and embellished recovery that costs more than it saves.

## Guardrails

Do not make every object paranoid; redundant checking is slow, confusing, and gives false confidence. Do not hide failures in a status that no one reads. Do not catch what you cannot handle. Do not change the contract silently.

## Check

Every handled failure has an owner and a resulting state. Clients can distinguish success, recoverable failure, and terminal failure. Failure paths have been traced end to end (see `trace-object-collaborations`). Out-of-scope failures and unresolved business policy are named.
