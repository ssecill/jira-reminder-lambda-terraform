import requests


def telegram_bot_sendtext(bot_message):
    bot_token = "5523211947:AAEEgPvjydAiyn-c"
    bot_chatID = '-6817'
    send_text = 'https://api.telegram.org/bot' + bot_token \
                + '/sendMessage?chat_id=' + bot_chatID + '&parse_mode=Markdown&text=' \
                + bot_message

    response = requests.get(send_text)

    return response.json()

def lambda_handler(event, context):
 test=telegram_bot_sendtext("Arkadaşlar merhaba, saat 17:00! Günlük jira tasklarımızı girmeyi unutmayalım!")
 print(test)