def configure(self):
    opts = self.options

    # self.env['ADDMEM'] = 2800

    self.env['TFELHOME'] = '/aster/tfel'
    self.env['TFELVERS'] = '3.4.0'
    self.env['CATALO_CMD'] = "DUMMY="
    
    self.env.INCLUDES_BOOST = '/usr/include'
    self.env.LIBPATH_BOOST = ['/usr/lib/x86_64-linux-gnu']
    self.env.LIB_BOOST = ['boost_python3']
    self.env.WAFBUILD_ENV = ['/aster/aster/lib/dummy.env']

    self.env.append_value('LIBPATH', [       
        '/aster/hdf5/lib',
        '/aster/med/lib',
        '/aster/metis/lib',
        '/aster/parmetis/lib',
        '/aster/petsc/lib',
        '/aster/mumps_mpi/lib',
        '/aster/scotch_mpi/lib',
        '/aster/tfel/lib',
    ])

    self.env.append_value('INCLUDES', [
        '/aster/hdf5/include',
        '/aster/med/include',
        '/aster/metis/include',
        '/aster/parmetis/include',
        '/aster/petsc/include',
        '/aster/mumps_mpi/include',
        '/aster/mumps_mpi/include_seq',
        '/aster/scotch_mpi/include',
        '/aster/tfel/include'
    ])

    # to fail if not found
    opts.parallel = True
    opts.enable_petsc = True
    opts.enable_hdf5 = True
    opts.enable_med = True
    opts.enable_metis = True
    opts.enable_mumps = True
    opts.enable_scotch = True
    opts.enable_mfront = True
    
    # opts.mpiexec = "mpirun -np %(mpi_nbcpu)s --hostfile %(mpi_hostfile)s %(program)s --allow-run-as-root"
    # opts.mpi_get_rank = "echo ${OMPI_COMM_WORLD_RANK}"
    # opts.addmem = 4096