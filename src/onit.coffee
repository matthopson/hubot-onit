# Description
#   Get on it.
#
# Configuration:
#
# Commands:
#   when <user> is on it <response>
#   <user> is on it
#
# Notes:
#
# Author:
#   Matt Hopson

module.exports = (robot) ->
  unless robot.brain.hasOwnProperty 'onit'
    robot.brain.onit = {}

  robot.hear /when (.+) is on it (.+)/, (msg) ->
    userName = msg.match[1].toLowerCase()
    response = msg.match[2]

    robot.brain.onit[userName] = response

    msg.send "Got it!\n#{response}"

  robot.hear /(.+) is on it/, (msg) ->
    userName = msg.match[1].toLowerCase()

    if robot.brain.onit.hasOwnProperty userName
      msg.send robot.brain.onit[userName]
