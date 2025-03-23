(require 'ox-publish)

(setq org-publish-project-alist
      '(("Haruki7049's blogs"
         :base-directory "src"
         :publishing-function org-html-publish-to-html
         :publishing-directory "dist"
         :language "ja"
         :section-numbers t
         :with-title t
         :with-date nil
         :html-head-include-default-style nil

         ;; Sitemap generator
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "Sitemap for Haruki7049's blogs"

         ;; CSS loader from HTTP
         :html-head "<link href=\"https://thomasf.github.io/solarized-css/solarized-dark.css\" rel=\"stylesheet\"></link>
         <link href=\"favicon.ico\" rel=\"icon\"></link>")))

(org-publish-all t)
