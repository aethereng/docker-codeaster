def configure(self):
    opts = self.options

    # self.env.append_value('CXXFLAGS', ['-D_GLIBCXX_USE_CXX11_ABI=0'])
    self.env['ADDMEM'] = 600

    self.env['TFELHOME'] = '/aster/tfel'
    self.env['TFELVERS'] = '3.2.1'
    self.env['CATALO_CMD'] = "DUMMY="

    self.env.append_value('LIBPATH', [
        '/aster/hdf5/lib',
        '/aster/med/lib',
        '/aster/metis/lib',
        '/aster/mumps_seq/lib',
        '/aster/scotch_seq/lib',
        '/aster/tfel/lib',
    ])

    self.env.append_value('INCLUDES', [
        '/aster/hdf5/include',
        '/aster/med/include',
        '/aster/metis/include',
        '/aster/mumps_seq/include',
        '/aster/mumps_seq/include_seq',
        '/aster/scotch_seq/include',
        '/aster/tfel/include',
    ])

    # to fail if not found
    opts.enable_hdf5 = True
    opts.enable_med = True
    opts.enable_metis = True
    opts.enable_mumps = True
    opts.enable_scotch = True
    opts.enable_mfront = True
