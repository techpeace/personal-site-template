# Personal Site Template

This is a template for your own personal site including a portfolio, blog, and résumé. It is based on the fantastic [middleman-zurb-template](https://github.com/mattolson/middleman-zurb-template) project.

## Configuration

### Projects

#### Taking Screenshots

### Disqus integration (for blog)

### Google Analytics integration

### Basics

### Blogging

#### Removing blog functionality

This template is still a good starting point for sites that don't require blogging functions. To remove blog-specific stuff:

1. `git rm source/blog/*`
2. `git rm source/layouts/article.erb`
3. Remove middleman-blog from Gemfile.
4. Remove blog-related styles from source/stylesheets/base.css.scss. They are all at the bottom of the file grouped together under the header "Blog Articles".
5. Remove blog-related settings from config.rb. They are all grouped at the top under the header "Blog Settings".
6. Remove the link to the blog in the markup for the navbar (in `layouts/layout.erb`).
7. Remove the `section.latest-from-blog` element from the markup in `index.html.erb`, and remove the following code from `landing-page.css.scss`:

```scss
section.latest-from-blog, section.featured-project {
  @include grid-column(6);
}
```

http://middlemanapp.com/blogging/

## Deploying

