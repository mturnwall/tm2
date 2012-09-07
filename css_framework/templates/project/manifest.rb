# Make sure you list all the project template files here in the manifest.
stylesheet 'master.scss', :media => 'screen, projection'
stylesheet 'partials/_base.scss'
stylesheet 'partials/_mixins.scss'
stylesheet 'ie.scss', :media => 'screen, projection', :condition => "lt IE 9"
stylesheet 'ie9.scss', :media => 'screen, projection', :condition => "gt IE 8"
