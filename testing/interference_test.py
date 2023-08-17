import openai

openai.api_key = ''
openai.api_base = 'http://10.10.5.175:1337'

chat_completion = openai.ChatCompletion.create(stream=True,
                                               model='gpt-4',
                                               messages=[{'role': 'user', 'content': '你好'}])


# print(chat_completion.choices[0].message.content)

for token in chat_completion:

    content = token['choices'][0]['delta'].get('content')
    if content is not None:
        print(content)
