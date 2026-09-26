# HyperFrames Student Kit

Nate Herk's reusable video-editing kit for **Codex and Claude Code**.
Bring your own footage. Cut dead air, review mistakes, plan the story, and build
motion graphics with HyperFrames and GSAP.

## About this copy

This repository is a trimmed copy of
[nateherkai/hyperframes-student-kit](https://github.com/nateherkai/hyperframes-student-kit)
at commit `ec112ff`. It keeps every skill, script, test, style-library card, scene
template, and the synthetic starter. It leaves out the following:

- `video-projects/`: the 12 teaching projects, about 287 MB. They are gitignored here
  anyway, so your own projects stay local.
- `examples/showcase/` and `docs/images/`: the finished example videos and their stills.
- `assets/` and `DESIGN.ais-example.md`: AIS brand material that the upstream
  LICENSE says is not licensed for reuse.
- `docs/superpowers/`: plans for the excluded `linear-promo-30s` project.

To see the finished examples, open the upstream README. The `short-form-video` skill
mentions `may-shorts-18/19` projects. Those are not in this copy. For new reels,
use `short-form-edit`.

### Claude Code on the web

`.claude/hooks/session-start.sh` runs when each cloud session starts. It installs
FFmpeg/ffprobe, runs `npm install`, and downloads the Chrome Headless Shell build
that HyperFrames pins. A session starts ready to lint, preview, and render. The
hook exits immediately on local machines. There, follow **Install** below.

## What's included

- **15 skills**, mirrored for both assistants, with their helper scripts and references.
- **406 draft motion-graphics cards** across two styles, with manifests, CSS tokens, and editable slots.
- **Two scene templates:** dark graph paper and a left glass popout.
- Transcription, silence cutting, mistake detection, reviewed cut rendering,
  transcript retiming, EDL review, beat-sync validation, and preflight tools.
- **Short-form editing:** reels, YouTube Shorts, hook and payoff planning, precise captions, moving B-roll, and audio review.
- A synthetic starter composition and editing fixture that need no footage or API key.

## Tools and optional services

**Nate uses ElevenLabs Scribe to transcribe and Kie.ai to generate videos and
image assets.** Bring your own API keys and credits when using those services.
You can ask the assistant to use OpenAI Whisper or local Whisper instead, or
supply an existing word-level transcript. Generated assets are optional.

The local starter needs no paid transcription or generation API. See the
[tools, accounts, and API-key guide](docs/TOOLS-AND-API-KEYS.md) for required tools,
optional services, setup details, and prompts you can copy.

## Install

Install Node.js **22 or newer**, Git, FFmpeg (including ffprobe), and Chrome or
Chromium. Make `node`, `ffmpeg`, and `ffprobe` available in your terminal.
Then run these commands in PowerShell, macOS Terminal, or a Linux shell:

```sh
git clone https://github.com/Harsh-2293/videoEditing.git
cd videoEditing
npm ci
npm run setup
npm test
```

Setup checks the tools and creates `.env` only if it is absent. Add only the keys
for services you choose. The included transcription helper uses ElevenLabs;
Whisper and Kie.ai integrations need the setup described in the
[tools guide](docs/TOOLS-AND-API-KEYS.md). [Setup and troubleshooting](docs/SETUP.md).

## Render your first example

```sh
npm run demo
cd video-projects/demo
npx hyperframes lint
npx hyperframes preview
```

Scrub the eight-second animation in Studio. After reviewing it, stop the preview
with Ctrl+C, then render:

```sh
npx hyperframes render --quality draft --output renders/demo.mp4
```

The demo uses local GSAP. HyperFrames may download and cache its font substitutions on the first render. It has no voiceover. The separate
[synthetic transcript](examples/editing/source.json) exercises the cutting tools;
it is fictional test data, not a transcript of the title animation.

## Edit your footage

Open this repository folder in Codex or Claude Code and say:

> Use edit-video to edit my recording at [local path]. Keep my examples and core
> lessons. Tighten dead air, show me the proposed mistake cuts, and use the dark
> graph-paper style with occasional glass cards. Produce a reviewed draft.

Codex: `$edit-video`. Claude Code: `/edit-video`. For a single operation use
`cut-silences`, `cut-mistakes`, `video-storytelling`, or `style-library`.
See the [step-by-step workflow](docs/WORKFLOW.md), [prompt recipes](docs/PROMPTS.md),
and [storytelling workbook](docs/STORYTELLING-WORKBOOK.md).

## Create a reel or YouTube Short

> Use short-form-edit to turn my recording at [local path] into a 9:16 reel.
> Build a truthful hook and payoff, preserve my meaning, tighten mistakes, and
> add precise captions, purposeful moving footage, and sound design. Prepare
> a draft for review. Use my existing footage before proposing generated assets.

Codex: `$short-form-edit`. Claude Code: `/short-form-edit`.
The skill includes planning references and validators for caption timing, source
mapping, scene coverage, and footage reuse. It is an agent-guided workflow;
review the actual motion and audio before publishing.
[Short-form walkthrough and validation commands](docs/SHORT-FORM.md).

## Make a motion-design showreel

> Use motion-showreel to make a 15-second showreel for [brand]. Study my reference
> reel at [local path] if I give one. Pick one motif that transforms through every
> chapter, cut on the music's beat grid, and end on the logo. Show me the storyboard
> and beat sheet before building, and confirm before any paid music or asset generation.

Codex: `$motion-showreel`. Claude Code: `/motion-showreel`.
The skill includes a measured breakdown of the reel it was built from, a chapter
technique library, a HUD template, and Node tools to analyze a reference video,
measure a music take's beat grid, splice it onto the cut grid, and premix sound effects.

## Explore and customize

| Resource | Start here |
| --- | --- |
| Shared agent instructions | [AGENTS.md](AGENTS.md) |
| Motion and transition vocabulary | [MOTION_PHILOSOPHY.md](MOTION_PHILOSOPHY.md) |
| Card library and design tokens | [Library guide](style-library/GUIDE.md) |
| Searchable card metadata | [registry.json](style-library/registry.json) |
| Whole-scene templates | [Template guide](style-templates/README.md) |
| Codex setup and mirroring | [.codex/README.md](.codex/README.md) |
| Release checks and limits | [Verification](docs/VERIFICATION.md) |
| Third-party resources | [Notices](THIRD_PARTY_NOTICES.md) |

The cards are reusable **draft assets**. Test the cards you choose with your text
and footage. Library templates may load GSAP and Google Fonts from their public
CDNs; localize these dependencies when assembling a final project.

Folders you create under `video-projects/` and `raw-media/` are gitignored, and so
are media files and `.env`. Create a new project for each video with
`npm run new-video -- <slug>`.
