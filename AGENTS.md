# Agent Instructions for dotfiles

## Beans Task Tracking

**CRITICAL**: Before doing anything else, run `beans prime` and follow its instructions.

This project uses **Beans** for task management. Always:
- Create a bean before starting work
- Mark beans as `in-progress` when working
- Update bean checklists as you complete items
- Mark beans as `completed` when done
- Include bean files in commits with related code changes

When asked what to work on, query for actionable beans:

```bash
beans query '{ beans(filter: { excludeStatus: ["completed", "scrapped",
"draft"], isBlocked: false }) { id title status type priority } }'
```
