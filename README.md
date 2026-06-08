# Scadenza

![Status](https://img.shields.io/badge/status-in%20development-orange)

Privacy-first personal-document inbox for iPhone and iPad.

Scadenza captures or imports personal paperwork — bills, contracts, warranties,
tax notices, medical referrals, receipts — extracts structured fields entirely
on-device, and surfaces upcoming deadlines on a single home screen. No account.
No server. No data ever leaves the device.

> *Scadenza* (Italian) — deadline, expiry, due date.

---

## Architecture

Scadenza uses a modular clean architecture, with layer boundaries enforced by local Swift packages rather than folder conventions. This is arguably overkill for an app this size, but I chose to build it this way to practice the technique and make development more fun.

Layer overview:

| Package | Layer | Role |
|---|---|---|
| `Presentation` | Presentation | SwiftUI views and view models |
| `UseCase` | Domain | Business logic and use case definitions |
| `Entity` | Domain | Core data models and types |
| `Repository` | Domain | Data access protocols |
| `DataSource` | Data | Concrete data source implementations |

For the story behind why I organized the project this way, see my Medium article: **[Folders Aren't Boundaries: Enforcing Clean Architecture with Local Swift Packages](https://medium.com/@demetrius.ipatii/folders-arent-boundaries-enforcing-clean-architecture-with-local-swift-packages-f825bfb81e60)**.
