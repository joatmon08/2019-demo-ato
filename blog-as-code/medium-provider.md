# Writing a Terraform Provider for Medium

In this post, I'll walk through some of the considerations, challenges, and
helpful references that allowed me to create a Terraform Provider for Medium.

As an engineer in the infrastructure-as-code space, I tend to prefer Command
Line Interface over User Interface and writing in Markdown over copying and
pasting in an editor. When I started blogging, I ran into an issue where I could
only write my blogs when I had opened a Medium tab in my browser. If I didn't
have the browser open beforehand, I couldn't write while I was traveling without
connectivity (as I am now typing this blog post).

Since focusing a little more on HashiCorp Terraform, I decided that I needed to
write my own provider. It seemed like a good way to learn about the internals
and how I can extend the ecosystem. With my problem with writing on Medium, I
decided I would write a provider for Medium to publish my blogs for me.

With anticipation, I hoped my workflow would be:

- Create a monorepository with all of my blog posts written in Markdown.
- Write a new blog post in Markdown.
- Add it to my Terraform configuration to create.
- Apply the configuration.
- When I'm ready to publish, change the Terraform configuration for the blog
  post to "publish".

As it turns out, my "wishlist" workflow as not actually the reality due to some
upstream API complications.

# Research the Upstream API

Before I started writing code, I needed to research the Medium API. I was not
sure what I would find and my greatest fears of a non-standard API approach was
realized. To test the API and get access to it, I first had to create a test
account. The test account was not linked to any of my social media because I did
not want to tweet "This is a draft".

Next, I submitted a ticket to turn on "Developer Settings" for that account. It
took a few days to sort out and explain that the test account was for testing,
as per Medium's recommendations and finally get access to create an API key.

Now, I stumbled across another concern: the API is write-only. This meant I
could only create posts and publications. I could not retrieve, update, or
delete the posts. It occurred to me that this approach really did offer me truly
immutable blog posts, where I have to create a new one each time with changes.