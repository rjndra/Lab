from mrjob.job import MRJob
from mrjob.job import MRStep

class BigData(MRJob):

    def steps(self):
        step1 = MRStep(mapper = self.mapper_first, reducer = self.reducer_first)
        step2 = MRStep(mapper = self.mapper_second, reducer = self.reducer_second)
        return [step1,step2]

    def mapper_first(self, key, value):
        (cust_id, order_id, price) = value.split(",")
        yield cust_id, float(price)

    def reducer_first(self, cust_id, amount):
        yield cust_id,sum(amount)

    def mapper_second(self, cust_id, amount):
        yield amount, cust_id

    def reducer_second(self, amount, cust_id):
        for id in cust_id:
            yield amount, id

if __name__ == "__main__":
    BigData.run()
