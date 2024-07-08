class HelloMessage:
    @property
    def class_name(self):
        return self.__class__.__name__.upper()