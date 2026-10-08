# Role stereotypes

Stereotypes are deliberate oversimplifications that help you think about a candidate's character. An object may blend several. It plays one role when its duties serve one purpose for the same clients, and two roles when it serves different clients for different purposes. If a candidate fits none, invent a stereotype of your own.

| Stereotype | Typically knows or does | Typically collaborates with | Questions to ask |
| --- | --- | --- | --- |
| Information holder | Knows facts and answers questions about them | Little, apart from acquiring its facts | Where do its facts come from? Is any fact derived? Does it persist? Is it cached? |
| Structurer | Maintains relationships between objects and answers questions about the group | The objects it structures | Who needs to know about whom, and why? What does it do for the group as a whole? |
| Service provider | Performs work or computation on request | Information holders for inputs, helpers for parts | Who has its inputs? Is it configurable? Which part is prone to change? |
| Coordinator | Reacts to events by passing work to others, deciding little | Whatever it delegates to | How does it come to know its workers? How does it learn of results? |
| Controller | Makes decisions and directs the actions of others | Holders for facts, workers for action | Who has the facts it decides on? How much of the action does it perform itself? |
| Interfacer | Transforms information and requests between parts | Objects on either side of the boundary | Which kind: user, external system, or internal boundary? What happens when the other side fails? |

## Notes

- Coordinator and controller differ by degree. A controller makes the decisions; a coordinator is told what to do and passes it on.
- Distinguish passive holders (just hold facts) from providers that also compute, check, or adjust what they hold. Providers make the system smarter.
- User interfacers rarely collaborate with the domain except to signal events. Internal interfacers (a facade or gatekeeper) show outsiders a limited view of a neighborhood. External interfacers wrap an outside system's interface and usually need conversion, connection management, and failure handling.
- A stereotype guides first duties: holders answer questions, providers handle requests, structurers manage relationships, interfacers translate, coordinators and controllers field events and direct work.
