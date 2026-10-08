# Pattern notes

Short, original summaries of when each pattern tends to help and what it costs. Use them to start a comparison, not to decide.

| Problem you see | Pattern to consider | What it does | Typical costs |
| --- | --- | --- | --- |
| Actions need undo, queuing, logging, or one per user gesture | **Command** | Turns an action into an object with a common "do" and optionally "undo". | Many small classes; commands must share assumptions; stateful undo needs care. |
| A decision depends on the kind of a request argument, and kinds keep being added | **Double dispatch** | The receiver asks the argument to continue with the receiver's kind, so each kind answers for itself. No type checks. | Adds a method per kind to each interface; new kinds touch several classes. |
| An object's behavior depends on a handful of discrete states and transitions | **State** | One object per state handles events and picks the next state. | Spreads behavior over many classes; assumes deterministic, discrete states; keeps decisions inside the control center. |
| Several interchangeable ways to do one job | **Strategy** | Moves the algorithm to a replaceable object that implements a shared role. | Clients may need to choose; one more object per variant; not worth it for one variant. |
| A fixed algorithm with a few steps that vary | **Template method** | The base class fixes the steps and calls hooks that subclasses fill in. | Ties variation to inheritance; the base class must be designed for extension. |
| Many objects talk to each other directly and are tightly coupled | **Mediator** | One object coordinates the group, so members know only the mediator. | The mediator can become a hub with too much knowledge. |
| Outsiders reach into many objects of a subsystem | **Facade** | One internal interfacer forwards requests to the right inside object. | Another layer; keep it simple or it turns into a controller. |
| A component has an interface you cannot change and do not want to leak | **Adapter** | Wrap it with the interface your design wants. | Translation code to maintain; hides capabilities you may need later. |
| Parts and wholes should be treated alike (a list of lists) | **Composite** | A shared role for leaf and composite; the composite forwards to its members. | Hard to restrict what composites may contain. |
| Many objects must learn about one object's changes | **Observer** | Subscribers register with a subject, which notifies them. | Notification storms, ordering surprises, hidden coupling by event. |
| Several knowledge sources contribute to a best answer | **Blackboard-style bidding** | A control object asks sources to bid on shared state and picks the best. | Several rounds; the control needs a clear stopping rule. |
| A place to put behavior that will grow later | **Placeholder** | An explicit, minimal object or class reserves a home for future duties. | Speculative; justify with an evidenced direction of growth. |

## Reading a pattern description

Check the problem, context, forces, solution, and consequences, in that order. If the forces differ from yours, the solution probably does not fit.

## Reminder

Generic pattern names are not a design. After picking one, say what each of your objects does in it and which duties moved.
