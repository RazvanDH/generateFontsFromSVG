@font-face {
  font-family: "<%= fontName %>";
  src: url(<%= fontName %>.eot);
  src: url(<%= fontName %>.eot?#iefix) format('eot'),
    url(<%= fontName %>.woff) format('woff'),
    url(<%= fontName %>.ttf) format('truetype'),
    url(<%= fontName %>.svg#<%= fontName %>) format('svg');
  font-weight: normal;
  font-style: normal;
}

// scss-lint:disable ImportantRule
.<%= className %>-icon:before {
  font-family: "<%= fontName %>" !important;
  font-style: normal !important;
  font-weight: normal !important;
  font-variant: normal !important;
  text-transform: none !important;
  speak: none;
  line-height: inherit;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
// scss-lint:enable ImportantRule

[class^="<%= className %>-"]:before,
[class*=" <%= className %>-"]:before {
  @extend .<%= className %>-icon;
}

<% _.each(glyphs, function(glyph) { %>.<%= className %>-<%= glyph.name %>:before { content: "\<%= glyph.codepoint.toString(16).toUpperCase() %>"; }
<% }); %>
