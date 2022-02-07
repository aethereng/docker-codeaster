import scif_std

def configure(self):
    opts = self.options
    opts.parallel = True

    scif_std.configure(self)

    self.env.prepend_value('LIBPATH', [
        '/scif/apps/mumps_mpi/lib',
        '/scif/apps/parmetis/lib',
        '/scif/apps/petsc/lib',
        '/scif/apps/scotch_mpi/lib',
    ])

    self.env.prepend_value('INCLUDES', [
        '/scif/apps/mumps_mpi/include',
        '/scif/apps/parmetis/include',
        '/scif/apps/petsc/include',
        '/scif/apps/scotch_mpi/include',
    ])

    # to fail if not found
    opts.enable_petsc = True
