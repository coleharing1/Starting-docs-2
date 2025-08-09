# UI Rules Template

## Design Principles

### 1. Hierarchy
**Visual Weight Order:**
1. Primary actions (high contrast, larger)
2. Secondary actions (medium contrast)
3. Tertiary actions (low contrast, smaller)
4. Disabled states (lowest contrast)

**Typography Scale:**
- Display: 4xl-6xl (landing pages only)
- Heading 1: 3xl-4xl
- Heading 2: 2xl-3xl
- Heading 3: xl-2xl
- Body: base-lg
- Caption: sm-xs

**Spacing Rhythm:**
- Use 4px base unit (0.25rem)
- Common spacings: 4, 8, 12, 16, 24, 32, 48, 64
- Consistent section padding: 64px (desktop), 32px (mobile)

### 2. Consistency
**Component Patterns:**
- All buttons same height (36px sm, 40px md, 44px lg)
- All inputs same height as buttons
- Border radius: 4px (tight), 8px (default), 12px (loose)
- Shadows: none (flat), sm (raised), md (floating), lg (modal)

**Interaction Patterns:**
- Hover: Subtle color shift + cursor pointer
- Focus: Visible outline (accessibility)
- Active: Slight scale down (0.98)
- Disabled: 50% opacity + not-allowed cursor

### 3. Feedback
**Loading States:**
- Instant (0-100ms): No feedback needed
- Fast (100-300ms): Subtle spinner
- Medium (300-1000ms): Skeleton screen
- Slow (1000ms+): Progress bar + message

**Success/Error Feedback:**
- Success: Green toast, top-right, 3s duration
- Error: Red toast with retry action
- Warning: Yellow inline message
- Info: Blue contextual tooltip

### 4. Responsiveness
**Breakpoints:**
```css
/* Mobile First */
sm: 640px   /* Tablet portrait */
md: 768px   /* Tablet landscape */
lg: 1024px  /* Desktop */
xl: 1280px  /* Wide desktop */
2xl: 1536px /* Ultra-wide */
```

**Layout Strategies:**
- Mobile: Single column, stack everything
- Tablet: 2 columns where beneficial
- Desktop: Multi-column, sidebars
- Use CSS Grid for complex layouts
- Flexbox for component layouts

### 5. Accessibility (WCAG 2.2 AA)
**Color Contrast:**
- Normal text: 4.5:1 minimum
- Large text: 3:1 minimum
- Interactive elements: 3:1 minimum
- Focus indicators: 3:1 minimum

**Interactive Elements:**
- Minimum touch target: 44x44px
- Keyboard navigable (Tab order)
- Screen reader labels (aria-label)
- Focus visible states
- Skip navigation links

**Motion:**
- Respect prefers-reduced-motion
- No auto-playing videos
- Pauseable animations
- No seizure-inducing flashes

## Component Guidelines

### Buttons
```typescript
// Primary: Main CTA
<Button variant="primary" size="md">Save Changes</Button>

// Secondary: Alternative actions
<Button variant="secondary" size="md">Cancel</Button>

// Ghost: Tertiary actions
<Button variant="ghost" size="md">Learn More</Button>

// Destructive: Dangerous actions
<Button variant="destructive" size="md">Delete</Button>

// Icon: Icon-only buttons need aria-label
<Button variant="ghost" size="icon" aria-label="Settings">
  <Settings />
</Button>
```

### Forms
**Field Structure:**
1. Label (required)
2. Helper text (optional)
3. Input field
4. Error message (conditional)

**Validation:**
- Inline validation on blur
- Clear error messages
- Success checkmarks for valid fields
- Disable submit until valid
- Show loading state on submit

### Cards
**Anatomy:**
- Header (optional): Title + actions
- Body: Main content
- Footer (optional): Metadata or actions

**Variants:**
- Flat: No shadow, subtle border
- Raised: Small shadow
- Interactive: Hover state, clickable

### Modals & Dialogs
**Rules:**
- Trap focus within modal
- Close on Escape key
- Close on backdrop click (unless form)
- Animate in/out smoothly
- Maximum width: 600px (most cases)

### Navigation
**Desktop:**
- Horizontal top nav for primary
- Sidebar for secondary (collapsible)
- Breadcrumbs for hierarchy

**Mobile:**
- Hamburger menu (top-right)
- Bottom tab bar (4-5 items max)
- Full-screen menu overlay

## Animation Guidelines

### Timing
```css
/* Micro-interactions */
--duration-instant: 100ms;
--duration-fast: 200ms;
--duration-normal: 300ms;
--duration-slow: 500ms;

/* Page transitions */
--duration-page: 400ms;
```

### Easing
```css
/* Standard easing curves */
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
--ease-spring: cubic-bezier(0.34, 1.56, 0.64, 1);
```

### Common Animations
- Fade: Opacity 0 → 1
- Slide: TranslateY 10px → 0
- Scale: Scale 0.95 → 1
- Rotate: Rotate 0 → 180deg (icons)

## Error Handling UI

### Form Errors
- Show below field immediately
- Red text and border
- Icon for clarity
- Specific error message
- Preserve user input

### Page-Level Errors
- Error boundary component
- Friendly message
- Retry action
- Contact support link
- Don't expose technical details

### Empty States
- Illustration or icon
- Clear message
- Suggested action
- Positive tone
- Consider onboarding

## Performance Guidelines

### Images
- Use Next.js Image component
- Lazy load below fold
- Responsive sizes
- WebP with fallback
- Blur placeholder

### Code Splitting
- Route-based splitting (automatic in Next.js)
- Component lazy loading for heavy components
- Dynamic imports for optional features

### Optimizations
- Virtualize long lists (>100 items)
- Debounce search inputs (300ms)
- Throttle scroll handlers (100ms)
- Memoize expensive computations
- Use CSS for animations (not JS)

## Dark Mode Support

### Implementation
```css
/* CSS Variables approach */
:root {
  --bg-primary: white;
  --text-primary: black;
}

[data-theme="dark"] {
  --bg-primary: black;
  --text-primary: white;
}
```

### Guidelines
- System preference detection
- Manual toggle option
- Persist user choice
- Smooth theme transition
- Test all components in both modes