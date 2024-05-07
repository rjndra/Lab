from mrjob.job import MRJob

class BigData(MRJob):

    def mapper(self, key, value) : # collect required data, tranformation and filtering 
        (id,timestamp,type,temp,x,y,z,cat) = value.split(",")
        if type == "TMIN":
            yield id, temp

    def reducer(self, key, value):
        yield key, min(value)

if __name__ == "__main__":
    BigData.run()
