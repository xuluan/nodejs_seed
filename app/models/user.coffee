###
Module dependencies.
###
mongoose = require("mongoose")
Schema = mongoose.Schema
crypto = require("crypto")
_ = require("underscore")
authTypes = ["github", "twitter", "facebook", "google", "linkedin"]

###
User Schema
###
UserSchema = new Schema(
  email:
    type: String
    default: ""
    unique: true

  username:
    type: String
    default: ""

  provider:
    type: String
    default: ""

  hashed_password:
    type: String
    default: ""

  salt:
    type: String
    default: ""

  authToken:
    type: String
    default: ""

  facebook: {}
  twitter: {}
  github: {}
  google: {}
  linkedin: {}
)

###
Virtuals
###
UserSchema.virtual("password").set((password) ->
  @_password = password
  @salt = @makeSalt()
  @hashed_password = @encryptPassword(password)
).get ->
  @_password


###
Validations
###
validatePresenceOf = (value) ->
  value and value.length


UserSchema.path("email").validate ((email) ->
  
  # if you are authenticating by any of the oauth strategies, don't validate
  return true  if authTypes.indexOf(@provider) isnt -1
  email.length
), "Email cannot be blank"
UserSchema.path("email").validate ((email, fn) ->
  User = mongoose.model("User")
  
  # if you are authenticating by any of the oauth strategies, don't validate
  fn true  if authTypes.indexOf(@provider) isnt -1
  
  # Check only when it is a new user or when email field is modified
  if @isNew or @isModified("email")
    User.find(email: email).exec (err, users) ->
      fn not err and users.length is 0

  else
    fn true
), "Email already exists"
UserSchema.path("username").validate ((username) ->
  
  # if you are authenticating by any of the oauth strategies, don't validate
  return true  if authTypes.indexOf(@provider) isnt -1
  username.length
), "Username cannot be blank"
UserSchema.path("hashed_password").validate ((hashed_password) ->
  
  # if you are authenticating by any of the oauth strategies, don't validate
  return true  if authTypes.indexOf(@provider) isnt -1
  hashed_password.length
), "Password cannot be blank"

###
Pre-save hook
###
UserSchema.pre "save", (next) ->
  return next()  unless @isNew
  if not validatePresenceOf(@password) and authTypes.indexOf(@provider) is -1
    next new Error("Invalid password")
  else
    next()


###
Methods
###
UserSchema.methods =
  
  ###
  Authenticate - check if the passwords are the same
  
  @param {String} plainText
  @return {Boolean}
  @api public
  ###
  authenticate: (plainText) ->
    @encryptPassword(plainText) is @hashed_password

  
  ###
  Make salt
  
  @return {String}
  @api public
  ###
  makeSalt: ->
    Math.round((new Date().valueOf() * Math.random())) + ""

  
  ###
  Encrypt password
  
  @param {String} password
  @return {String}
  @api public
  ###
  encryptPassword: (password) ->
    return ""  unless password
    encrypred = undefined
    try
      encrypred = crypto.createHmac("sha1", @salt).update(password).digest("hex")
      return encrypred
    catch err
      return ""

mongoose.model "User", UserSchema
