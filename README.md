# CreatorFlow

CreatorFlow is a local-first creator workspace built with Next.js, React, TypeScript, and Tailwind CSS. It includes video idea prompts, script outlines, title variations, thumbnail concepts, saved projects, and a content calendar.

## What works in this package

- A responsive dark-themed creator workspace with navigation for the four tools, saved projects, calendar, and settings.
- Free local-template generation for ideas, scripts, titles, and thumbnail plans. This runs on your own computer and does not require an AI API key, tokens, or an external AI call. It is template-based output, **not a generative AI model**.
- Optional server-side OpenAI generation if you provide your own API key. API keys are never intentionally sent to browser code. API usage may cost money depending on your provider/account.
- Browser-local project saving, project search/copy/delete, and content calendar create/delete. Local data stays in the browser profile on that device.
- Zod validation on generation requests, Supabase SQL schema/helpers for future cloud auth/data, error/loading states, and automated unit tests for local generation output.
- Pricing preview only; no fake purchases or plan upgrades.

## Important status

This is a usable local-first app, **not a production SaaS deployment**. It does not currently provide completed sign-up/login screens, cross-device cloud persistence, server-enforced usage quotas, real payments, or a production security review. The Supabase SQL/schema is groundwork and should not be treated as a complete production auth implementation. Do not deploy the demo configuration as a public multi-user service without completing those pieces.

## Requirements

- Node.js 20 or newer
- npm

## Install and run without API tokens

1. Extract the ZIP. Open the `creatorflow` folder in a terminal.
2. Install dependencies:

   ```bash
   npm install
   ```

3. Copy the environment example. On Windows PowerShell:

   ```powershell
   Copy-Item .env.example .env.local
   ```

   On macOS/Linux:

   ```bash
   cp .env.example .env.local
   ```

4. Leave `NEXT_PUBLIC_DEMO_MODE=true` and leave `OPENAI_API_KEY` blank to use free local templates. `NEXT_PUBLIC_SITE_URL` defaults to `http://localhost:3000`; set it to your actual public site URL when deploying so the sitemap uses the right domain.
5. Start the app:

   ```bash
   npm run dev
   ```

6. Open http://localhost:3000.

## Optional: use OpenAI for model-powered generation

Add your own key to `.env.local`:

```env
OPENAI_API_KEY=your_key_here
OPENAI_MODEL=gpt-4.1-mini
NEXT_PUBLIC_DEMO_MODE=true
```

Restart the development server after editing the file. Keep the key server-side. Provider usage may cost money and is not included in this source ZIP. When the key is set, the app uses OpenAI instead of local templates.

## Optional: Supabase groundwork

The `supabase/schema.sql` file and helper modules are starter materials only. Before enabling any public authenticated mode, implement and test signup/login/logout, route protection, per-user project/calendar CRUD, row-level security, server-side usage limits, rate limiting, account export/deletion, and automated security checks. Set `NEXT_PUBLIC_DEMO_MODE=false` only after those parts have actually been implemented and tested.

## Verification commands

```bash
npm run typecheck
npm run lint
npm test
npm run build
```

Run these commands after installation. A successful local build does not by itself prove that a future production deployment, AI provider, or Supabase project is correctly configured.

## Main file layout

```text
creatorflow/
  app/
    api/generate/route.ts   # validated generation API; local mode or optional OpenAI
    page.tsx                # workspace interface and local persistence flows
    globals.css             # dark theme and layout utilities
    layout.tsx              # shared root layout/metadata
    error.tsx               # app-level error fallback
    loading.tsx             # navigation/loading fallback
    not-found.tsx            # 404 page
    icon.svg                 # app icon
  lib/
    local-generator.ts       # free template-based generation
    schemas.ts               # request validation
    config.ts                # plan/tool labels
    supabase/                # optional integration groundwork
  tests/                     # automated generator tests and manual checklist
  supabase/schema.sql        # database schema/RLS groundwork
  .env.example
  package.json
```
