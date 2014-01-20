# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# LashesByJackie::Application.config.secret_token = '3a0416cd3007c464e2cbf065126ebba1412d6ccfe22aa27320b39893dfdaf66673c98bfbf6f1efdd5007eb73531f9aad65f5dd3619f5b49d45a9522bffa9248d'

LashesByJackie::Application.config.secret_token = "#{SecureRandom.hex(64)}"
