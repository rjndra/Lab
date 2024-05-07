from mrjob.job import MRJob

from mrjob.step import MRStep

class BigData(MRJob):

    def steps(self):
        step1 = MRStep(mapper = self.mapper_first, reducer = self.reducer_first)
        step2 = MRStep(mapper = self.mapper_second, reducer = self.reducer_second)
        return [step1,step2]

    def mapper_first(self, key, value) : # collect required data, tranformation and filtering 
        # initializing punctuations string
        punc = '''!()-[]{};:'"\,<>./?@#$%^&*_~'''
        for x in value:
            if x in punc:
                value = value.replace(x, "")
        words = value.split()

        for word in words:
            yield word, 1

    def reducer_first(self, word, count): # reduce values ma matra huncha # sort and group
        yield word, sum(count)

    def mapper_second(self, word, count):
        yield "%04d"%int(count), word

    def reducer_second(self, count, word):
        for w in word:
            yield count, w 


if __name__ == "__main__":
    BigData.run()
