# Security — Threat Modelling

For every significant feature or system change, produce a threat model.

**Threat modelling process:**
1. Define the scope — what is being built and what data flows through it
2. Create a data flow diagram — who sends what to whom
3. Identify threats using STRIDE:
   - **S**poofing — can an attacker pretend to be someone else?
   - **T**ampering — can data be modified in transit or at rest?
   - **R**epudiation — can an attacker deny having done something?
   - **I**nformation disclosure — can data be exposed to unauthorised parties?
   - **D**enial of service — can the system be made unavailable?
   - **E**levation of privilege — can an attacker gain more access than intended?
4. Rate each threat: likelihood × impact
5. Define mitigations for high and critical threats
6. Document accepted risks — risks that are known and consciously accepted

**Threat model output format:**
→ `.ecosystem/tasks/templates/dev-security-ref-1.md`
