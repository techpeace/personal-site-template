# Personal Site Template

This is a template for your own personal site including a portfolio, blog, and résumé. It is based on the fantastic [middleman-zurb-template](https://github.com/mattolson/middleman-zurb-template) project.

## Installation

### Prepare GitHub

**NOTE:** The following instructions assume that you'll be using GitHub Pages personal sites as your host. 

**NOTE:** If you are starting completely from scratch with GitHub Pages, skip to Step 3.

1. Clone your existing website repo (if you already have one). 
2. Delete the existing repo from GitHub.
3. Create a repo, with the name `username.github.io`. 

**NOTE:** Even if you are going to use a custom domain name (CNAME) for your new personal site, you still need to create the repo with the name `username.github.io`. The rake task relies on this name format to configure the site correctly. 

### Copy the Site Code

Clone the site code to your local working directory.

```console
git clone https://github.com/makersquare/personal-site-template.git username.github.io
cd username.github.io
bundle install
```

Run the rake task to set up the repository.

```console
bundle exec rake setup_github_pages
```

When prompted by the rake task, paste the full GitHub URL for your personal site repo. 

```console
https://github.com/username/username.github.io
```

**NOTE:** Personal sites use the master branch by default, therefore the rake task will rename your master branch to source. 

Commit and push the refactored repository to your GitHub Pages repository.

```console
git push origin source
```

Generate and deploy the site:

```console
bundle exec middleman build
bundle exec middleman deploy
```

After a few minutes, your site should be live.

## Set-up

### Running a development server

To check out your edits locally, simply run a middleman development server:

```console
bundle exec middleman
```

This will start a development server visible at [localhost:4567](http://localhost:4567).

### Configuration

Most of the site can be configured via altering values in the `config.rb` file.

#### Résumé

Drop a PDF of your résumé in the source directory. Now set `resume` to the name of the file. A link will appear in the top navigation bar.

#### Social Networking Links

Under the "Social Network link settings" section of `config.rb`, reset the values to point at your social networking accounts, or set them to nil to leave them out of the navigation.

#### Projects

You can highlight your projects with the portfolio section of the site. Use the `data/projects.yaml` file as a template for listing a description of each of your projects. They will automatically 

##### Taking Screenshots

You can use [the screenshotter gem](https://github.com/ctide/screenshotter) to take screenshots of your projects. If you prefer to do it manually, then use Safari to view a live version of your project. Press command-shift-4-space, then click on the Safari window to save a screenshot to the Desktop. Now open the screenshot in Preview, and resize the image to 50% of its original size. Now drop the image file into `source/images`.

#### Disqus integration (for blog)

Create a Disqus account for your blog, and set the `disqus_shortname` variable in `config.rb` to the shortname for your blog.

#### Google Analytics integration

Create a Google Analytics account, and set the `google_analytics_tracking_id` appropriately.

## Theming

To use an existing theme:

1. Choose a theme [from the wiki](https://github.com/makersquare/personal-site-template/wiki/Themes)
2. Uncomment the line with that theme's name in `source/stylesheets/theme.css.scss`. 

To create your own theme:

1. Use `source/stylesheets/themes/template.css.scss` as a guide.
2. Create a new file in `source/stylesheets/themes` with the name of your theme
3. Add a line to `source/stylesheets/theme.css.scss` to incorporate it. 
4. Send a pull request if it's awesome!

## Blogging

Refer to [the middleman-blog docs](http://middlemanapp.com/basics/blogging/) for information on using the blog.

### Removing blog functionality

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

## Deploying

To deploy, just run the following again:

```console
bundle exec middleman build
bundle exec middleman deploy
```

## Keeping things up to date

If you want to keep up to date with the latest changes to the [base template](http://github.com/makersquare/personal-site-template), start by making sure your repo's stage is clean, then run the following:

```console
git pull upstream master
```

## Using a custom domain name

Create a file `source/CNAME` containing your domain name:

```text
thatwebmuck.com
```

Commit this file to your source branch, then build and deploy the site. Now follow [GitHub's instructions for adding a custom domain to your Pages site](https://help.github.com/articles/setting-up-a-custom-domain-with-pages). 

