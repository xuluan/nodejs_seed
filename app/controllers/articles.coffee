###
Module dependencies.
###
mongoose = require("mongoose")
Article = require("../models/article")
_ = require("underscore")



###
List of Articles
###
exports.all = (req, res) ->
  Article.find().sort("-created").exec (err, articles) ->
    if err
      res.render "error",
        status: 500

    else
      res.json articles

exports.create = (req, res) ->
  article = new Article req.body
  article.user = req.user
  article.save()
  res.jsonp article
