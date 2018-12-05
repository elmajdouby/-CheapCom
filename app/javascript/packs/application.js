import "bootstrap";
import Drift from 'drift-zoom';

new Drift(document.querySelector('.image-zoom'), {
  inlinePane: 900,
  inlineOffsetY: 85,
  zoomFactor: 2,
  containInline: true,
  hoverBoundingBox: true
});
