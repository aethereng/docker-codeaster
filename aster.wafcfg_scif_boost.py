import platform

def configure(self):
    self.env.INCLUDES_BOOST = '/usr/include'
    self.env.LIBPATH_BOOST = ['/usr/lib/%s-linux-gnu' % platform.machine()]
    self.env.LIB_BOOST = ['boost_python3']
