require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap/dist/js/bootstrap'

import '../styles/application'

import '../scripts/map'
import '../scripts/ekko-lightbox'
import '../scripts/gallery_lightbox'

const images = require.context('../images', true)

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const imagePath = (name) => images(name, true)
