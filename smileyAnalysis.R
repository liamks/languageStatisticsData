smiley.faces <- read.csv("~/Desktop/languageData/smiley-faces.csv");

js.projects <- c('angular.js', 'd3', 'node', 'jquery', 'impress.js', 'backbone', 'jQuery-File-Upload', 'moment', 'brackets', 'reveal.js');
c.projects <- c('linux', 'redis', 'neovim', 'emscripten', 'git', 'How-to-Make-a-Computer-Operating-System', 'YouCompleteMe', 'libgit2', 'ProjectTox-Core', 'php-src');

smiley.faces <- within(smiley.faces, {
  project_language <- ifelse(repo %in% js.projects, '.js', '.c');
});

# should limit to only files that share the same ext as the repo

fit <- aov(total_smiley_faces ~ project_language, data=smiley.faces);
fit_t <- t.test(total_smiley_faces ~ project_language, data=smiley.faces);


results <- tapply(smiley.faces$total_smiley_faces, smiley.faces$project_language, mean);