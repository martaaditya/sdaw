import random, string, urllib.request, json, getpass

#Generate root password

password = ''.join(random.choice(string.ascii_letters + string.digits) for i in range(20))

#Run sshd

get_ipython().system_raw('/usr/sbin/sshd -D &')

#Ask token

print("Copy authtoken from https://dashboard.ngrok.com/auth")

authtoken = getpass.getpass()

#Create tunnel

get_ipython().system_raw('./ngrok authtoken $authtoken && ./ngrok tcp 22 &')

#Get public address and print connect command

with urllib.request.urlopen('http://localhost:4040/api/tunnels') as response:

  data = json.loads(response.read().decode())

  (host, port) = data['tunnels'][0]['public_url'][6:].split(':')

  print(f'SSH command: ssh -p{port} root@{host}')

#Print root password

print(f'Root password: {password}')
