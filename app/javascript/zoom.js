import Drift from 'drift-zoom';

new Drift(document.querySelector('.image-zoom'), {
  inlinePane: 600,
  inlineOffsetY: 75,
  zoomFactor: 1.5,
  containInline: true,
  hoverBoundingBox: true
});
