import requests

def getMovieTitles(substr):
    url='https://jsonmock.hackerrank.com/api/movies/search/?Title=substr'

    #replace the substr with parameter
    url = url.replace('substr', substr)
    #get data from the url using the requests lib
    response = requests.get(url)

    #get a list for the key:data from the url
    response_data = response.json()['data']

    #Using List Comprehension to get the titles array
    titles = [data.get('Title') for data  in response_data]

    #Sort the array
    titles.sort()
    print (titles)

    return titles


if __name__ == '__main__':
    getMovieTitles('superman')