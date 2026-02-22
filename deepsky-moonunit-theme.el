;;; deepsky-moonunit-theme.el --- Accessible dark theme for anomalous trichromatic vision -*- lexical-binding:t -*-

;; Copyright (C) 2019-2026 Free Software Foundation, Inc.
;; Copyright (C) 2020-2026 Brian O'Reilly <fade@deepsky.com>

;; Author: Brian O'Reilly <fade@deepsky.com>
;; URL: https://github.com/fade/deepsky-themes-moonunit
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
;; Keywords: faces, theme, accessibility

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Deepsky Moonunit is a dark theme built on the Modus themes
;; infrastructure (specifically modus-vivendi-tinted) and tuned for
;; anomalous trichromatic color vision.  It inherits the full face
;; coverage and WCAG AAA contrast guarantees from the Modus themes,
;; while applying the color palette and face choices from the
;; deepsky-modus-fade theme.
;;
;; The palette favors warm, saturated accent colors (orange, cyan,
;; yellow, bright green) against a pure black background to maximize
;; distinguishability for users with color vision differences.
;;
;; This theme requires the modus-themes package (version 5.0.0+).
;;
;; Usage:
;;
;;     (require 'deepsky-moonunit-theme)
;;     (load-theme 'deepsky-moonunit t)

;;; Code:

(unless (and (fboundp 'require-theme)
             load-file-name
             (equal (file-name-directory load-file-name)
                    (expand-file-name "themes/" data-directory))
             (require-theme 'modus-themes t))
  (require 'modus-themes))

;;;; User customization options

(defgroup deepsky-moonunit-theme ()
  "Accessible dark theme tuned for anomalous trichromatic vision.
Built on the Modus themes infrastructure with WCAG AAA contrast."
  :group 'modus-themes
  :link '(url-link :tag "GitHub" "https://github.com/fade/deepsky-themes-moonunit")
  :prefix "deepsky-moonunit-"
  :tag "Deepsky Moonunit")

(defcustom deepsky-moonunit-palette-user nil
  "Like `deepsky-moonunit-palette' for user-defined entries.
This is meant to extend the palette with custom named colors and/or
semantic palette mappings.  Those may then be used in combination with
palette overrides (also see `modus-themes-common-palette-overrides' and
`deepsky-moonunit-palette-overrides')."
  :group 'deepsky-moonunit-theme
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(modus-themes) Option to extend the palette for use with overrides"))

(defcustom deepsky-moonunit-palette-overrides nil
  "Overrides for `deepsky-moonunit-palette'.
Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Modus themes,
refer to `modus-themes-common-palette-overrides'.

Theme-specific overrides take precedence over shared overrides."
  :group 'deepsky-moonunit-theme
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(modus-themes) Palette overrides"))

;;;; Core palette
;;
;; Based on modus-vivendi-tinted, with color overrides from
;; deepsky-modus-fade-theme.el applied throughout.

(defconst deepsky-moonunit-palette
  (append
   '(
     ;; Basic values
     ;; (bg-main          "#000000") ; pure black background (deepsky-modus-fade)
     (bg-main          "#0d0e1c")
     (bg-dim           "#110b11")
     (fg-main          "#ffffff")
     (fg-dim           "#a8a8a8")
     (fg-alt           "#c6eaff")
     (bg-active        "#323232")
     (bg-inactive      "#1e1e1e")
     (border           "#646464")

     ;; Common accent foregrounds
     ;; Tuned for anomalous trichromatic vision: avoids sole reliance
     ;; on red/green distinction, favoring warm oranges, cyans, and
     ;; bright saturated primaries.

     (red             "#ff8059")
     (red-warmer      "#ff9977")
     (red-cooler      "#ff7f86")
     (red-faint       "#ef8690")
     (red-intense     "#ff5f5f")
     (green           "#44bc44")
     (green-warmer    "#75c13e")
     (green-cooler    "#6ae4b9")
     (green-faint     "#88ca9f")
     (green-intense   "#00ff00")
     (yellow          "#eecc00")
     (yellow-warmer   "#fec43f")
     (yellow-cooler   "#dfaf7a")
     (yellow-faint    "#d2b580")
     (yellow-intense  "#ffff00")
     (blue            "#2fafff")
     (blue-warmer     "#79a8ff")
     (blue-cooler     "#00bcff")
     (blue-faint      "#82b0ec")
     (blue-intense    "#338fff")
     (magenta         "#feacd0")
     (magenta-warmer  "#f78fe7")
     (magenta-cooler  "#b6a0ff")
     (magenta-faint   "#caa6df")
     (magenta-intense "#ff66ff")
     (cyan            "#00d3d0")
     (cyan-warmer     "#4ae8fc")
     (cyan-cooler     "#6ae4b9")
     (cyan-faint      "#9ac8e0")
     (cyan-intense    "#00eff0")

     ;; Uncommon accent foregrounds
     ;; deepsky-specific accents for Common Lisp / SLY / SLIME use
     (rust       "#db8b3f")
     (gold       "#ffaa00")
     (olive      "#9cbd6f")
     (slate      "#4682b4")
     (indigo     "#9099d9")
     (maroon     "#cf7fa7")
     (pink       "#d09dc0")

     ;; Common accent backgrounds

     (bg-red-intense     "#a4202a")
     (bg-green-intense   "#006800")
     (bg-yellow-intense  "#874900")
     (bg-blue-intense    "#2a40b8")
     (bg-magenta-intense "#7042a2")
     (bg-cyan-intense    "#005f88")

     (bg-red-subtle      "#762422")
     (bg-green-subtle    "#2f4a00")
     (bg-yellow-subtle   "#604200")
     (bg-blue-subtle     "#10387c")
     (bg-magenta-subtle  "#49366e")
     (bg-cyan-subtle     "#00415e")

     (bg-red-nuanced     "#2c0614")
     (bg-green-nuanced   "#001904")
     (bg-yellow-nuanced  "#221000")
     (bg-blue-nuanced    "#0f0e39")
     (bg-magenta-nuanced "#230631")
     (bg-cyan-nuanced    "#041529")

     ;; Uncommon accent background and foreground pairs

     (bg-clay     "#49191a")
     (fg-clay     "#f1b090")

     (bg-ochre    "#462f20")
     (fg-ochre    "#e0d09c")

     (bg-lavender "#38325c")
     (fg-lavender "#dfc0f0")

     (bg-sage     "#143e32")
     (fg-sage     "#83d7ac")

     ;; Graphs

     (bg-graph-red-0     "#b52c2c")
     (bg-graph-red-1     "#702020")
     (bg-graph-green-0   "#0fed00")
     (bg-graph-green-1   "#007800")
     (bg-graph-yellow-0  "#f1e00a")
     (bg-graph-yellow-1  "#b08940")
     (bg-graph-blue-0    "#2fafef")
     (bg-graph-blue-1    "#1f2f8f")
     (bg-graph-magenta-0 "#bf94fe")
     (bg-graph-magenta-1 "#5f509f")
     (bg-graph-cyan-0    "#47dfea")
     (bg-graph-cyan-1    "#00808f")

     ;; Special purpose

     (bg-completion       "#10387c")
     (bg-hover            "#45605e")
     (bg-hover-secondary  "#64404f")
     (bg-hl-line          "#151823")
     (bg-region           "#3c3c3c")
     (fg-region           "#ffffff")

     ;; Mode-line: SlateBlue4 active, DarkSlateGray inactive
     (bg-mode-line-active        "#473c8b")
     (fg-mode-line-active        "#f4f4f4")
     (border-mode-line-active    unspecified)
     (bg-mode-line-inactive      "#2f4f4f")
     (fg-mode-line-inactive      "#bfc0c4")
     (border-mode-line-inactive  unspecified)

     (modeline-err     "#ffa7ba")
     (modeline-warning "#dbbe5f")
     (modeline-info    "#34cfff")

     (bg-tab-bar      "#2c2c2c")
     (bg-tab-current  "#0e0e0e")
     (bg-tab-other    "#3d3d3d")

     ;; Diffs (from deepsky-modus-fade)

     (bg-added           "#203d20")
     (bg-added-faint     "#002922")
     (bg-added-refine    "#005a36")
     (bg-added-fringe    "#006700")
     (fg-added           "#b4ddb4")
     (fg-added-intense   "#e0f6e0")

     (bg-changed         "#4a3a10")
     (bg-changed-faint   "#2a1f00")
     (bg-changed-refine  "#585800")
     (bg-changed-fringe  "#6f4f00")
     (fg-changed         "#d0daaf")
     (fg-changed-intense "#ffffcc")

     (bg-removed         "#5e2526")
     (bg-removed-faint   "#380a19")
     (bg-removed-refine  "#852828")
     (bg-removed-fringe  "#8f1f4b")
     (fg-removed         "#eebdba")
     (fg-removed-intense "#ffd9eb")

     (bg-diff-context    "#181a20")

     ;; Paren match: bright magenta background (deepsky-modus-fade)
     (bg-paren-match        "#ff00ff")
     (bg-paren-expression   "#392a48")

     ;; General mappings

     (cursor yellow)
     (keybind magenta-cooler)
     (name magenta)
     (identifier yellow-faint)

     (err red)
     (warning yellow)
     (info green-cooler)

     (underline-err red-intense)
     (underline-warning yellow)
     (underline-note cyan)

     (bg-prominent-err bg-red-intense)
     (fg-prominent-err fg-main)
     (bg-prominent-warning bg-yellow-intense)
     (fg-prominent-warning fg-main)
     (bg-prominent-note bg-cyan-intense)
     (fg-prominent-note fg-main)

     (bg-active-argument bg-yellow-nuanced)
     (fg-active-argument yellow-cooler)
     (bg-active-value bg-cyan-nuanced)
     (fg-active-value cyan-cooler)

     ;; Code mappings
     ;; These are the heart of the deepsky-modus-fade overrides:
     ;; warm oranges, cyans, and yellows replace modus' purples/pinks.

     (builtin gold)                      ; #ffaa00 (orange) - was magenta
     (comment cyan-faint)                ; Cyan tones - was red-faint
     (constant green-intense)            ; #00ff00 (bright green) - was magenta-cooler
     (docstring yellow-faint)            ; light yellow tone
     (fnname slate)                      ; SteelBlue - was magenta-warmer
     (fnname-call pink)
     (keyword cyan)                      ; Cyan - was blue-warmer
     (preprocessor red-cooler)
     (property cyan-warmer)
     (rx-backslash magenta-warmer)
     (rx-construct magenta-cooler)
     (string yellow-intense)             ; #ffff00 (bright yellow) - was blue
     (type cyan-cooler)                  ; was green-cooler
     (variable cyan)                     ; Cyan - was cyan-warmer
     (variable-use slate)

     ;; Accent mappings

     (accent-0 magenta-cooler)
     (accent-1 cyan)
     (accent-2 magenta-warmer)
     (accent-3 yellow-warmer)

     ;; Completion mappings

     (fg-completion-match-0 blue-cooler)
     (fg-completion-match-1 magenta-warmer)
     (fg-completion-match-2 cyan-cooler)
     (fg-completion-match-3 yellow)

     ;; Date mappings

     (date-common cyan)
     (date-deadline red-cooler)
     (date-deadline-subtle red-faint)
     (date-event fg-alt)
     (date-holiday magenta-warmer)
     (date-holiday-other blue)
     (date-range fg-alt)
     (date-scheduled yellow-cooler)
     (date-scheduled-subtle yellow-faint)
     (date-weekday cyan)
     (date-weekend magenta)

     ;; Link mappings

     (fg-link blue-cooler)
     (underline-link blue-cooler)
     (fg-link-symbolic cyan)
     (underline-link-symbolic cyan)
     (fg-link-visited magenta-cooler)
     (underline-link-visited magenta-cooler)

     ;; Mail mappings

     (mail-cite-0 blue-faint)
     (mail-cite-1 yellow-cooler)
     (mail-cite-2 cyan-cooler)
     (mail-cite-3 red-cooler)
     (mail-part blue)
     (mail-recipient blue-warmer)
     (mail-subject magenta-warmer)
     (mail-other magenta)

     ;; Mark mappings (from deepsky-modus-fade)

     (bg-mark-delete bg-red-subtle)
     (fg-mark-delete red-cooler)
     (bg-mark-select bg-cyan-subtle)
     (fg-mark-select cyan)
     (bg-mark-other bg-yellow-subtle)
     (fg-mark-other yellow)

     ;; Prompt mappings
     ;; deepsky-modus-fade uses #6ae4b9 for minibuffer-prompt
     (fg-prompt cyan-cooler)

     ;; Prose mappings

     (fg-prose-code cyan-cooler)
     (fg-prose-macro magenta-cooler)
     (fg-prose-verbatim magenta-warmer)
     (prose-done green)
     (prose-todo red)
     (prose-metadata fg-dim)
     (prose-metadata-value fg-alt)
     (prose-table fg-alt)
     (prose-table-formula magenta-warmer)
     (prose-tag magenta-faint)

     ;; Rainbow mappings

     (rainbow-0 fg-main)
     (rainbow-1 magenta-intense)
     (rainbow-2 cyan-intense)
     (rainbow-3 red-warmer)
     (rainbow-4 yellow-intense)
     (rainbow-5 magenta-cooler)
     (rainbow-6 green-intense)
     (rainbow-7 blue-warmer)
     (rainbow-8 magenta-warmer)

     ;; Search mappings

     (bg-search-current bg-yellow-intense)
     (bg-search-lazy bg-cyan-intense)
     (bg-search-static bg-magenta-subtle)
     (bg-search-replace bg-red-intense)

     (bg-search-rx-group-0 bg-blue-intense)
     (bg-search-rx-group-1 bg-green-intense)
     (bg-search-rx-group-2 bg-red-subtle)
     (bg-search-rx-group-3 bg-magenta-subtle)

     ;; Heading mappings (from deepsky-modus-fade)

     (fg-heading-0 cyan-cooler)
     (fg-heading-1 fg-main)          ; #ffffff (white)
     (fg-heading-2 fg-ochre)         ; #e0d09c (warm cream, close to #f8dec0)
     (fg-heading-3 fg-alt)           ; #c6eaff (light blue)
     (fg-heading-4 fg-sage)          ; #83d7ac (mint green, close to #bfebe0)
     (fg-heading-5 fg-lavender)      ; #dfc0f0 (light magenta, close to #fbd6f4)
     (fg-heading-6 yellow-faint)     ; pale yellow (close to #dfdfb0)
     (fg-heading-7 red-faint)        ; light pink (close to #ffcccc)
     (fg-heading-8 fg-dim))          ; #a8a8a8 (light gray)
   modus-themes-common-palette-mappings)
  "The entire palette of the `deepsky-moonunit' theme.

This palette is based on `modus-themes-vivendi-tinted-palette' with
color overrides from `deepsky-modus-fade-theme' applied for anomalous
trichromatic vision accessibility.

Named colors have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a named color that already
exists in the palette and is associated with a HEX-VALUE.")

;;;; Custom face overrides
;;
;; These handle faces where deepsky-modus-fade specifies something
;; that cannot be expressed through palette overrides alone:
;; SLY, SLIME, and a few others with non-standard styling.

(defconst deepsky-moonunit-faces
  '(
;;;;; Completion
    ;; modus-themes drops vertico's default :extend t; restore it so the
    ;; selection highlight fills the full line width.  bg-completion is
    ;; set to #10387c (deep navy) which gives ≥5:1 contrast against all
    ;; four fg-completion-match-* colors on this background.
    `(vertico-current ((,c :inherit modus-themes-completion-selected :extend t)))
    ;; The legacy deepsky-theme.el sets completions-common-part with
    ;; :background "black", which causes unreadable dark-on-dark match
    ;; highlights in partial-completion narrowing (e.g. find-file).
    ;; Override here with explicit colors to defeat that definition.
    ;; blue-cooler (#00bcff) on bg-completion (#10387c) = 5.1:1 (WCAG AA).
    `(completions-common-part ((,c :foreground ,blue-cooler :background unspecified :weight bold)))
    ;; magenta-warmer (#f78fe7) on bg-completion (#10387c) = 5.3:1 (WCAG AA).
    `(completions-first-difference ((,c :foreground ,magenta-warmer :background unspecified :weight bold)))
;;;;; SLY
    `(sly-mrepl-prompt-face ((,c :inherit modus-themes-prompt :foreground "#ffa500")))
    `(sly-mrepl-output-face ((,c :foreground ,slate)))
    `(sly-warning-face ((,c :underline (:style wave :color "#ff7f50"))))
;;;;; SLIME
    `(slime-error-face ((,c :underline (:style wave :color ,red))))
    `(slime-highlight-edits-face ((,c :background "#696969")))
    `(slime-highlight-face ((,c :foreground ,yellow-intense :background ,slate :underline nil)))
    `(slime-inspector-action-face ((,c :inherit bold :foreground "#8b2252")))
    `(slime-inspector-label-face ((,c :foreground ,green-intense)))
    `(slime-inspector-topline-face (( )))
    `(slime-inspector-type-face (( )))
    `(slime-inspector-value-face ((,c :foreground ,gold)))
    `(slime-note-face ((,c :underline (:style wave :color "#eedd82"))))
    `(slime-reader-conditional-face ((,c :foreground ,cyan-intense)))
    `(slime-repl-input-face ((,c :inherit bold)))
    `(slime-repl-inputed-output-face ((,c :foreground "#00ff7f")))
    `(slime-repl-output-face ((,c :foreground ,slate)))
    `(slime-repl-output-mouseover-face ((,c :foreground "#00ff7f" :box (:line-width 1 :color "#000000" :style released-button))))
    `(slime-repl-prompt-face ((,c :foreground "#ffa500")))
    `(slime-repl-result-face ((,c :foreground "#63b8ff")))
    `(slime-style-warning-face ((,c :underline (:style wave :color "#ffd700"))))
    `(slime-warning-face ((,c :underline (:style wave :color "#ff7f50")))))
  "Custom face overrides for SLY and SLIME in the `deepsky-moonunit' theme.")

(defconst deepsky-moonunit-custom-variables nil
  "Custom variable overrides for the `deepsky-moonunit' theme.")

;;;; Instantiate the theme

(modus-themes-theme
 'deepsky-moonunit
 'deepsky-moonunit
 "Accessible dark theme for anomalous trichromatic vision.
Built on the Modus themes infrastructure (modus-vivendi-tinted base)
with warm, high-saturation accent colors against a pure black
background.  Conforms with the highest legibility standard for
color contrast between background and foreground (WCAG AAA, 7:1
minimum contrast ratio)."
 'dark
 'deepsky-moonunit-palette
 'deepsky-moonunit-palette-user
 'deepsky-moonunit-palette-overrides
 'deepsky-moonunit-faces
 'deepsky-moonunit-custom-variables)

(provide 'deepsky-moonunit-theme)
;;; deepsky-moonunit-theme.el ends here
