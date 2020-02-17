# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( adminlte.js jquery.min.js jquery-ui.min.js jquery.overlayScrollbars.min.js moment.min.js summernote-bs4.min.js tempusdominus-bootstrap-4.min.js bootstrap.bundle.min.js daterangepicker.js jquery.knob.min.js )

Rails.application.config.assets.precompile += %w( bootstrap.min.css font-awesome.min.css icon-font.min.css animate.css hamburgers.min.css animsition.min.css select2.min.css daterangepicker.css util.css main.css )

Rails.application.config.assets.precompile += %w( animsition.min.js popper.js bootstrap.min.js select2.min.js countdowntime.js main.js )
