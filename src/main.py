from bottle import route, run, template, static_file, request
import os
import markdown
import json
from PIL import Image 
from sys import argv
NAVBAR =(
    {'url':'/','name': 'Homepage'},
    {'url':'/about','name': 'About'},
    {'url':'/gallery','name':'Gallery'},
    {'url':'/cr','name': 'Articles'},
    {'url':'/events','name': 'Events'},
    {'url':'/donate','name': 'Donate'}
)

EVENTS_PAST =(
    {'title':'Spring Adaptive Golf goes outdoors! ⛳️', 'page':4, 'time': 'Apr-Jun 2026', 'detail': 'After a successful winter program, Boston Eaglets Club and AllStars Learning continue supporting kids with special needs through inclusive golf sessions focused on putting, chipping, and basic swing skills in a fun and encouraging environment. Junior coaches and volunteers are warmly welcome — helping every child enjoy the game and grow with confidence.'},
    {'title':'2026 Spring Golf Gathering!', 'time':'Apr-12-2026', 'page':5, 'detail':"After a long Boston winter, we're beyond excited to kick off our first outdoor golf gathering of the season! Come out to Blue Hill Country Club for a fun-filled 9-hole event where young golfers can reconnect, compete, grow, and celebrate the game together."},
    {'title':'BEC Spring Kickoff', 'page':3, 'time':'Mar-8-2026', 'detail':'Join fellow Boston Eaglets Club members for our Spring Kickoff Social Event at Topgolf Canton. Reconnect, enjoy some golf, and discuss the upcoming 2026 spring.'},
    {'title':'Winter Adaptive Golf Program for Special Needs', 'page':2, 'time':'Jan to Mar 2026', "detail":"The Boston Eaglets Club, together with AllStars Learning, is introducing an Adaptive Golf Program for Special Needs from January to March 2026. This is a new and valuable initiative for our team, and the six-session series will include putting, chipping, and basic swing skills taught through supportive, developmentally friendly activities. Although all junior volunteers will receive training, we recognize that this opportunity brings its own challenges, and we are committed to doing our best as we learn to support young participants through adaptive golf. Our hope is to create a space where kids with autism can play comfortably, build confidence, and grow step by step. We welcome all club members to join us in this program."},
    {'title':'🌴🌴🌴Boston Eaglets Club Winter Golf Escape🌴🌴🌴', 'page':1, 'time':'Jan-2-2026', 'detail':"TPC Sarasota's Private Golf and Social Club - Prestancia, tee off at 9:30 AM. Play, relax, connect. Join us for a sunny winter getaway to Florida with friends and fellow members of the Boston Eaglets Club. We are hosting 18 holes at a world-class private course, light lunch available at the clubhouse, great company, warm sunshine, and friendly competition. There are only 8 spots available! It will be first come, first served, so don't miss out! For any questions regarding this event, please contact Spencer Wu at spiolet3456@gmail.com Keep your swing strong. Build your connections. Enjoy the sunshine! 🌴Together we grow — on and off the course 🦅"},
    {'title':'Boston Eaglets Club Thanksgiving Golf Outing', 'page':0, 'time':'Nov-30-2025','detail':'9-Hole holiday round at Marlborough Country Club tee off at noon, 8 spots available. Join us for a relaxed afternoon round before the holiday season kicks into full swing.🍁🦃🍂🍁Great company, crisp air, and a beautiful course — the perfect way to wrap up November! Contact Taylor Pan: taylorpanyoyo@gmail.com for any questions. Happy Thanksgiving from the Boston Eaglets Club!🍁🦃🍂🍁'},
    {'title':'Eaglets Soar at Their First Fall Golf Day at Brae Burn Country Club -Valerie Luxieo', 'time': 'Nov-16-2025', 'detail':"The Boston Eaglets Golf Club held its first fall golf meet on a sunny but windy Sunday at the Brae Burn Country Club, marking a memorable milestone for the young golfers and their growing community.Despite strong, cold winds and wet grass, every participant played with remarkable focus and determination. Members completed nine holes in groups of four, finishing strong and forming new friendships along the way. Spirits stayed high throughout the morning as players encouraged one another through tricky shots, slippery fairways, and unpredictable gusts of wind.After the round, the groups gathered for a warm lunch inside the house of golfer Brian Li and his family. The Eaglets were honored to be joined by a senior leader from U.S. Kids Golf, who met with the players to discuss the future of the Boston Eaglets program. Over the delicious meal, he shared stories from his career, offered uplifting words, and reminded the young golfers to stay dedicated, confident, and resilient both on and off the course.The kids also had the opportunity to speak about their hopes for the Boston Eaglets, especially their mission to build a more diverse, welcoming, and talent-filled club. Ideas for future events were shared, including plans aimed at bringing more golf-enthusiastic girls into the sport and expanding participation across all backgrounds.The afternoon ended on an encouraging note, with the special guest's motivating message and his genuine support for the club's goals. As the players left the event, the sense of excitement for upcoming meets and events was unmistakable.The Boston Eaglets extend their gratitude for the inspiring visit of Mr. John Kim and look forward to continuing the momentum throughout the next few years."},
    {'title':'2025 Boston Fall Fundraising Event 🎃⛳', 'link': '/crc/6+My%20First%20Volunteering%20Experience%20at%20US%20Kids%20Golf', 'time': 'Oct-25-2025', 'detail': """What a weekend at Falmouth Country Club! Perfect weather, great swings, and plenty of Halloween spirit made it a truly memorable Fall Season Championship. The kids had a blast (and yes, we made sure to have plenty of candy 🍬).We're thrilled to share that we raised over $2,100 for the U.S. Kids Golf Foundation — helping support future tournaments and create even more amazing experiences for junior golfers.A huge thank-you to all the volunteers and families who made this event such a success. See you next season — until then, keep swinging and have a spooktacular Halloween! 👻"""},
    {'title':'Fundraising at Us Kids 2024 Fall Season Championship', 'time': 'Oct-26-2024', 'detail': "The 2024 Fall Season Championship at Falmouth Country Club was the first event where the Boston Eaglets Club volunteered together on the course. Our team helped raise over $2,000 for the foundation to support future tournaments. These funds will help U.S. Kids Golf host upcoming events at higher-quality courses and create even better experiences for junior golfers in the seasons ahead.A big thank-you to all the volunteers who helped make this event a success — and we can't wait to see even more young golfers join us next season!"},
)
for item in EVENTS_PAST:
    item['short']= item['detail']
    item['short']=item['short'].split(".")
    item['short'] = item['short'][0]+ "."+item['short'][1]+'.'

EVENTS_FUTURE =(
    {'title':'Fall Adaptive Golf Outdoor Program! ⛳️', 'page':7, 'time': 'Aug-Sep 2026', 'detail': 'Fall Outdoor Program.'},
    {'title':'Fundraising at Us Kids 2026 Fall Season Championship', 'time': 'Oct-25-2026', 'detail': 'Future event at Falmouth Country Club.'},
)

for item in EVENTS_FUTURE: 
    item['short']= item['detail']
    item['short']=item['short'].split(".")
    item['short'] = item['short'][0]+ "."+(item['short'][1]+'.' if item['short'][1] else '')

@route('/')
def homepage():
    return template('index', NAVBAR=NAVBAR, recaps=get_recaps()[0:5], album=get_album('as')[0:2]+get_album('bge')[0:2]+get_album('fe')[0:2]+get_album('vlc')[0:2], EVENTS_PAST=EVENTS_PAST, EVENTS_FUTURE=EVENTS_FUTURE)

@route('/static/<filepath:path>')
def static_files(filepath):
    return static_file(filepath, './static/')

@route('/about')
def about():
    return template('about', NAVBAR=NAVBAR)

@route('/favicon.ico')
def beclogostuff ():
    return static_file ('BEC-logo.ico', '.')

@route('/events')
def events():
    return template('events', NAVBAR=NAVBAR, EVENTS_PAST=EVENTS_PAST, EVENTS_FUTURE=EVENTS_FUTURE)

def generate_thumbnail(path, filename):
    thumb_dir = "./static/thumb/"+path.split('/')[-1]
    os.makedirs(thumb_dir, exist_ok=True)

    thumb_path = os.path.join(thumb_dir, filename)

    with Image.open(path+'/'+filename) as img:
        try:
            exif = img._getexif()
            if exif:
                orientation = exif.get(274)
                if orientation == 3:
                    img = img.rotate(180, expand=True)
                elif orientation == 6:
                    img = img.rotate(270, expand=True)
                elif orientation == 8:
                    img = img.rotate(90, expand=True)
        except Exception:
            pass

        new_height = int(img.height * 400 / img.width)
        img.thumbnail((400, new_height))

        if img.mode in ("RGBA", "LA"):
            img = img.convert("RGB")

        img.save(thumb_path, "JPEG")

    return thumb_path


def get_album(suffix):
    all=[]
    for path, subpath, files in os.walk("./static/a-"+suffix):
        if subpath==[]:
            l=filter(lambda x:x!='.DS_Store', files)
            s=[[int(f.split('.')[0]),f] for f in l]
            s=sorted(s,key=lambda x:x[0], reverse=True)
            s=[item[1] for item in s]
            for item in s:
                generate_thumbnail(path,item)
            all.append([path.split('/')[-1], s])
    print(all)
    all=sorted(all,key=lambda x:int(x[0].split('+')[-1]), reverse=True) 
    for item in all:
        item[1]=sorted(item[1], key=lambda x:int(x.split('.')[0]))
    return all

@route('/api/events_past')
def api_events_past():
    return json.dumps(EVENTS_PAST)

@route('/api/events_future')
def api_events_past():
    return json.dumps(EVENTS_FUTURE)

@route('/gallery')
def gallery():
    return template('galleryv2', NAVBAR=NAVBAR)

@route('/gallery/<suf>')
def gsub(suf):
    return template('gallery', NAVBAR=NAVBAR, album=get_album(suf))

def get_recaps():
    l=list(os.walk("./recaps"))[0][2]
    l=filter(lambda x:x!='.DS_Store', l)
    l=[[int(f.split('+')[0]), f] for f in l]
    l=sorted(l,key=lambda x:x[0], reverse=True)
    l=[x[1] for x in l]
    s=[[f.split('.')[0],f] for f in l]
#    s=sorted(s,key=lambda x:x[0], reverse=True)
    return s

@route('/donate')
def donate():
    return template('donate', NAVBAR=NAVBAR)

@route('/cr')
def cr():
    return template('article_list', NAVBAR=NAVBAR, recaps=get_recaps())

@route('/crc/<name>')
def crc (name):
    if os.path.exists('recaps/'+name+'.md'):
        with open('recaps/'+name+'.md', 'r', encoding='utf-8') as f:
            t=f.read()
            html = markdown.markdown(t)
            return template('specificarticle', NAVBAR=NAVBAR, html=html, title=name)
    else:
        with open('recaps/'+name+'.ht', 'r', encoding='utf-8') as f:
            html = f.read()
            return template('specificarticle', NAVBAR=NAVBAR, html=html, title=name) 
def optimize_static_images():
    for root, dirs, files in os.walk("./static"):

        if "/thumb" in root:
            continue

        for file in files:
            if not file.lower().endswith((".jpg", ".jpeg", ".png")):
                continue

            path = os.path.join(root, file)

            try:
                with Image.open(path) as img:

                    img.thumbnail((1800, 1800))

                    if img.mode in ("RGBA", "LA"):
                        img = img.convert("RGB")

                    img.save(path, quality=80, optimize=True)

                print("Optimized:", path)

            except Exception as e:
                print("Skipped:", path, e)
if __name__ == '__main__':
    print(argv)
    if len(argv)>1 and argv[1]=='pro':
        run(server="gunicorn", host='0.0.0.0', port=80)
    else:
        run(host='0.0.0.0', port=80)
         