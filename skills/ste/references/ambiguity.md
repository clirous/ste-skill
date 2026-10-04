# Checking requirements so the implementer does not guess

The goal is to find places where two implementers could build two different behaviors. Do not turn a brainstorm into a full specification too early; clarify only as far as the current decision needs.

## Checklist by topic

| What must be clear | Question to resolve, if relevant |
|---|---|
| Actor and permission | Who may do it? Within which organization, branch or record? |
| Trigger and action | When does it run? What changes? What result does the user see? |
| Conditions and exceptions | Are conditions joined by AND or OR? What happens when a condition fails? |
| Values and time | Which threshold, unit and time zone? Are the boundary values included? |
| States and terms | Does one name have several meanings? Which state may change to which? |
| Data and errors | Which source is authoritative? What happens when data is missing or invalid, or a service fails? |
| Repeats and concurrency | If an action repeats, or two people act at the same time, what is the expected result? |
| Done | Which scenario proves it works? Which failure cases must be tested? |

Use the rows that fit the task. Do not add concurrency, time zones or new mechanisms to every requirement just to complete the checklist.

## Handling a finding

1. Point to the exact sentence or place in the source and state the two possible readings.
2. State the real difference in behavior; drop wording debates that do not affect the meaning.
3. Read existing code, docs or tests if they can settle it. Separate the current behavior from the new behavior the owner wants.
4. If the source is clear, fix the wording when allowed and cite the source. If the source conflicts or a business decision is missing, ask about the point that decides the behavior; do not pick an answer for the owner.
5. In a draft that is not decided yet, mark the points that need a decision. Do not turn a placeholder into an approved acceptance criterion, and do not call a plan ready to code while a blocking decision is still missing.

## Examples, not default requirements

"Do not allow overlapping bookings" does not say whether overlap means the same customer, the same staff member or the same room, or whether cancelled bookings count. Do not decide on "same therapist" for the owner, and do not treat two bookings that only touch at the edge as overlapping. Look for the project rule or ask the owner.

"Proposal: reduce the timeout from 30s to 10s if the trial passes" must keep the word "proposal", both values and the trial condition. Do not rewrite it as "The timeout is 10s".

"The service may be slow when the connection drops" does not mean "The service will be slow". A shorter sentence that changes the certainty is wrong.
