from bottle import route, run, template, static_file, request
import os
import markdown
import json
from PIL import Image

NAVBAR =(
    {'url':'/','name': 'Homepage'},
    {'url':'/about','name': 'About'},
    {'url':'/gallery','name':'Gallery'},
    {'url':'/cr','name': 'Articles'},
    {'url':'/events','name': 'Events'}
)

EVENTS_PAST =(
    {'title':'Fundraising at Us Kids 2024 Fall Season Championship', 'time': '2024-10-26', 'detail': "The 2024 Fall Season Championship at Falmouth Country Club was the first event where the Boston Eaglets Club volunteered together on the course. Our team helped raise over $2,000 for the foundation to support future tournaments. These funds will help U.S. Kids Golf host upcoming events at higher-quality courses and create even better experiences for junior golfers in the seasons ahead.A big thank-you to all the volunteers who helped make this event a success — and we can't wait to see even more young golfers join us next season!"},
    {'title':'2025 Boston Fall Fundraising Event 🎃⛳', 'time': '2025-10-25', 'detail': """What a weekend at Falmouth Country Club! Perfect weather, great swings, and plenty of Halloween spirit made it a truly memorable Fall Season Championship. The kids had a blast (and yes, we made sure to have plenty of candy 🍬).We're thrilled to share that we raised over $2,100 for the U.S. Kids Golf Foundation — helping support future tournaments and create even more amazing experiences for junior golfers.A huge thank-you to all the volunteers and families who made this event such a success. See you next season — until then, keep swinging and have a spooktacular Halloween! 👻"""}
)
for item in EVENTS_PAST:
    item['short']= item['detail']
    item['short']=item['short'].split(".")
    item['short'] = item['short'][0]+ "."+item['short'][1]+'.'

EVENTS_FUTURE =(
    {'title':'Fundraising at Us Kids 2026 Fall Season Championship', 'time': '2026-10-25', 'detail': 'Future event at Falmouth Country Club.'},
)

for item in EVENTS_FUTURE: 
    item['short']= item['detail']
    item['short']=item['short'].split(".")
    item['short'] = item['short'][0]+ "."+(item['short'][1]+'.' if item['short'][1] else '')

@route('/')
def homepage():
    return template('index', NAVBAR=NAVBAR, recaps=get_recaps()[0:5], album=get_album()[0:5], EVENTS_PAST=EVENTS_PAST, EVENTS_FUTURE=EVENTS_FUTURE)

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

def generate_thumbnail(image_path):
    """
    Generate a thumbnail for an image.

    :param image_path: Path to the original image (e.g., "./static/album/xxx.jpg")
    :param size: Desired thumbnail size (width, height)
    :return: Path to the saved thumbnail
    """
    # Ensure output folder exists
    thumb_dir = "./static/thumb"
    os.makedirs(thumb_dir, exist_ok=True)

    # Extract filename
    filename = os.path.basename(image_path)
    thumb_path = os.path.join(thumb_dir, filename)

    # Open and generate thumbnail
    with Image.open(image_path) as img:
        # Correct orientation using EXIF data if available
        try:
            exif = img._getexif()
            if exif is not None:
                for tag, value in exif.items():
                    if tag == 274:  # Orientation tag
                        if value == 3:
                            img = img.rotate(180, expand=True)
                        elif value == 6:
                            img = img.rotate(270, expand=True)
                        elif value == 8:
                            img = img.rotate(90, expand=True)
        except (AttributeError, KeyError, IndexError):
            # No EXIF data or EXIF doesn't have orientation info
            pass
        img.thumbnail((400, img.height*400/img.width))
        img.save(thumb_path, "JPEG")

    return thumb_path

def get_album():
    l=list(os.walk("./static/album"))[0][2]
    l=filter(lambda x:x!='.DS_Store', l)
    s=[[int(f.split('.')[0]),f] for f in l]
    s=sorted(s,key=lambda x:x[0], reverse=True)
    s=[item[1] for item in s]
    for item in s:
        generate_thumbnail('./static/album/'+item)
    return s

@route('/api/events_past')
def api_events_past():
    return json.dumps(EVENTS_PAST)

@route('/api/events_future')
def api_events_past():
    return json.dumps(EVENTS_FUTURE)

@route('/gallery')
def gallery():
    return template('gallery', NAVBAR=NAVBAR, album=get_album())

def get_recaps():
    l=list(os.walk("./recaps"))[0][2]
    l=filter(lambda x:x!='.DS_Store', l)
    s=[[f.split('.')[0],f] for f in l]
    s=sorted(s,key=lambda x:x[0], reverse=True)
    return s

@route('/cr')
def cr():
    return template('article_list', NAVBAR=NAVBAR, recaps=get_recaps())

@route('/crc/<name>')
def crc (name):
    with open('recaps/'+name+'.md', 'r', encoding='utf-8') as f:
        t=f.read()
        html = markdown.markdown(t)
        return template('specificarticle', NAVBAR=NAVBAR, html=html, title=name)

if __name__ == '__main__':
    run(host='0.0.0.0', port=80)