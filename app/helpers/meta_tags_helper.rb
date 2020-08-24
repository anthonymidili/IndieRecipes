module MetaTagsHelper
  def set_root_meta_tag_options
    set_meta_tags description: description,
      twitter: {
        card:  "summary",
        title: "Recipedia | Let's cook together",
        description: description,
        url: root_url,
        secure_url: root_url,
        image: {
          _: (request.host_with_port + ActionController::Base.helpers.asset_pack_path('media/images/spice.jpg')),
          sucure_url: (request.host_with_port + ActionController::Base.helpers.asset_pack_path('media/images/spice.jpg')),
          width: 600,
          height: 400,
          type: "image/jpeg"
        }
      },
      og: {
        title: "Recipedia | Let's cook together",
        description: description,
        type: 'website',
        url: root_url,
        secure_url: root_url,
        image: {
          _: (request.host_with_port + ActionController::Base.helpers.asset_pack_path('media/images/spice.jpg')),
          sucure_url: (request.host_with_port + ActionController::Base.helpers.asset_pack_path('media/images/spice.jpg')),
          width: 600,
          height: 400,
          type: "image/jpeg"
        }
      }
  end

  def recipe_meta_tag_options(recipe)
    set_meta_tags description: recipe.description,
      keywords: recipe.categories.list_names,
      twitter: {
        card:  "summary",
        title: recipe.name,
        description: recipe.description,
        url: recipe_url(recipe),
        secure_url: recipe_url(recipe),
        image: {
          _: image_url(recipe),
          secure_url: image_url(recipe),
          width: 400,
          height: 400,
          type: (recipe.recipe_images.first.image.blob.content_type if recipe.recipe_images.try(:first).try(:image).try(:attached?))
        }
      },
      og: {
        title: recipe.name,
        description: recipe.description,
        type: 'website',
        url: recipe_url(recipe),
        secure_url: recipe_url(recipe),
        image: {
          _: image_url(recipe),
          secure_url: image_url(recipe),
          width: 400,
          height: 400,
          type: (recipe.recipe_images.first.image.blob.content_type if recipe.recipe_images.try(:first).try(:image).try(:attached?))
        }
      }
  end

  private

  def image_url(recipe)
    image_url = recipe.recipe_images.first.image.service_url if recipe.recipe_images.try(:first).try(:image).try(:attached?)
  end

  def description
    "Making it easy to share your recipes with friends and family. Swap recipes, leave reviews, post
    images of recipes you've tried and get notified when a cook you follow posts a new
    recipe. Share on Twitter, Facebook, Pinterest, Telagram or email."
  end
end
