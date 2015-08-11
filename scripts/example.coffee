# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md


resMes = false
resMode = false
alreadyRes = false

module.exports = (robot) ->


  robot.hear /(.*)/i, (res) ->
    resMes = false
    alreadyRes = false

    message = res.match[1]
    # 条件が複雑なもの
    if /進捗/i.test(message)
      if /(だめ|ダメ|駄目|ヤバい|なし|無し|ない|無い)/i.test(message)
        rand = Math.floor(Math.random() * 11) + 1
        switch rand
          when 1
            resMes = "お前全然反省してないだろ"
          when 2
            resMes = "そういう話は聞きたくないですから"
          when 3
            resMes = "ネットばっか見てんじゃないよ"
          when 4
            resMes = "あんたが動いてこそ完パケるんだよ。"
          when 5
            resMes = """音楽CDは一人で作ってるんじゃないんだよ
            CD製作はチームワークなんだ
            責任持てるのって話し"""
          when 6
            resMes = "何やってんの？"
          when 7
            resMes = "ここまで順調なんだから締め切りまでに間に合わなかったら…解ってるよね"
          when 8
            resMes = "オリジナル作品の産みの苦しみだね"
          when 9
            resMes = "あぁ…重いのばっかり残ってるからなー"
          when 10
            resMes = "ピンチはチャンスだと思うしか無いよね。"
          else
            resMes = "スキルを磨く良いチャンスだと思って、頑張ろ？"
      # else of だめ|ダメ|駄目|ヤバい|なし|無し|ない|無い
      else
        rand = Math.floor(Math.random() * 4) + 1
        switch rand
          when 1
            resMes = "上がった？"
          when 2
            resMes = "やっぱ何かあった？"
          when 3
            resMes = "どうかした？"
          else
            resMes = "原稿どうなった？もうすぐ締め切りでしょ？"
    else
      if /(だめだ|ダメだ|駄目だ)/i.test(message)
        rand = Math.floor(Math.random() * 3) + 1
        switch rand
          when 1
            resMes = "まぁ結局、上手くて情熱のある人しか残れないのかも。どの世界も同じ"
          when 2
            resMes = "どんな仕事だって厳しいことに変わりない。厳しさの種類が違うだけだよ"
          else
            resMes = "この期に及んで何言ってるんですか？"
    # イベント
    if /何日/i.test(message)
      eventName = false;
      remainDays = false;
      now = new Date

      if /コミケ/i.test(message)
        eventDate = new Date "2015-08-14 00:00:00 +0900"
        diffMs = eventDate.getTime() - now.getTime()
        # 日数差分
        days = parseInt(diffMs/(24*60*60*1000), 10) + 1

        if days > 0
          eventName = "C88"
          remainDays = days
        else
          eventDate = new Date "2015-12-29 00:00:00 +0900"
          diffMs = eventDate.getTime() - now.getTime()
          # 日数差分
          days = parseInt(diffMs/(24*60*60*1000), 10) + 1

          if days > 0
            eventName = "C89"
            remainDays = days

      else if /M3/i.test(message)
        eventDate = new Date "2015-10-25 00:00:00 +0900"
        diffMs = eventDate.getTime() - now.getTime()
        # 日数差分
        days = parseInt(diffMs/(24*60*60*1000), 10) + 1

        if days > 0
          eventName = "M3"
          remainDays = days

      # メッセージ決定
      if remainDays isnt false
        rand = Math.floor(Math.random() * 11) + 1
        switch rand
          when 1
            resMes = "#{eventName}まで、残り#{remainDays}日だからね。進捗状況表、更新しておくこと"
          else
            resMes = "#{eventName}まで、残り#{remainDays}日だよ。ちゃんと進んでるー？"
      # イベントが取得できなかった場合
      else
        resMes = "何日なんか気にする前にあんたは作業に集中して。大丈夫、進行は私の方でするから"

  robot.hear /おごり/i, (res) ->
    resMes = "うん、そうだね。楽しみにしとくよ。あんたのおごり"

  robot.hear /お金.*(ない|無い)/i, (res) ->
    resMes = "だったら仕事してください"

  robot.hear /(ゴミ|クズ)/i, (res) ->
    resMes = """そうそう。
    変な人間ばっかりですよねーこの業界。
    だらしない、大人げない。どうしようもない。カスゴミ、クズ。
    だけど基本的にみんな善人だから良いかって"""

  robot.hear /(よんだ？|呼んだ？)/i, (res) ->
    resMes = "呼んでない"

  robot.hear /(やばい|ヤバい|失敗)/i, (res) ->
    rand = Math.floor(Math.random() * 2) + 1
    if rand is 1
      resMes = """あるある。若さゆえの過ち
      みんなそんなもんだよ"""
    else
      resMes = """そう。トライアンドエラーって言うけど、日々トライアンドトラブル。
      …なんてね！流石のアイアン矢野もお疲れ中"""

  robot.hear /(尽きた)/i, (res) ->
    resMes = "それはデスクのセリフ。尽きてない！"

  robot.hear /(大丈夫？)/i, (res) ->
    resMes = """流石に疲れたよー
    氷山にぶつからないように船を操縦するのはさぁ…"""

  robot.hear /脱稿/i, (res) ->
    resMes = """原稿上がったの？
    ちょっと見ていい？"""

  robot.hear /(疲れた|つかれた|眠い|ねむい)/i, (res) ->
    rand = Math.floor(Math.random() * 3) + 1
    switch rand
      when 1
        resMes = """あんた、今日は一旦うちに帰りな。
        今晩あんたがここで粘ってたって何も解決しないから。
        それより顔、酷いよ"""
      when 2
        resMes = "最近ちゃんと寝てないでしょ？"
      else
        resMes = "まぁ、マジメな人ほど、現実のギャップに傷ついたり、絶望したりするからね。元気だしな"
  ###
  # respond
  ###
  robot.respond /(.*)/i, (res) ->
    # 既にhearでメッセージが決定してる時は処理を行わない。
    if resMes is false
      message = res.match[1]
      if /だよね/i.test(message)
        rand = Math.floor(Math.random() * 2) + 1
        switch rand
          when 1
            resMes = "だね。"
          else
            resMes = "だろうね。"
      if /おはよう/i.test(message)
        resMes = "おはようございます。進捗、いかかでしょうか＾＾"

      if /(ちんこ|オナニー|prpr|ご褒美)/i.test(message)
        resMes = "永遠にだまってていいから"

      if /(やってます|やってる|あとちょっと|もうすこし|もう少し)/i.test(message)
        resMes = "同人作家の「やってます」と「あとちょっとです」は信頼するなって業界の常識"

      if /(かわいい|可愛い|すき|好き)/i.test(message)
        rand = Math.floor(Math.random() * 5) + 1
        switch rand
          when 1
            resMes = "馬鹿なのお前"
          when 2
            resMes = "殴ってやろうかな、こいつ"
          when 3
            resMes = "うわぁぁ…複雑…"
          when 4
            resMes = "釣れますか？"
          else
            resMes = "そぉお〜？"
      if /(バイバイ|お休み|おやすみ)/i.test(message)
        resMes = "はい、じゃあね、頑張って"
      # その他のレスポンス
      if resMes is false
        rand = Math.floor(Math.random() * 5) + 1
        switch rand
          when 1
            resMes = "何？"
          when 2
            resMes = "あんた何やってるの？"
          when 3
            resMes = "なに？"
          when 4
            resMes = "ふっ＾＾"
          when 5
            resMes = "ふふふっ"
          else
            resMes = "ん？"
    res.reply resMes
    alreadyRes = true

  ###
  # send
  ###
  robot.hear /.*/i, (res) ->
    if resMes isnt false
      if alreadyRes is false
          res.send resMes



  # robot.respond /open the (.*) doors/i, (res) ->
  #   doorType = res.match[1]
  #   if doorType is "pod bay"
  #     res.reply "I'm afraid I can't let you do that."
  #   else
  #     res.reply "Opening #{doorType} doors"
  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
