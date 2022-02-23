import scif_std

def configure(self):
    opts = self.options
    opts.parallel = True

    scif_std.configure(self)

    self.env.prepend_value('LIBPATH', [
        '/aster/mumps_mpi/lib',
        '/aster/parmetis/lib',
        '/aster/petsc/lib',
        '/aster/scotch_mpi/lib',
    ])

    self.env.prepend_value('INCLUDES', [
        '/aster/mumps_mpi/include',
        '/aster/parmetis/include',
        '/aster/petsc/include',
        '/aster/scotch_mpi/include',
    ])

    # to fail if not found
    opts.enable_petsc = True
