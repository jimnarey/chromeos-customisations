// Disable bold
term_.prefs_.set('enable-bold', false)

// Use this for Solarized Dark
term_.prefs_.set('background-color', "#002b36");
term_.prefs_.set('foreground-color', "#839496");

// Solarized Colors
term_.prefs_.set('color-palette-overrides', [
  '#073642',
  '#dc322f',
  '#859900',
  '#b58900',
  '#268bd2',
  '#d33682',
  '#2aa198',
  '#eee8d5',
  '#002b36',
  '#cb4b16',
  '#586e75',
  '#657b83',
  '#839496',
  '#6c71c4',
  '#93a1a1',
  '#fdf6e3'
]);


// set font
var fonts=term_.prefs_.get('font-family');
term_.prefs_.set('font-family', '"Droid Sans Mono", '.concat(fonts));
term_.prefs_.set('background-image', 'url(https://4.bp.blogspot.com/-XrXVg9OJeNo/Vy6mw_pfsJI/AAAAAAAABIQ/nvbsquMq2k431d7M5ekZ0UGL06Kl_41YACLcB/s1600/ecommerce-dark-background.jpg')
    
term_.prefs_.set('environment', {TERM: 'xterm-256color'});
term_.prefs_.set('cursor-blink', true);