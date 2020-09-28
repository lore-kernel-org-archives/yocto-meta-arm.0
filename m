Subject: Re: [PATCH 1/2] arm-autonomy/wic: Introduce empty plugin to create unformatted empty partitions
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Austin, Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 28 Sep 2020 07:27:12 -0700
References: <20200928004832.GQ19155@denix.org>
In-Reply-To: <20200928004832.GQ19155@denix.org>
Message-ID: <17472.1601303232156660015@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 01:48 AM, Denys Dmytriyenko wrote:

>
> Seems generic - should this be submitted to oe-core?

Hello Denys.

Yes, I'll be pushing this to oe-core (with the appropriated documentation)=
 after the Gatesgarth release.

Cheers,

--
Diego Sueiro

>=20
> --=20
> Denys
>=20
>=20
> On Fri, Sep 25, 2020 at 12:15:46PM +0100, Diego Sueiro wrote:
> > The empty wic plugin is used to create unformatted empty partitions fo=
r wic
> > images.
> >=20
> > To use it you must pass "empty" as argument for the "--source" paramet=
er in
> the
> > wks file. For example:
> > part foo --source empty --ondisk sda --size=3D"1024" --align 1024
> >=20
> > Change-Id: I0155561e9cc2ac11159e181eec9e4d9ae11555c3
> > Issue-Id: SCM-889
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  .../scripts/lib/wic/plugins/source/empty.py        | 32
> ++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644
> meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> >=20
> > diff --git a/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> b/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> > new file mode 100644
> > index 0000000..041617d
> > --- /dev/null
> > +++ b/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> > @@ -0,0 +1,32 @@
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +# The empty wic plugin is used to create unformatted empty partitions=
 for
> wic
> > +# images.
> > +# To use it you must pass "empty" as argument for the "--source" para=
meter
> in
> > +# the wks file. For example:
> > +# part foo --source empty --ondisk sda --size=3D"1024" --align 1024
> > +
> > +import logging
> > +
> > +from wic.pluginbase import SourcePlugin
> > +
> > +logger =3D logging.getLogger('wic')
> > +
> > +class EmptyPartitionPlugin(SourcePlugin):
> > +    """
> > +    Populate unformatted empty partition.
> > +    """
> > +
> > +    name =3D 'empty'
> > +
> > +    @classmethod
> > +    def do_prepare_partition(cls, part, source_params, cr, cr_workdir=
,
> > +                             oe_builddir, bootimg_dir, kernel_dir,
> > +                             rootfs_dir, native_sysroot):
> > +        """
> > +        Called to do the actual content population for a partition i.=
e. it
> > +        'prepares' the partition to be incorporated into the image.
> > +        """
> > +        return
> > --=20
> > 2.7.4
> >=20
>=20
> >=20
> >=20
> >=20
>=20
>
