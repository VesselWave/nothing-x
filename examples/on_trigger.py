"""Example arbitrary action: record a bookmark each time the buds trigger."""
import datetime,pathlib
path=pathlib.Path.home()/'buds-bookmarks.txt'
with path.open('a') as stream:stream.write(datetime.datetime.now().astimezone().isoformat()+' — earbud trigger\n')
print('Bookmark added:',path,flush=True)
