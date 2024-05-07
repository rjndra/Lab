from mrjob.job import MRJob
from mrjob.job import MRStep

class BigData(MRJob):

    def steps(self):
        step1 = MRStep(mapper = self.mapper_first, reducer = self.reducer_first)
        step2 = MRStep(reducer = self.reducer_second)
        return [step1,step2]

    def mapper_first(self, key, value):
        (user_id, movie_id, rating, timestamp) = value.split("\t")
        yield movie_id, 1

    def reducer_first(self, id, count):
        yield None, (sum(count), id)


    def reducer_second(self, _, value):
        yield max(value)

if __name__ == "__main__":
    BigData.run()