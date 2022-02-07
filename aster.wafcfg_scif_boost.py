def configure(self):
    self.env.INCLUDES_BOOST = '/usr/include'
    self.env.LIBPATH_BOOST = ['/usr/lib/x86_64-linux-gnu']
    self.env.LIB_BOOST = ['boost_python3']
