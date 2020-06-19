Subject: Re: [PATCH 1/2] arm-autonomy, xenguest: Fail if Dom0 is not properly initialized
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 18 Jun 2020 22:10:33 -0700
References: <20200618221917.GC22389@kudzu.us>
In-Reply-To: <20200618221917.GC22389@kudzu.us>
Message-ID: <13446.1592543433908130464@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 11:19 PM, Jon Mason wrote:

>
> On Wed, Jun 17, 2020 at 07:02:23AM +0100, Diego Sueiro wrote:
> > During the xenguest initialization and when invoking the
> > xenguest-manager tool, abort the execution if Dom0 was not properly
> > initialized on top of Xen and with the proper kernel configurations.
> >=20
> > Change-Id: I307c03e58a266a943968df1bc5ba39951912d2cb
> > Issue-Id: SCM-996
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>=20
> Series pulled in to the master branch.

Thanks. Can you please backport it to dunfell?

>=20
> Thanks,
> Jon
>=20
> > ---
> >  .../recipes-extended/xenguest/files/xenguest-init      |  3 +++
> >  .../recipes-extended/xenguest/files/xenguest-manager   | 18
> ++++++++++++++++++
> >  2 files changed, 21 insertions(+)
> >=20
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xengues=
t-init
> b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> > index 9563d2f..cd249cf 100755
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> > @@ -12,6 +12,9 @@ fi
> >  
> >  source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
> >  
> > +# Make sure we properly initialized the Dom0
> > +/usr/bin/xenguest-manager check-xen || exit $?
> > +
> >  # Create guest list
> >  guestlist=3D$(/usr/bin/xenguest-manager list)
> >  
> > diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > index 99975a2..6a10d35 100755
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manag=
er
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manag=
er
> > @@ -566,6 +566,24 @@ case ${cmd} in
> >          usage
> >          exit 0
> >          ;;
> > +
> > +esac
> > +
> > +# Check if we have a valid Dom0 booted with Xen
> > +ERROR_MSG=3D$(xl info 2>&1)
> > +if [ $? -ne 0 ]; then
> > +    echo "ERROR: Xen environment is not valid!!!" | tee -a ${LOGFILE}
> > +    echo "ERROR: Check if Xen has booted and the kernel configuration=
." \
> > +        | tee -a ${LOGFILE}
> > +    echo "ERROR: Output from 'xl info' command:" | tee -a ${LOGFILE}
> > +    echo "$ERROR_MSG" | tee -a ${LOGFILE}
> > +    exit 1
> > +fi
> > +
> > +case ${cmd} in
> > +    check-xen)
> > +        exit 0
> > +        ;;
> >      create)
> >          guestfile=3D"${arg1}"
> >          guestname=3D"${arg2}"
> > --=20
> > 2.7.4
> >=20
>=20
> >=20
>=20
>
