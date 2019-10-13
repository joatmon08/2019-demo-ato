provider "local" {
  version = "~> 1.4"
}

resource "medium_post" "medium_provider" {
  title          = "Writing a Terraform Provider for Medium"
  content        = file("./medium-provider.md")
  content_format = "markdown"
  publish_status = "draft"
}

resource "translate_text" "spanish" {
  text = file("./medium-provider.md")
  source_language = "en"
  target_language = "es"
}

resource "medium_post" "medium_provider_spanish" {
  title          = "Writing a Terraform Provider for Medium (Spanish)"
  content        = translate_text.spanish.translated_text
  content_format = "markdown"
  publish_status = "draft"
}

resource "translate_text" "chinese" {
  text = file("./medium-provider.md")
  source_language = "en"
  target_language = "zh"
}

resource "local_file" "medium_provider_zh" {
    content  = translate_text.chinese.translated_text
    filename = "${path.module}/medium-provider-zh.md"
}