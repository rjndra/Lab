from mrjob.job import MRJob

class BigData(MRJob):

    def mapper(self, key, value) : # collect required data, tranformation and filtering 
        words = value.split()
        for word in words:
            yield word, 1

    def reducer(self, key, value): # reduce values ma matra huncha # sort and group
        yield key, sum(value)

if __name__ == "__main__":
    BigData.run()
